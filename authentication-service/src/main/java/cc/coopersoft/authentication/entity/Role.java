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

    private boolean system;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isSystem() {
        return system;
    }

    public void setSystem(boolean system) {
        this.system = system;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + authority +
                ", name='" + name + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Role role = (Role) o;

        return authority.equals(role.authority);
    }

    @Override
    public int hashCode() {
        return authority.hashCode();
    }
}
