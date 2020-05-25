import cc.coopersoft.cloud.business.Application;
import cc.coopersoft.cloud.business.document.model.BusinessDocument;
import cc.coopersoft.cloud.business.document.model.BusinessFile;
import cc.coopersoft.cloud.business.document.service.DocumentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
@ContextConfiguration(classes = {DocumentService.class})
@Slf4j
@FixMethodOrder(MethodSorters.JVM)
public class DocumentServiceTest {

    @Autowired
    private DocumentService documentService;

    @Test
    public void testAddDocument(){

        long bizId  = 100l;

        BusinessDocument dd = new BusinessDocument();
        dd.setName("test2");


        BusinessDocument doc = documentService.addDocument(bizId,dd);

        assertEquals(documentService.businessDocuments(bizId).size(), 1);

        BusinessFile f;

        for (int i = 0 ; i< 10 ; i++){
            f = new BusinessFile();
            f.setId("test" + i);
            f.setType("testType");
            documentService.addFile(doc.getId(),f);
        }

        assertEquals(documentService.businessDocuments(bizId).get(0).getFiles().size(),10);


        for(int i=0; i< 100; i++){

            List<BusinessFile> files = documentService.businessDocuments(bizId).get(0).getFiles();

            documentService.orderFile(files.get(9).getId(), Optional.of(files.get(2).getId()) );

        }

        List<BusinessFile> files = documentService.businessDocuments(bizId).get(0).getFiles();

        documentService.orderFile(files.get(9).getId(), Optional.empty() );

        assertEquals(documentService.businessDocuments(bizId).get(0).getFiles().size(),10);


        documentService.delFile(files.get(0).getId());

        assertEquals(documentService.businessDocuments(bizId).get(0).getFiles().size(),9);


        BusinessDocument doc33 = documentService.businessDocuments(bizId).get(0);

        documentService.modifyDocumentName(doc33.getId(),"edit name");

        assertEquals(documentService.businessDocuments(bizId).get(0).getName(),"edit name" );

        documentService.modifyDocumentPageCount(doc33.getId(),30);

        assertEquals(documentService.businessDocuments(bizId).get(0).getPageCount(), 30);


        documentService.delDocument(doc33.getId());

        assertEquals(documentService.businessDocuments(bizId).size(),0);

        for (int i = 0 ; i< 10 ; i++){
            BusinessDocument dd2 = new BusinessDocument();
            dd2.setName("add" + i);
            documentService.addDocument(bizId,dd2);
        }


        for(int i=0; i< 100; i++){

            List<BusinessDocument> docs = documentService.businessDocuments(bizId);

            documentService.orderDocument(docs.get(9).getId(), Optional.of(docs.get(2).getId()) );

        }

        List<BusinessDocument> docs = documentService.businessDocuments(bizId);

        documentService.orderDocument(docs.get(9).getId(),Optional.empty());

        assertEquals(documentService.businessDocuments(bizId).size(),10);


    }
}
