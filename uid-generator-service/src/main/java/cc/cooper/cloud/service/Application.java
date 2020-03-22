package cc.cooper.cloud.service;

import com.github.wujun234.uid.UidGenerator;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@SpringCloudApplication
@RestController
public class Application {

    @Resource
    private UidGenerator defaultUidGenerator;

//    @Resource
//    private UidGenerator cachedUidGenerator;


    @RequestMapping(value = "/uid",method = RequestMethod.GET)
    public long generator(){
        return  defaultUidGenerator.getUID();
    }


    public static void main(String[] args){
        SpringApplication.run(Application.class,args);
    }
}
