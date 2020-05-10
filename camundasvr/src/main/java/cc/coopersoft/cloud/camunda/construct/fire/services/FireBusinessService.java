package cc.coopersoft.cloud.camunda.construct.fire.services;

import cc.coopersoft.cloud.camunda.business.model.Business;
import cc.coopersoft.cloud.camunda.business.model.BusinessDescription;
import cc.coopersoft.cloud.camunda.business.services.BusinessDefineService;
import cc.coopersoft.cloud.camunda.business.services.BusinessService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class FireBusinessService {

    private final BusinessDefineService defineService;

    private final BusinessService businessService;

    public FireBusinessService(BusinessDefineService defineService, BusinessService businessService) {
        this.defineService = defineService;
        this.businessService = businessService;
    }

    public Business start(long businessId, String defineId, BusinessDescription description){
        Map<String,Object> variables = new HashMap<>();
        variables.put("reapply",false);
        variables.put("approved",true);
        variables.put("description",description.getDescription());
        variables.put("define", defineId);
        variables.put("_key",description.getKeys());

        return businessService.start(businessId,defineId,description, variables);
    }
}
