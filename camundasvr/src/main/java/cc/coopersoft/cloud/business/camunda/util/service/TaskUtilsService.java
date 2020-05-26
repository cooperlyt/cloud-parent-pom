package cc.coopersoft.cloud.business.camunda.util.service;

import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.rest.dto.task.TaskDto;
import org.camunda.bpm.engine.task.Task;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TaskUtilsService {

    private final RuntimeService runtimeService;

    private final TaskService taskService;

    public TaskUtilsService(RuntimeService runtimeService, TaskService taskService) {
        this.runtimeService = runtimeService;
        this.taskService = taskService;
    }

    public void setTaskVariable(String id, String name, Object value){
        taskService.setVariable(id,name,value);
    }

    public String getActiveBusinessKeyByTaskId(String id){
        Task task = taskService.createTaskQuery().taskId(id).active().singleResult();


        String processInstanceId = task.getProcessInstanceId();
        return runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getBusinessKey();
    }


    public List<TaskDto> getActiveTasksByBusinessKey(String businessKey){
        return taskService.createTaskQuery().processInstanceBusinessKey(businessKey).active().list().stream().map(TaskDto::fromEntity).collect(Collectors.toList());
    }
}
