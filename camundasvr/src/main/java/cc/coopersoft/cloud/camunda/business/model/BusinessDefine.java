package cc.coopersoft.cloud.camunda.business.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "BUSINESS_DEFINE")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class BusinessDefine {

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    private String id;

    @Column(name = "NAME", length = 32, nullable = false)
    @NotBlank
    @Size(max = 32)
    private String name;

    @Column(name = "PROCESS", length = 32)
    @Size(max = 32)
    private String process;

    @Column(name = "DESCRIPTION_TEMPLATE", nullable = false)
    @NotBlank
    private String description;
}
