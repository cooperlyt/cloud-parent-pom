package cc.coopersoft.authentication.entity;

import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;

@Entity
@Table(name = "_user")
public class User extends UserInfo implements UserDetails, Serializable {


    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "username", nullable = false, referencedColumnName = "username"),
            inverseJoinColumns = @JoinColumn(name = "authority", nullable = false))
    private Collection<Role> authorities = new HashSet<>();

    public void setAuthorities(Collection<Role> authorities) {
        this.authorities = authorities;
    }

    @Override
    public Collection<Role> getAuthorities() {
        return authorities;
    }

    public User() {
    }

    public User(UserInfo userInfo) {
        super(userInfo);
    }
}
