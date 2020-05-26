package cc.coopersoft.cloud.business.document.controller;

import cc.coopersoft.cloud.business.document.model.BusinessFile;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import cc.coopersoft.cloud.business.document.service.FileUploadNotificationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import javax.validation.Valid;
import java.util.List;


@RestController
@RequestMapping(value="publish")
@Slf4j
public class FileChangeController {

    private final FileUploadNotificationService fileUploadNotificationService;

    private final DocumentService documentService;

    public FileChangeController(FileUploadNotificationService fileUploadNotificationService, DocumentService documentService) {
        this.fileUploadNotificationService = fileUploadNotificationService;

        this.documentService = documentService;
    }


    @RequestMapping(path = "/stream/file", headers = "Accept=*/*",
            produces = MediaType.APPLICATION_STREAM_JSON_VALUE, method = RequestMethod.GET)
    public SseEmitter fileChangeStream() {
        return fileUploadNotificationService.initSseEmitters();
    }

    @RequestMapping(value = "/doc/{id}/file/add", method = RequestMethod.POST)
    public BusinessFile addFile(@PathVariable("id") long id,
                                @Valid @RequestBody BusinessFile file){
        BusinessFile result = documentService.addFile(id,file);
        FileUploadNotificationService.WebSource source = new FileUploadNotificationService.WebSource();
        source.setDoc(id);
        source.getFiles().add(result);
        fileUploadNotificationService.sendSseEventsToUI(source);
        return result;
    }

    @RequestMapping(value = "/doc/{id}/files/add", method = RequestMethod.POST)
    public void addFiles(
            @PathVariable("id") long id,
            @Valid @RequestBody List<BusinessFile> files){
        FileUploadNotificationService.WebSource source = new FileUploadNotificationService.WebSource();
        source.setDoc(id);
        for(BusinessFile file: files){
            source.getFiles().add(documentService.addFile(id,file));
        }
        fileUploadNotificationService.sendSseEventsToUI(source);
    }

    @CrossOrigin
    @RequestMapping(value = "/doc/{id}/file/add/test", method = RequestMethod.GET)
    public String test(@PathVariable("id") long id){
        fileUploadNotificationService.testSend(id);
        return String.valueOf(id);
    }

}
