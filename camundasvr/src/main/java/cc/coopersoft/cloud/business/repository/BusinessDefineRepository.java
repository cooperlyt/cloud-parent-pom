package cc.coopersoft.cloud.business.repository;

import cc.coopersoft.cloud.business.define.model.BusinessDefine;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BusinessDefineRepository extends CrudRepository<BusinessDefine,String> {
}
