package cc.coopersoft.cloud.business.camunda.construct.fire.delegate;

import cc.coopersoft.cloud.business.camunda.construct.fire.service.FireBusinessService;
import cc.coopersoft.common.construct.fire.business.Messages;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class FireApplyDelegate extends MessageNotifyDelegate {


    public FireApplyDelegate(FireBusinessService fireBusinessService) {
        super(fireBusinessService);
    }

    @Override
    protected Messages.Type getType() {
        return Messages.Type.Accept;
    }
}
