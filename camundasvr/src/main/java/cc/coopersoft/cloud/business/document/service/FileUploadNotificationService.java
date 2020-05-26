package cc.coopersoft.cloud.business.document.service;

import cc.coopersoft.cloud.business.document.model.BusinessFile;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Deprecated
@Component
@Slf4j
public class FileUploadNotificationService {

     @Data
     @NoArgsConstructor
     public static class WebSource{
          private long doc;
          private List<BusinessFile> files = new ArrayList<>();
     }

     public static final List<SseEmitter> emitters = Collections.synchronizedList(new ArrayList<>());


     public  SseEmitter initSseEmitters(){
          SseEmitter emitter = new SseEmitter(60 * 60 * 1000L);
          emitters.add(emitter);
          emitter.onCompletion(() -> emitters.remove(emitter));

          return emitter;
     }

     public void testSend(long id){
          WebSource test = new WebSource();
          test.doc = id;

          this.sendSseEventsToUI(test);
     }

     public void sendSseEventsToUI(WebSource notification){

          List<SseEmitter> sseEmitterListToRemove = new ArrayList<>();
          this.emitters.forEach((SseEmitter emitter) -> {
               try {
                    emitter.send(notification, MediaType.APPLICATION_JSON);
               } catch (IOException e) {
                    emitter.complete();
                    sseEmitterListToRemove.add(emitter);
                    log.error("notification error", e);
               }
          });
          this.emitters.removeAll(sseEmitterListToRemove);
     }
}
