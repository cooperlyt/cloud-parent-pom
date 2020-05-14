package cc.coopersoft.cloud.camunda.business.services;

import cc.coopersoft.cloud.camunda.business.model.*;
import cc.coopersoft.cloud.camunda.business.repository.BusinessOperationRepository;
import cc.coopersoft.cloud.camunda.business.repository.BusinessRepository;
import com.fasterxml.jackson.annotation.JsonValue;
import com.github.wujun234.uid.UidGenerator;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.Version;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.spring.boot.starter.event.ExecutionEvent;
import org.camunda.bpm.spring.boot.starter.event.TaskEvent;
import org.springframework.context.event.EventListener;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.Fetch;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;

@Service
@Slf4j
public class BusinessService {

    private final static  int PAGE_SIZE = 20;

    private final BusinessOperationRepository operationRepository;
    private final BusinessRepository businessRepository;
    private final BusinessDefineService defineService;
    private final LoginInfoService loginInfoService;

    private final RuntimeService runtimeService;

    @Resource
    private UidGenerator defaultUidGenerator;

    public BusinessService(BusinessOperationRepository operationRepository,
                           BusinessRepository businessRepository,
                           BusinessDefineService defineService,
                           LoginInfoService loginInfoService, RuntimeService runtimeService) {
        this.operationRepository = operationRepository;
        this.businessRepository = businessRepository;
        this.defineService = defineService;
        this.loginInfoService = loginInfoService;
        this.runtimeService = runtimeService;
    }

    @EventListener
    public void notify(final TaskEvent taskEvent) {
        log.debug("task event: id: {}; name: {}; eventName:{}; executionId:{}; caseExecutionId:{}; owner: {}; taskDefinitionKey:{};" +
                        "getAssignee:{}; getCaseDefinitionId:{};getCaseInstanceId:{} " ,
                taskEvent.getId(), taskEvent.getName(),
                taskEvent.getEventName(), taskEvent.getExecutionId(),
                taskEvent.getCaseExecutionId(), taskEvent.getOwner(),
                taskEvent.getTaskDefinitionKey() , taskEvent.getAssignee(),
                taskEvent.getCaseDefinitionId(),
                taskEvent.getCaseInstanceId());

    }

    @EventListener
    public void notify(final ExecutionEvent executionEvent){
        log.debug("execution event :getEventName:{}; getActivityInstanceId:{}; getId:{}; getCurrentActivityId:{};" +
                        "getCurrentActivityName:{};getCurrentTransitionId:{};getBusinessKey:{};" +
                        "getProcessBusinessKey:{};getParentActivityInstanceId:{};getParentId:{}",
                executionEvent.getEventName(),
                executionEvent.getActivityInstanceId(),
                executionEvent.getId(), executionEvent.getCurrentActivityId(),
                executionEvent.getCurrentActivityName(), executionEvent.getCurrentTransitionId(),
                executionEvent.getBusinessKey(), executionEvent.getProcessBusinessKey(),
                executionEvent.getParentActivityInstanceId(), executionEvent.getParentId());
    }


    private BusinessOperation createOperation(Business business,BusinessOperation.Type type, String taskName, String description){


        LoginInfoService.LoginInfo loginInfo = loginInfoService.loginInfo();

        BusinessOperation result = new BusinessOperation();
        result.setId(defaultUidGenerator.getUID());
        result.setTime(new Date());
        result.setType(type);
        result.setEmpId(loginInfo.getId());
        result.setEmpName(loginInfo.getName());
        result.setTaskName(taskName);
        result.setDescription(description);
        result.setBusiness(business);

        return result;
    }


    @Transactional
    public Business start(long businessId, String defineId, BusinessDescription description,Map<String, Object> variables){
        BusinessDefine define = defineService.businessDefine(defineId);

        Business business = new Business();
        business.setId(businessId);
        business.setDefine(defineId);
        business.setName(define.getName());

        try {
            Template template = new Template("strTpl", define.getDescription(), new Configuration(new Version("2.3.26")));
            StringWriter stringWriter = new StringWriter();
            template.process(description.getDescriptionMap(), stringWriter);
            description.setDescription(stringWriter.toString());
        }catch (IOException | TemplateException e){
            throw new IllegalArgumentException("description fail!",e);
        }


        description.setId(businessId);
        for (BusinessKey key: description.getBusinessKeys()){
            key.getId().setDescription(description);
        }
        business.setDescription(description);
        business.setCreateTime(new Date());
        if (description.isProcess()){
            business.setStatus(Business.Status.RUNNING);
            runtimeService.startProcessInstanceByKey(define.getProcess(),
                    String.valueOf(businessId),String.valueOf(businessId),variables);
        }else{
            business.setStatus(Business.Status.COMPLETED);
            business.setCompletedTime(new Date());
        }
        business.getOperations().add(createOperation(business,BusinessOperation.Type.CREATE,null,null));



        return businessRepository.save(business);

    }

    public Page<Business> businesses(int page, boolean valid , Optional<String> key){

        Specification<Business> specification = (Specification<Business>) (root, criteriaQuery,cb) ->{

            List<Predicate> predicates = new LinkedList<>();
            Join<Business, BusinessDescription> descriptionJoin;
            if (criteriaQuery.getResultType().equals(Long.class)){
                descriptionJoin = root.join("description", JoinType.INNER);
            }else{
                Fetch<Business, BusinessDescription> fetch = root.fetch("description", JoinType.LEFT);
                descriptionJoin = (Join<Business, BusinessDescription>) fetch;
            }

            key.ifPresent((k) -> {
                if (StringUtils.isNotBlank(k)){
                    predicates.add(cb.or(cb.equal(root.get("id").as(String.class), k), cb.like(descriptionJoin.get("keys"), "%" + k + "%")));
                }
            });

            if (valid){
                predicates.add(cb.and(cb.notEqual(root.get("status").as(Business.Status.class),Business.Status.ABORT)));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
        return businessRepository.findAll(specification,PageRequest.of(page,PAGE_SIZE, Sort.by("createTime")));

    }

    public List<BusinessOperation> operations(long businessId){
        return operationRepository.findByBusinessIdOrderByTime(businessId);

    }
}
