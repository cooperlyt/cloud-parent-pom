

import org.junit.Test;

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
}
