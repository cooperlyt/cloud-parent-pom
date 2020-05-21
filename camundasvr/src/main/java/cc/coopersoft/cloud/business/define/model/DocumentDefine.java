package cc.coopersoft.cloud.business.define.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Access;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "BUSINESS_FILE_DEFINE")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
@Access(AccessType.PROPERTY)
public class DocumentDefine extends cc.coopersoft.common.business.define.DocumentDefine implements java.io.Serializable{

    @Embeddable
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class DocumentDefinePk implements java.io.Serializable{

        @ManyToOne(fetch = FetchType.LAZY, optional = false)
        @JoinColumn(name = "BUSINESS", nullable = false)
        private BusinessDefine business;

        @Column(name = "_ORDER", nullable = false)
        private int order;

    }

    @EmbeddedId
    @Access(AccessType.FIELD)
    @JsonIgnore
    private DocumentDefinePk id = new DocumentDefinePk();

    @Column(name = "NAME", length = 512, nullable = false)
    @Size(max = 512)
    @NotBlank
    @Override
    public String getName(){return super.getName();}

    @Column(name = "DESCRIPTION", length = 1024)
    @Size(max = 1024)
    @Override
    public String getDescription(){return super.getDescription();}

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE" , length = 4, nullable = false)
    @NotNull
    public Type getType(){return super.getType();}

    @Column(name = "EL", length = 512)
    @Size(max = 512)
    public String getEl(){return super.getEl();}



}
