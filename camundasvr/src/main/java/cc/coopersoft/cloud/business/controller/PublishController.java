package cc.coopersoft.cloud.business.controller;

import cc.coopersoft.cloud.business.model.BusinessOperation;
import cc.coopersoft.cloud.business.services.BusinessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value="publish")
@Slf4j
public class PublishController {

    private final BusinessService businessService;

    public PublishController(BusinessService businessService) {
        this.businessService = businessService;
    }

    @RequestMapping(value = "/{id}/operations", method = RequestMethod.GET)
    public List<BusinessOperation> operations(@PathVariable("id") long id){
        return businessService.operations(id);
    }
}
