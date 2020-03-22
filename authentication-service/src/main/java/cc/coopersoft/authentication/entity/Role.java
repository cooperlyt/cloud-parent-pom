package cc.coopersoft.authentication.entity;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Role implements GrantedAuthority {
    public enum Category{
        DEV(), //DEVELOPER
        HG() //HOUSE GOV

    }

    @Id
    @Column(nullable = false, unique = true)
    @NotBlank
    @Size(max = 32)
    private String authority;

    @Column(nullable = false)
    @NotBlank
    @Size(max = 32)
    private String name;

    @Enumerated(EnumType.STRING)
    @NotNull
    private Category category;

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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + authority +
                ", name='" + name + '\'' +
                '}';
    }
}
