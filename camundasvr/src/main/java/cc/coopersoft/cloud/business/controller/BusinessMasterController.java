package cc.coopersoft.cloud.business.controller;

import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import cc.coopersoft.cloud.business.model.Business;
import cc.coopersoft.cloud.business.model.BusinessOperation;
import cc.coopersoft.cloud.business.services.BusinessService;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.variable.VariableMap;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping(value="/master/business")
@Slf4j
public class BusinessMasterController {

    private final BusinessService businessService;

    private final DocumentService documentService;

    public BusinessMasterController(BusinessService businessService, DocumentService documentService) {
        this.businessService = businessService;
        this.documentService = documentService;
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public Page<Business> businesses (
            @RequestParam(value = "valid", required = false) Optional<Boolean> valid,
            @RequestParam(value ="page", required = false) Optional<Integer> page,
            @RequestParam(value ="key", required = false)Optional<String> key){
       return this.businessService.businesses(page.orElse(0),valid.orElse(false),key);
    }

    @RequestMapping(value = "/{id}/operations", method = RequestMethod.GET)
    public List<BusinessOperation> operations(@PathVariable("id") long id){
        return businessService.operations(id);
    }


    @RequestMapping(value = "/{id}/doc", method = RequestMethod.GET)
    public List<BusinessDocument> businessDocuments(@PathVariable("id") long id){
        return documentService.businessDocuments(id);
    }


}
