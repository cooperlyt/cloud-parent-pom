package cc.coopersoft.cloud.business.define.service;

import cc.coopersoft.cloud.business.define.Application;
import lombok.extern.slf4j.Slf4j;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@ContextConfiguration(classes = {DefineServiceTest.class})
@Slf4j
@FixMethodOrder(MethodSorters.JVM)
public class DefineServiceTest {

    @Autowired
    private DefineService defineService;

    @Test
    public void testDefine(){

        assertEquals(defineService.getBusinessDefine("FIRE_CHECK").orElseThrow().getProcess(),"construct-fire-check");

        assertEquals(defineService.getDocumentDefines("FIRE_CHECK").size(), 1);
    }

}