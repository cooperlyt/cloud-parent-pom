package cc.coopersoft.cloud.camunda.business.services;

import cc.coopersoft.cloud.camunda.business.model.BusinessDefine;
import cc.coopersoft.cloud.camunda.business.repository.BusinessDefineRepository;
import org.springframework.stereotype.Service;

@Service
public class BusinessDefineService {

    private final BusinessDefineRepository businessDefineRepository;

    public BusinessDefineService(BusinessDefineRepository businessDefineRepository) {
        this.businessDefineRepository = businessDefineRepository;
    }

    public BusinessDefine businessDefine(String id){
        return businessDefineRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("define not found by id:" + id));
    }



}
