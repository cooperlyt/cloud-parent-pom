package cc.coopersoft.cloud.camunda.business.construct.fire.delegate;

import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.JavaDelegate;
import org.camunda.bpm.engine.impl.persistence.entity.VariableInstanceEntityFactory;
import org.camunda.bpm.engine.impl.persistence.entity.VariableInstanceManager;
import org.camunda.bpm.engine.variable.Variables;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@Slf4j
public class FireApplyDelegate implements JavaDelegate {
    @Override
    public void execute(DelegateExecution execution) throws Exception {


        for(Map.Entry<String,Object> p :   execution.getProcessEngineServices().getRuntimeService().getVariables(execution.getId()).entrySet()){
            log.debug("FireApplyDelegate");
            log.debug(p.getKey() + ":" + p.getValue());
        }




    }
}
