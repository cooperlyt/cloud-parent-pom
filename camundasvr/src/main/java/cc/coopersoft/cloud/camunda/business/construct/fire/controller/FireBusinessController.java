package cc.coopersoft.cloud.camunda.business.construct.fire.controller;

import cc.coopersoft.cloud.camunda.business.model.BusinessDescription;
import cc.coopersoft.cloud.camunda.business.construct.fire.service.FireBusinessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(value="/adapter/fire")
@Slf4j
public class FireBusinessController {

    private final FireBusinessService fireBusinessService;

    public FireBusinessController(FireBusinessService fireBusinessService) {
        this.fireBusinessService = fireBusinessService;
    }

    @RequestMapping(value = "/start/{define}/{id}", method = RequestMethod.POST)
    public String start(@PathVariable("id") long businessId, @PathVariable("define") String defineId,
                        @Valid @RequestBody BusinessDescription description){
        return String.valueOf(fireBusinessService.start(businessId,defineId,description).getId());
    }
}
