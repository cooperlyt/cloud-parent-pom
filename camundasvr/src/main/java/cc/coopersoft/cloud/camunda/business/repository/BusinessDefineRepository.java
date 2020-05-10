package cc.coopersoft.cloud.camunda.business.repository;

import cc.coopersoft.cloud.camunda.business.model.BusinessDefine;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BusinessDefineRepository extends CrudRepository<BusinessDefine,String> {
}
