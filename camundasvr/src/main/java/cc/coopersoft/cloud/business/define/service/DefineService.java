package cc.coopersoft.cloud.business.define.service;

import cc.coopersoft.cloud.business.define.model.BusinessDefine;
import cc.coopersoft.cloud.business.define.model.DocumentDefine;
import cc.coopersoft.cloud.business.define.repository.DefineRepository;
import cc.coopersoft.cloud.business.define.repository.DocumentDefineRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DefineService {

    private final DefineRepository defineRepository;

    private final DocumentDefineRepository documentDefineRepository;

    public DefineService(DefineRepository defineRepository, DocumentDefineRepository documentDefineRepository) {
        this.defineRepository = defineRepository;
        this.documentDefineRepository = documentDefineRepository;
    }

    public Optional<BusinessDefine> getBusinessDefine(String id){
        return defineRepository.findById(id);
    }

    public List<DocumentDefine> getDocumentDefines(String businessDefineId){
        return documentDefineRepository.findByIdBusinessIdOrderByIdOrder(businessDefineId);
    }
}
