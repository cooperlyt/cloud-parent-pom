package cc.coopersoft.cloud.business.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "OPERATION")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class BusinessOperation implements java.io.Serializable {

    public enum Type {
        TASK,
        CREATE,
        PASS,
        REJECT,
        ABORT,
        SUSPEND,
        RESUME
    }

    @Id
    @Column(name = "ID", unique = true, nullable = false)
    @JsonIgnore
    private long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "BUSINESS_ID", nullable = false)
    @JsonIgnore
    private Business business;

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE", nullable = false, length = 16)
    private Type type;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "OPERATION_TIME",nullable = false)
    private Date time;

    @Column(name = "EMP_ID", length = 32)
    private String empId;

    @Column(name = "EMP_NAME", length = 32 , nullable = false)
    private String empName;

    @Column(name = "TASK_NAME", length = 32)
    private String taskName;

    @Column(name = "DESCRIPTION", length = 512)
    private String description;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BusinessOperation that = (BusinessOperation) o;

        return id == that.id;
    }

    @Override
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
