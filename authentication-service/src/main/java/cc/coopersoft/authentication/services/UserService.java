package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userRepository;

    public boolean changePassword(String oldPassword, String newPassword){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        User user = userRepository.findByUsername(userName);
        if (user == null){
            return false;
        }
        if (!user.getPassword().equals(oldPassword)){
            return false;
        }
        user.setPassword(newPassword);
        userRepository.save(user);
        return true;
    }

//    public List<User> listGovUsers(){
//        userRepository
//    }

}
