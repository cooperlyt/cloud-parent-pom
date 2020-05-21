package cc.coopersoft.cloud.business.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "DEFINE_KEY")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
@Access(AccessType.PROPERTY)
public class BusinessKey extends cc.coopersoft.common.business.BusinessKey{

    @EmbeddedId
    @JsonIgnore
    @Access(AccessType.FIELD)
    private BusinessKeyPK id = new BusinessKeyPK();

    @Override
    @Transient
    @Size(max = 16)
    public String getCategory() {
        return id.getCategory();
    }

    @Override
    public void setCategory(String value){
        this.id.setCategory(value);
    }

    @Column(name = "_KEYS", length = 1024)
    @Size(max = 1024)
    @Override
    public String getKey(){
        return super.getKey();
    }
}
