package cc.coopersoft.cloud.business.document.model;

import cc.coopersoft.common.tools.EntityOrderTools;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "BUSINESS_DOCUMENT", uniqueConstraints = @UniqueConstraint(columnNames = {"NAME","BUSINESS_ID"}, name = "BUSINESS_DOC_NAME_UNIQUE"))
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class BusinessDocument implements EntityOrderTools.OrderEntity, java.io.Serializable {

    public BusinessDocument(long business, long id, int order, boolean need, String name, String description) {
        this.id = id;
        this.name = name;
        this.business = business;
        this.order = order;
        this.need = need;
        this.description = description;
    }

    public void assign(BusinessDocument other){
        this.name = other.name;
        this.description = other.description;
        this.pageCount = other.pageCount;
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Long id;

    @Column(name = "NAME",length = 512, nullable = false)
    @Size(max = 512)
    @NotBlank
    private String name;

    @Column(name = "NEED", nullable = false)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private boolean need;

    @Column(name = "DESCRIPTION", length = 1024)
    @Size(max = 1024)
    private String description;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "PAGE_COUNT", nullable = false)
    private int pageCount = 0;


    @Column(name = "BUSINESS_ID", nullable = false)
    @JsonIgnore
    private long business;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "document", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("order")
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private List<BusinessFile> files = new ArrayList<>(0);


}
