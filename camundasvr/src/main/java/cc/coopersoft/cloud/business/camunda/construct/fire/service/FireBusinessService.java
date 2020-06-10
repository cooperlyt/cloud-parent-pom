package cc.coopersoft.cloud.business.camunda.construct.fire.service;

import cc.coopersoft.cloud.business.camunda.construct.fire.delegate.FireCheckBusinessChannel;
import cc.coopersoft.cloud.business.model.Business;
import cc.coopersoft.cloud.business.model.BusinessDescription;
import cc.coopersoft.cloud.business.services.BusinessService;
import cc.coopersoft.common.construct.fire.business.Messages;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
@EnableBinding(FireCheckBusinessChannel.class)
public class FireBusinessService {

    private final BusinessService businessService;

    private final FireCheckBusinessChannel fireCheckBusinessChannel;

    public FireBusinessService(BusinessService businessService, FireCheckBusinessChannel fireCheckBusinessChannel) {
        this.businessService = businessService;
        this.fireCheckBusinessChannel = fireCheckBusinessChannel;
    }

    public Business start(long businessId, String defineId, BusinessDescription description){
        Map<String,Object> variables = new HashMap<>();
        variables.putAll(description.getDescriptionMap());
        variables.put("reapply",false);
        variables.put("approved",true);
        //variables.put("description",description.getDescription());
        variables.put("define", defineId);
        variables.put("_key",description.getKeys());
        variables.put("_full",BusinessDescription.Source.Outside.equals(description.getSource()));


        return businessService.start(businessId,defineId,description, variables);
    }

    public void businessNotify(Messages messages){
        fireCheckBusinessChannel.output().send(MessageBuilder.withPayload(messages).build());
        log.debug("notify: fire check notify: " +  messages);
    }

}
