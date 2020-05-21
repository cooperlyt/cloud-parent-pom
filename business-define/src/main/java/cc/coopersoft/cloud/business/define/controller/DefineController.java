package cc.coopersoft.cloud.business.define.controller;

import cc.coopersoft.cloud.business.define.model.BusinessDefine;
import cc.coopersoft.cloud.business.define.model.DocumentDefine;
import cc.coopersoft.cloud.business.define.service.DefineService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping(value="define")
public class DefineController {

    private final DefineService defineService;


    public DefineController(DefineService defineService) {
        this.defineService = defineService;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public BusinessDefine define(@PathVariable("id") String id){
        return defineService.getBusinessDefine(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @RequestMapping(value = "/{id}/documents", method = RequestMethod.GET)
    public List<DocumentDefine> documentDefines(@PathVariable("id") String id){
        return defineService.getDocumentDefines(id);
    }
}
