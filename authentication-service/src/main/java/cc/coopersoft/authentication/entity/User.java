package cc.coopersoft.authentication.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;

@Entity
@Table(name = "_user")
public class User extends UserInfo implements UserDetails, Serializable {


    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE}, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "username", nullable = false, referencedColumnName = "username"),
            inverseJoinColumns = @JoinColumn(name = "authority", nullable = false))
    @JsonIgnore
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
