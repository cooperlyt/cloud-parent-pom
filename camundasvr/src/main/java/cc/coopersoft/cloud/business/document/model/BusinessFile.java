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
import java.util.Date;

@Entity
@Table(name = "BUSINESS_FILE")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class BusinessFile implements EntityOrderTools.OrderEntity, java.io.Serializable {

    @Id
    @Column(name = "FILE_ITEM_ID", nullable = false, unique = true, length = 32)
    @NotBlank
    @Size(max = 32)
    private String id;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "MD5", length = 32)
    private String md5;

    @Column(name = "UPLOAD_TIME")
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date time;

    @Column(name = "FILE_TYPE", length = 512, nullable = false)
    @Size(max = 512)
    @NotBlank
    private String type;

    @Column(name = "FILE_SIZE")
    private Integer size;

    @Column(name="EXT_NAME",length = 8)
    @Size(max = 8)
    private String extName;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "FILE_ID", nullable = false)
    @JsonIgnore
    private BusinessDocument document;


}
