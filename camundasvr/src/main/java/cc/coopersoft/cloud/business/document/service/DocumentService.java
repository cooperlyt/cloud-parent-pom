package cc.coopersoft.cloud.business.document.service;


import cc.coopersoft.cloud.business.define.model.DocumentDefine;
import cc.coopersoft.cloud.business.define.service.DefineService;
import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import cc.coopersoft.cloud.business.document.model.BusinessFile;
import cc.coopersoft.cloud.business.document.repository.BusinessFileRepository;
import cc.coopersoft.cloud.business.document.repository.DocumentRepository;
import cc.coopersoft.common.tools.EntityOrderTools;
import com.github.wujun234.uid.UidGenerator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class DocumentService {

    @Resource
    private UidGenerator defaultUidGenerator;


    private final DocumentRepository documentRepository;

    private final BusinessFileRepository businessFileRepository;

    private final DefineService defineService;

    public DocumentService(DocumentRepository documentRepository, BusinessFileRepository businessFileRepository, DefineService defineService) {

        this.documentRepository = documentRepository;
        this.businessFileRepository = businessFileRepository;
        this.defineService = defineService;
    }

    public List<BusinessDocument> businessDocuments(long businessId){
        return documentRepository.findByBusinessOrderByOrder(businessId);
    }

    @Transactional
    public void addBusinessDocument(long businessId, String defineId){
        int i = 0;
        List<DocumentDefine> defines = defineService.getDocumentDefines(defineId);
        List<BusinessDocument> documents = new ArrayList<>(defines.size());
        for(DocumentDefine define: defines){
            documents.add(new BusinessDocument(businessId,defaultUidGenerator.getUID(),i,DocumentDefine.Type.REQ.equals(define.type),define.getName() ));
            i += EntityOrderTools.ORDER_STEP;
        }
        documentRepository.saveAll(documents);
    }

    @Transactional
    public BusinessDocument addDocument(long businessId, String name){
        BusinessDocument document = new BusinessDocument(businessId,defaultUidGenerator.getUID(),documentRepository.maxOrder(businessId) + EntityOrderTools.ORDER_STEP,false,name);
        return documentRepository.save(document);
    }

    @Transactional
    public void delDocument(long id){
        documentRepository.deleteById(id);
    }

    @Transactional
    public void modifyDocumentPageCount(long docId, int pageCount){
        BusinessDocument doc = documentRepository.findById(docId).orElseThrow();
        doc.setPageCount(pageCount);
        documentRepository.save(doc);
    }

    @Transactional
    public void modifyDocumentName(long docId, String name){
        BusinessDocument doc = documentRepository.findById(docId).orElseThrow();
        doc.setName(name);
        documentRepository.save(doc);
    }

    @Transactional
    public void orderDocument(long id, Optional<Long> beforeId){
        EntityOrderTools.order(id,beforeId, new EntityOrderTools.Collator<BusinessDocument, Long>() {
            @Override
            public Optional<BusinessDocument> findById(Long id) {
                return documentRepository.findById(id);
            }

            @Override
            public Optional<BusinessDocument> next(int order) {
                return documentRepository.findFirstByOrderGreaterThanOrderByOrder(order);
            }

            @Override
            public int minOrder(BusinessDocument entity) {
                return documentRepository.minOrder(entity.getBusiness());
            }

            @Override
            public List<BusinessDocument> all(BusinessDocument entity) {
                return documentRepository.findByBusinessOrderByOrder(entity.getBusiness());
            }

            @Override
            public void save(Iterable<BusinessDocument> entities) {
                documentRepository.saveAll(entities);
            }

            @Override
            public void save(BusinessDocument entity) {
                documentRepository.save(entity);
            }
        });
    }

    @Transactional
    public BusinessFile addFile(long documentId, BusinessFile file){
        file.setDocument(documentRepository.findById(documentId).orElseThrow(() -> new IllegalArgumentException("document not found: " + documentId)));
        file.setOrder(businessFileRepository.maxOrder(documentId) + EntityOrderTools.ORDER_STEP);
        file.setTime(new Date());
        return businessFileRepository.save(file);
    }

    public void delFile(String fid){
        businessFileRepository.deleteById(fid);
    }

    @Transactional
    public void orderFile(String id , Optional<String> beforeId){

        EntityOrderTools.order(id,beforeId, new EntityOrderTools.Collator<BusinessFile, String>() {
            @Override
            public Optional<BusinessFile> findById(String id) {
                return businessFileRepository.findById(id);
            }

            @Override
            public Optional<BusinessFile> next(int order) {
                return businessFileRepository.findFirstByOrderGreaterThanOrderByOrder(order);
            }

            @Override
            public int minOrder(BusinessFile businessFile) {
                return businessFileRepository.minOrder(businessFile.getDocument().getId());
            }

            @Override
            public List<BusinessFile> all(BusinessFile businessFile) {
                return businessFileRepository.findByDocumentIdOrderByOrder(businessFile.getDocument().getId());
            }

            @Override
            public void save(Iterable<BusinessFile> entities) {
                businessFileRepository.saveAll(entities);
            }

            @Override
            public void save(BusinessFile entity) {
                businessFileRepository.save(entity);
            }
        });
    }
}
