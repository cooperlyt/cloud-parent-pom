package cc.coopersoft.cloud.business.document.repository;

import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DocumentRepository extends CrudRepository<BusinessDocument,Long> {


    @Query("SELECT coalesce(max(f.order), 0) FROM BusinessDocument f where f.business = ?1")
    int maxOrder(long id);

    @Query("SELECT coalesce(min(f.order), 0) FROM BusinessDocument f where f.business = ?1")
    int minOrder(long id);


    List<BusinessDocument> findByBusinessOrderByOrder(long businessId);

    Optional<BusinessDocument> findFirstByOrderGreaterThanOrderByOrder(int order);
}
