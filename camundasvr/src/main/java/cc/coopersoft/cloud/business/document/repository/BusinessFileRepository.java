package cc.coopersoft.cloud.business.document.repository;


import cc.coopersoft.cloud.business.document.model.BusinessFile;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface BusinessFileRepository extends CrudRepository<BusinessFile,String> {

    @Query("SELECT coalesce(max(f.order), 0) FROM BusinessFile f where f.document.id = ?1")
    int maxOrder(long id);

    @Query("SELECT coalesce(min(f.order), 0) FROM BusinessFile f where f.document.id = ?1")
    int minOrder(long id);

    List<BusinessFile> findByDocumentIdOrderByOrder(long documentId);

    Optional<BusinessFile> findFirstByOrderGreaterThanOrderByOrder(int order);
}
