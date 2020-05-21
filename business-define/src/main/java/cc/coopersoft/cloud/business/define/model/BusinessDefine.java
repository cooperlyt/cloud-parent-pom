package cc.coopersoft.cloud.business.define.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "BUSINESS_DEFINE")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Getter
@Setter
@NoArgsConstructor
public class BusinessDefine extends cc.coopersoft.common.business.define.BusinessDefine {

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @Override
    public String getId(){return super.getId();}

    @Column(name = "NAME", length = 32, nullable = false)
    @NotBlank
    @Size(max = 32)
    @Override
    public String getName(){return super.getName();}

    @Column(name = "PROCESS", length = 32)
    @Size(max = 32)
    @Override
    public String getProcess(){return super.getProcess();}

    @Column(name = "DESCRIPTION_TEMPLATE", nullable = false)
    @NotBlank
    public String getDescription(){return super.getDescription();}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BusinessDefine other = (BusinessDefine) o;

        return getId().equals(other.getId());
    }

    @Override
    public int hashCode() {
        return getId().hashCode();
    }


}
