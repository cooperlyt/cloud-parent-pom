package cc.coopersoft.authentication.entity;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Role implements GrantedAuthority {

    @Id
    @Column(nullable = false, unique = true)
    @NotBlank
    @Size(max = 32)
    private String authority;

    @Column(nullable = false)
    @NotBlank
    @Size(max = 32)
    private String name;

    @Size(max = 256)
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public String getAuthority() {
        return this.authority;
    }



    @Override
    public String toString() {
        return "Role{" +
                "id=" + authority +
                ", name='" + name + '\'' +
                '}';
    }
}
