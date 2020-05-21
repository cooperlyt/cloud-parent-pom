package cc.coopersoft.cloud.business.camunda.util.service;

import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.model.bpmn.BpmnModelInstance;
import org.camunda.bpm.model.bpmn.instance.UserTask;
import org.camunda.bpm.model.bpmn.instance.camunda.CamundaProperties;
import org.camunda.bpm.model.bpmn.instance.camunda.CamundaProperty;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service
public class RestUtilService {

    private final RepositoryService repositoryService;

    public RestUtilService(RepositoryService repositoryService) {
        this.repositoryService = repositoryService;
    }

    private Collection<CamundaProperty> userTaskExtensionProperties(String processDefinitionId, String taskDefinitionKey){
        BpmnModelInstance bpmnModelInstance = repositoryService.getBpmnModelInstance(processDefinitionId);

        Collection<UserTask> userTaskDefs = bpmnModelInstance.getModelElementsByType(UserTask.class);
        for (UserTask userTaskDef : userTaskDefs) {
            if (userTaskDef.getId().equals(taskDefinitionKey)) {
                CamundaProperties extensionsProperty = userTaskDef.getExtensionElements()//
                        .getElementsQuery()//
                        .filterByType(CamundaProperties.class)//
                        .singleResult();
                return extensionsProperty.getCamundaProperties();

            }
        }
        return null;
    }

    public Map<String,String> userTaskExtension(String processDefinitionId, String taskDefinitionKey) {

        Collection<CamundaProperty> properties = userTaskExtensionProperties(processDefinitionId,taskDefinitionKey);
        if (properties == null){
            return new HashMap<>(0);
        }
        Map<String,String> result = new HashMap<>();
        for (CamundaProperty property : properties) {
            result.put(property.getCamundaName(), property.getCamundaValue());
        }
        return result;
    }

    public String userTaskExtension(String processDefinitionId, String taskDefinitionKey, String key ){
        Collection<CamundaProperty> properties = userTaskExtensionProperties(processDefinitionId,taskDefinitionKey);
        if (properties == null){
            return null;
        }
        for (CamundaProperty property : userTaskExtensionProperties(processDefinitionId,taskDefinitionKey)) {
            if (property.getCamundaName().equals(key)){
                return property.getCamundaValue();
            }
        }
        return null;
    }


}
