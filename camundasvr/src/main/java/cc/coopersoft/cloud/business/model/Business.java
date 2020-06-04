package cc.coopersoft.cloud.business.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "BUSINESS")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
@NamedEntityGraph(name = "business.summary", attributeNodes = {@NamedAttributeNode("description")})
public class Business extends cc.coopersoft.common.business.Business<BusinessDescription> {


    @Access(AccessType.FIELD)
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "business", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private Set<BusinessOperation> operations = new HashSet<>(0);

    @Id
    @Column(name = "ID", unique = true, nullable = false)
    @Override
    public long getId(){return super.getId();}

    @Enumerated(EnumType.STRING)
    @Column(name = "STATUS" , nullable = false, length = 9)
    @Override
    public Status getStatus(){return super.getStatus();}

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_TIME", nullable = false)
    @Override
    public Date getCreateTime(){return super.getCreateTime();}


    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "COMPLETE_TIME", nullable = false)
    @Override
    public Date getCompletedTime(){return super.getCompletedTime();}

    @Column(name = "DEFINE", nullable = false, length = 32)
    @Override
    public String getDefine(){return super.getDefine();}


    @Column(name = "NAME", nullable = false, length = 32)
    @Override
    public String getName(){return super.getName();}

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "business", cascade = CascadeType.ALL, orphanRemoval = true)
    @Override
    public BusinessDescription getDescription(){return super.getDescription();}



}
