package cc.coopersoft.cloud.business.document.controller;


import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import cc.coopersoft.cloud.business.document.model.BusinessFile;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import cc.coopersoft.cloud.business.services.BusinessService;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value="/trust/doc")
public class TrustController {

    private static final String TRUST_ROLE_PREFIX = "T_";

    private final DocumentService documentService;

    private final BusinessService businessService;


    private boolean hasCorpRole(long corp){
        // need connect fire server valid corp in business
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .map(res -> {if (res.startsWith("ROLE_"))  return res.substring(5);  else return res; }) // Strip "ROLE_"
                .collect(Collectors.toSet()).contains(TRUST_ROLE_PREFIX + corp);
    }

    public TrustController(DocumentService documentService, BusinessService businessService) {
        this.documentService = documentService;
        this.businessService = businessService;
    }

    @RequestMapping(value = "{corp}/define/{define}/{id}/init", method = RequestMethod.POST)
    public String initBusinessDocument(@PathVariable("corp") long corp , @PathVariable("id") long id, @PathVariable("define") String define){
        if (hasCorpRole(corp) && !businessService.existsBusiness(id)){
            documentService.initBusinessDocument(id,define);
            return String.valueOf(id);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @RequestMapping(value = "{corp}/{id}/list", method = RequestMethod.GET)
    public List<BusinessDocument> businessDocuments(@PathVariable("corp") long corp , @PathVariable("id") long id){
        if (hasCorpRole(corp)) {
            return documentService.businessDocuments(id);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }


    @RequestMapping(value = "{corp}/{docId}/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public BusinessDocument editDocument(@PathVariable("corp") long corp,
                                         @PathVariable("docId") long docId,
                                         @Valid @RequestBody BusinessDocument businessDocument){
        if (hasCorpRole(corp)) {
            return documentService.editDocument(docId, businessDocument);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @RequestMapping(value = "{corp}/{id}/add", method = RequestMethod.POST)
    public BusinessDocument addDocument(@PathVariable("corp") long corp,
                                        @PathVariable("id") long id,
                                        @Valid @RequestBody BusinessDocument document){
        if (hasCorpRole(corp) && !businessService.existsBusiness(id)){
            return documentService.addDocument(id, document);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }


    @RequestMapping(value = "{corp}/{id}/del", method = RequestMethod.DELETE)
    public String delDocument(@PathVariable("corp") long corp,@PathVariable("id") long id){
        if (hasCorpRole(corp)){

            documentService.delDocument(id);
            return String.valueOf(id);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }

    }


    @RequestMapping(value = "{corp}/file/{id}/del", method = RequestMethod.DELETE)
    public String delFile(@PathVariable("corp") long corp,@PathVariable("id") String id){
        if (hasCorpRole(corp)){
            documentService.delFile(id);
            return id;
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @RequestMapping(value = "{corp}/file/{id}/order", method = {RequestMethod.PUT, RequestMethod.POST})
    public String orderFile(@PathVariable("corp") long corp,@PathVariable("id") String id, @RequestParam(name = "before", required = false) Optional<String> before){
        if (hasCorpRole(corp)){
            documentService.orderFile(id,before);
            return id;
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }

    }


    @RequestMapping(value = "{corp}/{id}/file/add", method = RequestMethod.POST)
    public BusinessFile addFile(@PathVariable("corp") long corp,@PathVariable("id") long id, @Valid @RequestBody BusinessFile file){
        if (hasCorpRole(corp)){
            return documentService.addFile(id,file);
        }else{
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE);
        }
    }



}
