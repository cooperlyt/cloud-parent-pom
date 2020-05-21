package cc.coopersoft.cloud.business.define.service;

import cc.coopersoft.cloud.business.define.model.BusinessDefine;
import cc.coopersoft.cloud.business.define.model.DocumentDefine;
import cc.coopersoft.cloud.business.define.repository.BusinessDefineRepository;
import cc.coopersoft.cloud.business.define.repository.DocumentDefineRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DefineService {

    private final BusinessDefineRepository businessDefineRepository;

    private final DocumentDefineRepository documentDefineRepository;

    public DefineService(BusinessDefineRepository businessDefineRepository, DocumentDefineRepository documentDefineRepository) {
        this.businessDefineRepository = businessDefineRepository;
        this.documentDefineRepository = documentDefineRepository;
    }

    public Optional<BusinessDefine> getBusinessDefine(String id){
        return businessDefineRepository.findById(id);
    }

    public List<DocumentDefine> getDocumentDefines(String businessDefineId){
        return documentDefineRepository.findByIdBusinessIdOrderByIdOrder(businessDefineId);
    }
}
