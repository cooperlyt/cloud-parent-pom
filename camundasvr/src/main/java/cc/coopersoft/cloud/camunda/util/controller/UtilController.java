package cc.coopersoft.cloud.camunda.util.controller;


import cc.coopersoft.cloud.camunda.util.service.RestUtilService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.Map;

@RestController
@RequestMapping(value="/adapter/utils")
@Slf4j
public class UtilController {

    private final RestUtilService restUtilService;

    public UtilController(RestUtilService restUtilService) {
        this.restUtilService = restUtilService;
    }

    @RequestMapping(value = "define/process/{processDefinitionId}/task/{taskDefinitionKey}/extensions", method = RequestMethod.GET)
    public Map<String,String> getTaskExtensions(
            @PathVariable("processDefinitionId") String processDefinitionId,
            @PathVariable("taskDefinitionKey") String taskDefinitionKey){
        return restUtilService.userTaskExtension(processDefinitionId, taskDefinitionKey);
    }

    @RequestMapping(value = "define/process/{processDefinitionId}/task/{taskDefinitionKey}/extensions/{key}", method = RequestMethod.GET)
    public String getTaskExtensions(
            @PathVariable("processDefinitionId") String processDefinitionId,
            @PathVariable("taskDefinitionKey") String taskDefinitionKey,
            @PathVariable("key") String key){
        String result = restUtilService.userTaskExtension(processDefinitionId, taskDefinitionKey, key);
        if (result == null){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return result;
    }

}
