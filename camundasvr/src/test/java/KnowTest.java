

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.Version;
import org.junit.Test;

import java.io.IOException;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.Assert.*;
public class KnowTest {

    @Test
    public void testSplitRegx(){
       String str =  "[12321][23421][323423][23423]";

        Pattern p = Pattern.compile("\\[(\\d+)\\]");
        Matcher m = p.matcher(str);

        assertTrue(m.find());

       assertEquals(m.group(1),"12321");
        assertTrue(m.find());
        assertEquals(m.group(1),"23421");
        assertTrue(m.find());
        assertEquals(m.group(1),"323423");
        assertTrue(m.find());
        assertEquals(m.group(1),"23423");
        assertFalse(m.find());
    }

    @Test
    public void testTemplate(){

        String s = "项目名称为${name}, 面积${area! \"-\"}";
        try {
            Map<String,Object > key = new HashMap<>();
            key.put("name","ddddd");
//            key.put("area", new BigDecimal("200000"));
            Template template = new Template("strTpl", s, new Configuration(new Version("2.3.26")));
            StringWriter stringWriter = new StringWriter();
            template.process(key, stringWriter);

            assertEquals(stringWriter.toString(),"项目名称为ddddd, 面积-");
        }catch (IOException | TemplateException e){
            throw new IllegalArgumentException("description fail!",e);
        }
    }
}
