package cc.coopersoft.cloud.business.document.controller;

import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import cc.coopersoft.cloud.business.document.model.BusinessFile;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value="/manager/doc")
public class MasterController {


    private final DocumentService documentService;

    public MasterController(DocumentService documentService) {
        this.documentService = documentService;
    }



    @RequestMapping(value = "/business/{id}/add", method = RequestMethod.POST)
    public BusinessDocument addDocument(@PathVariable("id") long id, @RequestBody BusinessDocument document){
        return documentService.addDocument(id,document);
    }

    @RequestMapping(value = "/{id}/del", method = RequestMethod.DELETE)
    public String delDocument(@PathVariable("id") long id){
        documentService.delDocument(id);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/{id}/count", method = {RequestMethod.PUT, RequestMethod.POST})
    public String setDocumentPageCount(@PathVariable("id") long id, @RequestBody int count){
        documentService.modifyDocumentPageCount(id,count);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/{id}/name", method = {RequestMethod.PUT, RequestMethod.POST})
    public String setDocumentName(@PathVariable("id") long id, @RequestBody String name){
        documentService.modifyDocumentName(id,name);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/{id}/order", method = {RequestMethod.PUT, RequestMethod.POST})
    public String orderDocument(@PathVariable("id") long id, @RequestParam(name = "before", required = false) Optional<Long> before){
        documentService.orderDocument(id,before);
        return String.valueOf(id);
    }

    @RequestMapping(value = "/{id}/file/add", method = RequestMethod.POST)
    public BusinessFile addFile(@PathVariable("id") long id, @Valid @RequestBody BusinessFile file){
        return documentService.addFile(id,file);
    }

    @RequestMapping(value = "/file/{id}/del", method = RequestMethod.DELETE)
    public String delFile(@PathVariable("id") String id){
        documentService.delFile(id);
        return id;
    }

    @RequestMapping(value = "/file/{id}/order", method = {RequestMethod.PUT, RequestMethod.POST})
    public String orderFile(@PathVariable("id") String id, @RequestParam(name = "before", required = false) Optional<String> before){
        documentService.orderFile(id,before);
        return id;
    }


}
