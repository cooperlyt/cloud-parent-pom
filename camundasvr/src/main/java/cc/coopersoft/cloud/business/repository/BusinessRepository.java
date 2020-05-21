package cc.coopersoft.cloud.business.repository;

import cc.coopersoft.cloud.business.model.Business;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BusinessRepository extends CrudRepository<Business,Long>, JpaSpecificationExecutor<Business> {

}
