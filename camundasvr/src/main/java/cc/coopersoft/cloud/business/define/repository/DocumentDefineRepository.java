package cc.coopersoft.cloud.business.define.repository;

import cc.coopersoft.cloud.business.define.model.DocumentDefine;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DocumentDefineRepository extends CrudRepository<DocumentDefine, DocumentDefine.DocumentDefinePk> {

    List<DocumentDefine> findByIdBusinessIdOrderByIdOrder(String businessDefineId);
}
