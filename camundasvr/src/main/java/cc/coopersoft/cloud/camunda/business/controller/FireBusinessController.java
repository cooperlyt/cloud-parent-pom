package cc.coopersoft.cloud.camunda.business.controller;

import cc.coopersoft.cloud.camunda.business.model.BusinessDescription;
import cc.coopersoft.cloud.camunda.construct.fire.services.FireBusinessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping(value="/adapter/fire")
@Slf4j
public class FireBusinessController {

    private final FireBusinessService fireBusinessService;

    public FireBusinessController(FireBusinessService fireBusinessService) {
        this.fireBusinessService = fireBusinessService;
    }

    @RequestMapping(value = "/start/{define}/{id}")
    public String start(@PathVariable("id") long businessId, @PathVariable("define") String defineId,
                        @Valid @RequestBody BusinessDescription description){
        return String.valueOf(fireBusinessService.start(businessId,defineId,description).getId());
    }
}
