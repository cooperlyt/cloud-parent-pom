package cc.coopersoft.cloud.business.camunda.util.controller;


import cc.coopersoft.cloud.business.camunda.util.service.RepositoryUtilService;
import cc.coopersoft.cloud.business.camunda.util.service.TaskUtilsService;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.rest.dto.task.TaskDto;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value="/adapter/utils")
@Slf4j
public class UtilController {

    private final RepositoryUtilService repositoryUtilService;

    private final TaskUtilsService taskUtilsService;

    public UtilController(RepositoryUtilService repositoryUtilService, TaskUtilsService taskUtilsService) {
        this.repositoryUtilService = repositoryUtilService;
        this.taskUtilsService = taskUtilsService;
    }

    @RequestMapping(value = "define/process/{processDefinitionId}/task/{taskDefinitionKey}/extensions", method = RequestMethod.GET)
    public Map<String,String> getTaskExtensions(
            @PathVariable("processDefinitionId") String processDefinitionId,
            @PathVariable("taskDefinitionKey") String taskDefinitionKey){
        return repositoryUtilService.userTaskExtension(processDefinitionId, taskDefinitionKey);
    }

    @RequestMapping(value = "define/process/{processDefinitionId}/task/{taskDefinitionKey}/extensions/{key}", method = RequestMethod.GET)
    public String getTaskExtensions(
            @PathVariable("processDefinitionId") String processDefinitionId,
            @PathVariable("taskDefinitionKey") String taskDefinitionKey,
            @PathVariable("key") String key){
        String result = repositoryUtilService.userTaskExtension(processDefinitionId, taskDefinitionKey, key);
        if (result == null){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return result;
    }

    @RequestMapping(value = "business/key/{key}/tasks", method = RequestMethod.GET)
    public List<TaskDto> getTasksByBusinessKey(@PathVariable("key") String businessKey){
        return taskUtilsService.getActiveTasksByBusinessKey(businessKey);
    }
    //public List<TaskDto>

}
