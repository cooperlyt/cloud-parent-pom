package cc.coopersoft.cloud.business.camunda.construct.fire.delegate;

import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.JavaDelegate;
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
