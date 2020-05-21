package cc.coopersoft.cloud.business.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusinessKeyPK implements java.io.Serializable {

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "BUSINESS", nullable = false)
    private BusinessDescription description;

    @Column(name = "CATEGORY", nullable = false, length = 16)
    private String category;


}
