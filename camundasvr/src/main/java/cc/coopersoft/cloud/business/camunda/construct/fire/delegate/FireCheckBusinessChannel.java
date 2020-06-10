package cc.coopersoft.cloud.business.camunda.construct.fire.delegate;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

public interface FireCheckBusinessChannel {

    static String channelName = "fireCheckBusiness";

    @Output(channelName)
    MessageChannel output();
}
