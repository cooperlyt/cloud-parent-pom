package cc.coopersoft.cloud.camunda.business.repository;

import cc.coopersoft.cloud.camunda.business.model.Business;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BusinessRepository extends CrudRepository<Business,Long>, JpaSpecificationExecutor<Business> {

}
