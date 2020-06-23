package cc.coopersoft.cloud.business.controller;


import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import cc.coopersoft.cloud.business.document.model.BusinessFile;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import cc.coopersoft.cloud.business.model.BusinessOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value="adapter")
@Slf4j
public class BusinessHandleController {




    private final DocumentService documentService;

    public BusinessHandleController(DocumentService documentService) {
        this.documentService = documentService;
    }


    @RequestMapping(value = "/task/{tid}/doc/add", method = RequestMethod.POST)
    public BusinessDocument addDocument(@PathVariable("tid") String taskId,
                                        @Valid @RequestBody BusinessDocument document){
        return documentService.addDocument(taskId,document);
    }

    @RequestMapping(value = "/task/{tid}/doc/{id}/del", method = RequestMethod.DELETE)
    public String delDocument(@PathVariable("tid") String taskId,
                              @PathVariable("id") long id){
        documentService.delDocument(taskId,id);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/task/{tid}/doc/{id}/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public BusinessDocument editDocument(@PathVariable("tid") String taskId,
                               @PathVariable("id") long id,
                               @Valid @RequestBody BusinessDocument businessDocument){
        return documentService.editDocument(taskId,id,businessDocument);
    }


    @RequestMapping(value = "/task/{tid}/doc/{id}/order", method = {RequestMethod.PUT, RequestMethod.POST})
    public String orderDocument(@PathVariable("tid") String taskId,
                                @PathVariable("id") long id,
                                @RequestParam(name = "before", required = false) Optional<Long> before){
        documentService.orderDocument(taskId,id,before);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/task/{tid}/doc/{id}/file/add", method = RequestMethod.POST)
    public BusinessFile addFile(@PathVariable("tid") String taskId,
                                @PathVariable("id") long id,
                                @Valid @RequestBody BusinessFile file){
        return documentService.addFile(taskId,id,file);
    }

    @RequestMapping(value = "/task/{tid}/file/{id}/del", method = RequestMethod.DELETE)
    public String delFile(@PathVariable("tid") String taskId,
                          @PathVariable("id") String id){
        documentService.delFile(taskId,id);
        return id;
    }

    @RequestMapping(value = "/task/{tid}/file/{id}/order", method = {RequestMethod.PUT, RequestMethod.POST})
    public String orderFile(@PathVariable("tid") String taskId,
                            @PathVariable("id") String id,
                            @RequestParam(name = "before", required = false) Optional<String> before){
        documentService.orderFile(taskId,id,before);
        return id;
    }


}
