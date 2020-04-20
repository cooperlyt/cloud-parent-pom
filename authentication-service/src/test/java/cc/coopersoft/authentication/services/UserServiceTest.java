package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.entity.User;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    @Ignore
    public void loadUserByUsername() {
       assertEquals(userService.loadUserByUsername("root").getUsername(),"root");
    }


    @Test
    @Ignore
    public void addDeveloperRoot() {
        User user = new User();
        user.setUsername("new1");
        user.setPhone("new1");
        user.setPassword("new1");
        user.setName("new");
        assertFalse(userService.userIsExists(user));
        userService.addDeveloperRoot(user);
        assertTrue(userService.userIsExists(user));
    }

    @Test
    @Ignore
    public void userIsExists() {
        User user = new User();
        user.setUsername("root");
        user.setPhone("none");
        assertTrue(userService.userIsExists(user));
        user.setUsername("no user");
        assertTrue(userService.userIsExists(user));
        user.setPhone("nnn");
        assertFalse(userService.userIsExists(user));
    }
}