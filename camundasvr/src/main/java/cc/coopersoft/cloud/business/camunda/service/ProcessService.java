package cc.coopersoft.cloud.business.camunda.service;

import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.rest.ProcessInstanceRestService;
import org.camunda.bpm.engine.rest.impl.ProcessInstanceRestServiceImpl;
import org.camunda.bpm.engine.task.Task;
import org.springframework.stereotype.Service;

@Service
public class ProcessService {


    private final RuntimeService runtimeService;

    private final TaskService taskService;

    public ProcessService(RuntimeService runtimeService, TaskService taskService) {
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
}
