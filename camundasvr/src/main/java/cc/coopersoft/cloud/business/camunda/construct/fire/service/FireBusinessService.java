package cc.coopersoft.cloud.business.camunda.construct.fire.service;

import cc.coopersoft.cloud.business.model.Business;
import cc.coopersoft.cloud.business.model.BusinessDescription;
import cc.coopersoft.cloud.business.services.BusinessService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class FireBusinessService {

    private final BusinessService businessService;

    public FireBusinessService(BusinessService businessService) {
        this.businessService = businessService;
    }

    public Business start(long businessId, String defineId, BusinessDescription description){
        Map<String,Object> variables = new HashMap<>();
        variables.put("reapply",false);
        variables.put("approved",true);
        variables.put("description",description.getDescription());
        variables.put("define", defineId);
        variables.put("_key",description.getKeys());
        variables.put("_full",BusinessDescription.Source.Outside.equals(description.getSource()));


        return businessService.start(businessId,defineId,description, variables);
    }
}
