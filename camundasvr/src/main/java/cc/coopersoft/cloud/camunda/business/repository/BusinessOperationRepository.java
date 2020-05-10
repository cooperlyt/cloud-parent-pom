package cc.coopersoft.cloud.camunda.business.repository;

import cc.coopersoft.cloud.camunda.business.model.BusinessOperation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BusinessOperationRepository extends CrudRepository<BusinessOperation,Long> {

    List<BusinessOperation> findByBusinessIdOrderByTime(long businessId);
}
