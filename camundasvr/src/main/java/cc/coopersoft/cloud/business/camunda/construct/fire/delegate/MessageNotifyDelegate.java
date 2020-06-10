package cc.coopersoft.cloud.business.camunda.construct.fire.delegate;

import cc.coopersoft.cloud.business.camunda.construct.fire.service.FireBusinessService;
import cc.coopersoft.common.construct.fire.business.Messages;
import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.JavaDelegate;

public abstract class MessageNotifyDelegate implements JavaDelegate {

    private final FireBusinessService fireBusinessService;

    public MessageNotifyDelegate(FireBusinessService fireBusinessService) {
        this.fireBusinessService = fireBusinessService;
    }

    protected abstract Messages.Type getType();

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        Messages messages = Messages.builder()
                .id(Long.parseLong(execution.getProcessBusinessKey()))
                .type(getType())
                .memo(String.valueOf(execution.getVariable("comment"))).build();

        fireBusinessService.businessNotify(messages);
    }
}
