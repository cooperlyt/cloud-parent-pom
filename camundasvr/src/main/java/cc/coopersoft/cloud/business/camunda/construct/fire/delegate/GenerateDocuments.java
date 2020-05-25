package cc.coopersoft.cloud.business.camunda.construct.fire.delegate;

import cc.coopersoft.cloud.business.define.service.DefineService;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.JavaDelegate;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class GenerateDocuments implements JavaDelegate {

    private final DefineService defineService;
    private final DocumentService documentService;

    public GenerateDocuments(DefineService defineService, DocumentService documentService) {
        this.defineService = defineService;
        this.documentService = documentService;
    }

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        documentService.initBusinessDocument(Long.parseLong(execution.getBusinessKey()),(String) execution.getProcessInstance().getVariable("define"));
    }
}
