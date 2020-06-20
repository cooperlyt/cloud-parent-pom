package cc.coopersoft.cloud.business.document.service;


import cc.coopersoft.cloud.business.camunda.util.service.TaskUtilsService;
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

    /** TODO
     *      trust 权限
     *      document 加一个业务表 存 business id 和 corp id
     *
     *      init的时候加入所属CORP  ID , init 由fire service 调用 由 fire service 验证
     *      业务启动时去掉所属 CORP ID
     *
     *      操作时都要确定 corp
     *
     */

    private static final String DOC_CHANGE_VARIABLE_NAME = "change_doc";

    @Resource
    private UidGenerator defaultUidGenerator;


    private final DocumentRepository documentRepository;

    private final BusinessFileRepository businessFileRepository;

    private final DefineService defineService;

    private final TaskUtilsService taskUtilsService;

    public DocumentService(DocumentRepository documentRepository, BusinessFileRepository businessFileRepository, DefineService defineService, TaskUtilsService taskUtilsService) {

        this.documentRepository = documentRepository;
        this.businessFileRepository = businessFileRepository;
        this.defineService = defineService;

        this.taskUtilsService = taskUtilsService;
    }

    public List<BusinessDocument> businessDocuments(long businessId){
        return documentRepository.findByBusinessOrderByOrder(businessId);
    }



    @Transactional
    public void initBusinessDocument(long businessId, String defineId){
        int i = 0;
        List<DocumentDefine> defines = defineService.getDocumentDefines(defineId);
        List<BusinessDocument> documents = new ArrayList<>(defines.size());
        for(DocumentDefine define: defines){
            documents.add(
                    new BusinessDocument(businessId,
                            defaultUidGenerator.getUID(),
                            i,
                            DocumentDefine.Type.REQ.equals(define.type),
                            define.getName(), define.description ));
            i += EntityOrderTools.ORDER_STEP;
        }
        documentRepository.saveAll(documents);
    }

    @Transactional
    public BusinessDocument addDocument(String taskId, BusinessDocument document){
        return this.addDocument(taskDocChange(taskId), document);
    }

    @Transactional
    public BusinessDocument addDocument(long businessId,BusinessDocument document){
        document.setId(defaultUidGenerator.getUID());
        document.setBusiness(businessId);
        document.setOrder(documentRepository.maxOrder(businessId) + EntityOrderTools.ORDER_STEP);
        document.setNeed(false);
        return documentRepository.save(document);
    }

    private void onTaskDocChange(String taskId, long businessKey){
        if (taskDocChange(taskId) != businessKey){
            throw new IllegalStateException("no auth");
        }
    }

    private long taskDocChange(String taskId){
        taskUtilsService.setTaskVariable(taskId,DOC_CHANGE_VARIABLE_NAME,true);
        return Long.parseLong(taskUtilsService.getActiveBusinessKeyByTaskId(taskId));
    }


    @Transactional
    public void delDocument(String taskId, long id){

        BusinessDocument origin = documentRepository.findById(id).orElseThrow();

        if (origin.getBusiness() == taskDocChange(taskId)){
            if (origin.isNeed()){
                throw new IllegalArgumentException("important doc cant`t del");
            }else
                documentRepository.deleteById(id);
        }else{
            throw new IllegalStateException("no auth");
        }

    }

    @Transactional
    public void delDocument(long id){
        documentRepository.deleteById(id);
    }

    @Transactional
    public BusinessDocument editDocument(String taskId,long docId, BusinessDocument document){
        BusinessDocument origin = documentRepository.findById(docId).orElseThrow();
        if (origin.isNeed()){
            throw new IllegalArgumentException("important file can`t edit");
        }
        onTaskDocChange(taskId, origin.getBusiness());
        origin.assign(document);
        return documentRepository.save(origin);
    }

    @Transactional
    public BusinessDocument editDocument(long docId, BusinessDocument document){
        BusinessDocument origin = documentRepository.findById(docId).orElseThrow();
        origin.assign(document);
        return documentRepository.save(origin);
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
    public void orderDocument(String taskId, long id, Optional<Long> beforeId){
        onTaskDocChange(taskId,documentRepository.findById(id).orElseThrow().getBusiness());
        orderDocument(id,beforeId);

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
    public BusinessFile addFile(String taskId, long documentId, BusinessFile file){
        BusinessDocument document = documentRepository.findById(documentId).orElseThrow(() -> new IllegalArgumentException("document not found: " + documentId));
        if (Long.parseLong(taskUtilsService.getActiveBusinessKeyByTaskId(taskId)) != document.getBusiness()){
            throw new IllegalArgumentException("task not this business`s");
        }
        taskUtilsService.setTaskVariable(taskId,file.getId(),"ADD");
        return addFile(document,file);
    }

    private BusinessFile addFile(BusinessDocument document, BusinessFile file){
        file.setDocument(document);
        file.setOrder(businessFileRepository.maxOrder(document.getId()) + EntityOrderTools.ORDER_STEP);
        file.setTime(new Date());
        return businessFileRepository.save(file);
    }

    @Transactional
    public BusinessFile addFile(long documentId, BusinessFile file){
        return addFile(documentRepository.findById(documentId).orElseThrow(() -> new IllegalArgumentException("document not found: " + documentId)), file);
    }


    @Transactional
    public void delFile(String taskId, String fid){
        onTaskDocChange(taskId,businessFileRepository.findById(fid).orElseThrow().getDocument().getBusiness());
        delFile(fid);
    }

    @Transactional
    public void delFile(String fid){
        businessFileRepository.deleteById(fid);
    }

    @Transactional
    public void orderFile(String taskId, String id , Optional<String> beforeId){
        onTaskDocChange(taskId,businessFileRepository.findById(id).orElseThrow().getDocument().getBusiness());
        orderFile(id,beforeId);
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
