package cc.coopersoft.cloud.camunda.business.controller;

import cc.coopersoft.cloud.camunda.business.model.Business;
import cc.coopersoft.cloud.camunda.business.model.BusinessOperation;
import cc.coopersoft.cloud.camunda.business.services.BusinessService;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.variable.VariableMap;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.Produces;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping(value="business")
@Slf4j
public class BusinessController {

    private final BusinessService businessService;

    public BusinessController(BusinessService businessService) {
        this.businessService = businessService;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public Page<Business> businesses (
            @RequestParam(value = "valid", required = false) Optional<Boolean> valid,
            @RequestParam(value ="page", required = false) Optional<Integer> page,
            @RequestParam(value ="key", required = false)Optional<String> key){
       return this.businessService.businesses(page.orElse(0),valid.orElse(false),key);
    }

    @RequestMapping(value = "/operations/{id}", method = RequestMethod.GET)
    public List<BusinessOperation> operations(@PathVariable("id") long id){
        return businessService.operations(id);
    }


    @RequestMapping(value = "/test2" ,method = RequestMethod.POST)
    public void test(@RequestBody Map<String,String> data){
        log.debug(data.get("a").toString());
        log.debug(data.get("b").toString());
    }

    @RequestMapping(value = "/test" ,method = RequestMethod.POST)
    public void test(@RequestBody VariableMap data){
        log.debug(data.get("a").toString());
        log.debug(data.get("b").toString());
    }
}
