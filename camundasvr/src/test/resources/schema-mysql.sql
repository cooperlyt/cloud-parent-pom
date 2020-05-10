-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: camunda
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACT_GE_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_BYTEARRAY` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BYTES_` longblob,
    `GENERATED_` tinyint(4) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_` int(11) DEFAULT NULL,
    `CREATE_TIME_` datetime DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
    KEY `ACT_IDX_BYTEARRAY_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_BYTEARRAY_RM_TIME` (`REMOVAL_TIME_`),
    KEY `ACT_IDX_BYTEARRAY_NAME` (`NAME_`),
    CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('70fe1c44-8afa-11ea-b132-c605dd57b976',1,'bpmn/fire_check.bpmn','70fdce23-8afa-11ea-b132-c605dd57b976',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<bpmn:definitions xmlns:bpmn=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" id=\"Definitions_03pbde5\" targetNamespace=\"http://bpmn.io/schema/bpmn\" exporter=\"Camunda Modeler\" exporterVersion=\"3.6.0\">\n  <bpmn:process id=\"fire-contruct-process\" name=\"消防工程验收审批\" isExecutable=\"true\">\n    <bpmn:startEvent id=\"StartEvent_0fju9uo\">\n      <bpmn:outgoing>SequenceFlow_0rcdilx</bpmn:outgoing>\n    </bpmn:startEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0rcdilx\" sourceRef=\"StartEvent_0fju9uo\" targetRef=\"Task_1b1yox7\" />\n    <bpmn:userTask id=\"Task_1b1yox7\" name=\"初审\" camunda:candidateUsers=\"kermit\">\n      <bpmn:extensionElements>\n        <camunda:properties>\n          <camunda:property name=\"isCheck\" value=\"True\" />\n        </camunda:properties>\n        <camunda:formData>\n          <camunda:formField id=\"approved\" label=\"同意\" type=\"boolean\" />\n        </camunda:formData>\n      </bpmn:extensionElements>\n      <bpmn:incoming>SequenceFlow_0rcdilx</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_16uzy58</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_0h67376\">\n      <bpmn:incoming>SequenceFlow_16uzy58</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_0f2l3c2</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_0oh9rxj</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_16uzy58\" sourceRef=\"Task_1b1yox7\" targetRef=\"ExclusiveGateway_0h67376\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_0f2l3c2\" sourceRef=\"ExclusiveGateway_0h67376\" targetRef=\"Task_05nygk5\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${approved == true}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0oh9rxj\" sourceRef=\"ExclusiveGateway_0h67376\" targetRef=\"Task_1qquvp3\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${approved == false}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:endEvent id=\"EndEvent_1pkn3h3\">\n      <bpmn:incoming>SequenceFlow_0mzcrmt</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0mzcrmt\" sourceRef=\"Task_05nygk5\" targetRef=\"EndEvent_1pkn3h3\" />\n    <bpmn:endEvent id=\"EndEvent_1gyj7xf\">\n      <bpmn:incoming>SequenceFlow_0ib8yiw</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0ib8yiw\" sourceRef=\"Task_1qquvp3\" targetRef=\"EndEvent_1gyj7xf\" />\n    <bpmn:userTask id=\"Task_05nygk5\" name=\"通过\" camunda:candidateUsers=\"kermit\">\n      <bpmn:incoming>SequenceFlow_0f2l3c2</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_0mzcrmt</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:userTask id=\"Task_1qquvp3\" name=\"不通过\" camunda:candidateUsers=\"kermit\">\n      <bpmn:incoming>SequenceFlow_0oh9rxj</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_0ib8yiw</bpmn:outgoing>\n    </bpmn:userTask>\n  </bpmn:process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_1\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"fire-contruct-process\">\n      <bpmndi:BPMNShape id=\"StartEvent_0fju9uo_di\" bpmnElement=\"StartEvent_0fju9uo\">\n        <dc:Bounds x=\"152\" y=\"102\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0rcdilx_di\" bpmnElement=\"SequenceFlow_0rcdilx\">\n        <di:waypoint x=\"188\" y=\"120\" />\n        <di:waypoint x=\"240\" y=\"120\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"UserTask_0f5ykc9_di\" bpmnElement=\"Task_1b1yox7\">\n        <dc:Bounds x=\"240\" y=\"80\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_0h67376_di\" bpmnElement=\"ExclusiveGateway_0h67376\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"395\" y=\"95\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_16uzy58_di\" bpmnElement=\"SequenceFlow_16uzy58\">\n        <di:waypoint x=\"340\" y=\"120\" />\n        <di:waypoint x=\"395\" y=\"120\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0f2l3c2_di\" bpmnElement=\"SequenceFlow_0f2l3c2\">\n        <di:waypoint x=\"445\" y=\"120\" />\n        <di:waypoint x=\"500\" y=\"120\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0oh9rxj_di\" bpmnElement=\"SequenceFlow_0oh9rxj\">\n        <di:waypoint x=\"420\" y=\"145\" />\n        <di:waypoint x=\"420\" y=\"230\" />\n        <di:waypoint x=\"500\" y=\"230\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"EndEvent_1pkn3h3_di\" bpmnElement=\"EndEvent_1pkn3h3\">\n        <dc:Bounds x=\"662\" y=\"102\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0mzcrmt_di\" bpmnElement=\"SequenceFlow_0mzcrmt\">\n        <di:waypoint x=\"600\" y=\"120\" />\n        <di:waypoint x=\"662\" y=\"120\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"EndEvent_1gyj7xf_di\" bpmnElement=\"EndEvent_1gyj7xf\">\n        <dc:Bounds x=\"662\" y=\"212\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0ib8yiw_di\" bpmnElement=\"SequenceFlow_0ib8yiw\">\n        <di:waypoint x=\"600\" y=\"230\" />\n        <di:waypoint x=\"662\" y=\"230\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"UserTask_1a14ydh_di\" bpmnElement=\"Task_05nygk5\">\n        <dc:Bounds x=\"500\" y=\"80\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"UserTask_0x6fey9_di\" bpmnElement=\"Task_1qquvp3\">\n        <dc:Bounds x=\"500\" y=\"190\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</bpmn:definitions>\n',0,NULL,1,'2020-04-30 23:51:23',NULL,NULL);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_PROPERTY` (
    `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
    `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
    `REV_` int(11) DEFAULT NULL,
    PRIMARY KEY (`NAME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_PROPERTY`
--

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('deployment.lock','0',1),('history.cleanup.job.lock','0',1),('historyLevel','3',1),('next.dbid','1',1),('schema.history','create(fox)',1),('schema.version','fox',1),('startup.lock','0',1);
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_SCHEMA_LOG`
--

DROP TABLE IF EXISTS `ACT_GE_SCHEMA_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_GE_SCHEMA_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TIMESTAMP_` datetime DEFAULT NULL,
    `VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_SCHEMA_LOG`
--

LOCK TABLES `ACT_GE_SCHEMA_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_GE_SCHEMA_LOG` DISABLE KEYS */;
INSERT INTO `ACT_GE_SCHEMA_LOG` VALUES ('0','2020-04-30 23:51:13','7.11.0');
/*!40000 ALTER TABLE `ACT_GE_SCHEMA_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ACTINST` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `PARENT_ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CALL_CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `ASSIGNEE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `START_TIME_` datetime NOT NULL,
    `END_TIME_` datetime DEFAULT NULL,
    `DURATION_` bigint(20) DEFAULT NULL,
    `ACT_INST_STATE_` int(11) DEFAULT NULL,
    `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_ACTINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
    KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
    KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
    KEY `ACT_IDX_HI_ACT_INST_COMP` (`EXECUTION_ID_`,`ACT_ID_`,`END_TIME_`,`ID_`),
    KEY `ACT_IDX_HI_ACT_INST_STATS` (`PROC_DEF_ID_`,`PROC_INST_ID_`,`ACT_ID_`,`END_TIME_`,`ACT_INST_STATE_`),
    KEY `ACT_IDX_HI_ACT_INST_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_ACT_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_IDX_HI_AI_PDEFID_END_TIME` (`PROC_DEF_ID_`,`END_TIME_`),
    KEY `ACT_IDX_HI_ACT_INST_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ACTINST`
--

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_ATTACHMENT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` datetime DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_ATTACHMENT_CONTENT` (`CONTENT_ID_`),
    KEY `ACT_IDX_HI_ATTACHMENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_ATTACHMENT_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_ATTACHMENT_TASK` (`TASK_ID_`),
    KEY `ACT_IDX_HI_ATTACHMENT_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ATTACHMENT`
--

LOCK TABLES `ACT_HI_ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_BATCH`
--

DROP TABLE IF EXISTS `ACT_HI_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_BATCH` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TOTAL_JOBS_` int(11) DEFAULT NULL,
    `JOBS_PER_SEED_` int(11) DEFAULT NULL,
    `INVOCATIONS_PER_JOB_` int(11) DEFAULT NULL,
    `SEED_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `MONITOR_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BATCH_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `START_TIME_` datetime NOT NULL,
    `END_TIME_` datetime DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_HI_BAT_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_BATCH`
--

LOCK TABLES `ACT_HI_BATCH` WRITE;
/*!40000 ALTER TABLE `ACT_HI_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_CASEACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_CASEACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_CASEACTINST` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `PARENT_ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `CASE_ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CALL_CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CASE_ACT_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` datetime NOT NULL,
    `END_TIME_` datetime DEFAULT NULL,
    `DURATION_` bigint(20) DEFAULT NULL,
    `STATE_` int(11) DEFAULT NULL,
    `REQUIRED_` tinyint(1) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_CAS_A_I_CREATE` (`CREATE_TIME_`),
    KEY `ACT_IDX_HI_CAS_A_I_END` (`END_TIME_`),
    KEY `ACT_IDX_HI_CAS_A_I_COMP` (`CASE_ACT_ID_`,`END_TIME_`,`ID_`),
    KEY `ACT_IDX_HI_CAS_A_I_CASEINST` (`CASE_INST_ID_`,`CASE_ACT_ID_`),
    KEY `ACT_IDX_HI_CAS_A_I_TENANT_ID` (`TENANT_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_CASEACTINST`
--

LOCK TABLES `ACT_HI_CASEACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_CASEACTINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_CASEACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_CASEINST`
--

DROP TABLE IF EXISTS `ACT_HI_CASEINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_CASEINST` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `CREATE_TIME_` datetime NOT NULL,
    `CLOSE_TIME_` datetime DEFAULT NULL,
    `DURATION_` bigint(20) DEFAULT NULL,
    `STATE_` int(11) DEFAULT NULL,
    `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_CASE_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `CASE_INST_ID_` (`CASE_INST_ID_`),
    KEY `ACT_IDX_HI_CAS_I_CLOSE` (`CLOSE_TIME_`),
    KEY `ACT_IDX_HI_CAS_I_BUSKEY` (`BUSINESS_KEY_`),
    KEY `ACT_IDX_HI_CAS_I_TENANT_ID` (`TENANT_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_CASEINST`
--

LOCK TABLES `ACT_HI_CASEINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_CASEINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_CASEINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_COMMENT`
--

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_COMMENT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TIME_` datetime NOT NULL,
    `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `FULL_MSG_` longblob,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_COMMENT_TASK` (`TASK_ID_`),
    KEY `ACT_IDX_HI_COMMENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_COMMENT_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_COMMENT_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DEC_IN`
--

DROP TABLE IF EXISTS `ACT_HI_DEC_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_DEC_IN` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `DEC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `CLAUSE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CLAUSE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DOUBLE_` double DEFAULT NULL,
    `LONG_` bigint(20) DEFAULT NULL,
    `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` datetime DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_DEC_IN_INST` (`DEC_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_IN_CLAUSE` (`DEC_INST_ID_`,`CLAUSE_ID_`),
    KEY `ACT_IDX_HI_DEC_IN_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_IN_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DEC_IN`
--

LOCK TABLES `ACT_HI_DEC_IN` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DEC_IN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DEC_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DEC_OUT`
--

DROP TABLE IF EXISTS `ACT_HI_DEC_OUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_DEC_OUT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `DEC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `CLAUSE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CLAUSE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `RULE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `RULE_ORDER_` int(11) DEFAULT NULL,
    `VAR_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DOUBLE_` double DEFAULT NULL,
    `LONG_` bigint(20) DEFAULT NULL,
    `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` datetime DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_DEC_OUT_INST` (`DEC_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_OUT_RULE` (`RULE_ORDER_`,`CLAUSE_ID_`),
    KEY `ACT_IDX_HI_DEC_OUT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_OUT_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DEC_OUT`
--

LOCK TABLES `ACT_HI_DEC_OUT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DEC_OUT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DEC_OUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DECINST`
--

DROP TABLE IF EXISTS `ACT_HI_DECINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_DECINST` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `DEC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `DEC_DEF_KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
    `DEC_DEF_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `EVAL_TIME_` datetime NOT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    `COLLECT_VALUE_` double DEFAULT NULL,
    `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_DEC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DEC_REQ_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DEC_REQ_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_DEC_INST_ID` (`DEC_DEF_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_KEY` (`DEC_DEF_KEY_`),
    KEY `ACT_IDX_HI_DEC_INST_PI` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_CI` (`CASE_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_ACT` (`ACT_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_ACT_INST` (`ACT_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_TIME` (`EVAL_TIME_`),
    KEY `ACT_IDX_HI_DEC_INST_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_ROOT_ID` (`ROOT_DEC_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_REQ_ID` (`DEC_REQ_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_REQ_KEY` (`DEC_REQ_KEY_`),
    KEY `ACT_IDX_HI_DEC_INST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_DEC_INST_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DECINST`
--

LOCK TABLES `ACT_HI_DECINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DECINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DECINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_DETAIL` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `VAR_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
    `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `REV_` int(11) DEFAULT NULL,
    `TIME_` datetime NOT NULL,
    `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DOUBLE_` double DEFAULT NULL,
    `LONG_` bigint(20) DEFAULT NULL,
    `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `OPERATION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_DETAIL_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
    KEY `ACT_IDX_HI_DETAIL_CASE_INST` (`CASE_INST_ID_`),
    KEY `ACT_IDX_HI_DETAIL_CASE_EXEC` (`CASE_EXECUTION_ID_`),
    KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
    KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
    KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`),
    KEY `ACT_IDX_HI_DETAIL_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_DETAIL_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_IDX_HI_DETAIL_BYTEAR` (`BYTEARRAY_ID_`),
    KEY `ACT_IDX_HI_DETAIL_RM_TIME` (`REMOVAL_TIME_`),
    KEY `ACT_IDX_HI_DETAIL_TASK_BYTEAR` (`BYTEARRAY_ID_`,`TASK_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DETAIL`
--

LOCK TABLES `ACT_HI_DETAIL` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_EXT_TASK_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_EXT_TASK_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_EXT_TASK_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TIMESTAMP_` timestamp NOT NULL,
    `EXT_TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `RETRIES_` int(11) DEFAULT NULL,
    `TOPIC_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `WORKER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
    `ERROR_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `ERROR_DETAILS_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `STATE_` int(11) DEFAULT NULL,
    `REV_` int(11) DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_HI_EXT_TASK_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_HI_EXT_TASK_LOG_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_HI_EXT_TASK_LOG_PROCDEF` (`PROC_DEF_ID_`),
    KEY `ACT_HI_EXT_TASK_LOG_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_HI_EXT_TASK_LOG_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_EXTTASKLOG_ERRORDET` (`ERROR_DETAILS_ID_`),
    KEY `ACT_HI_EXT_TASK_LOG_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_EXT_TASK_LOG`
--

LOCK TABLES `ACT_HI_EXT_TASK_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_EXT_TASK_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_EXT_TASK_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TIMESTAMP_` timestamp NOT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `OPERATION_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ASSIGNER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_GROUP` (`GROUP_ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_IDENT_LNK_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_IDX_HI_IDENT_LINK_TASK` (`TASK_ID_`),
    KEY `ACT_IDX_HI_IDENT_LINK_RM_TIME` (`REMOVAL_TIME_`),
    KEY `ACT_IDX_HI_IDENT_LNK_TIMESTAMP` (`TIMESTAMP_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_IDENTITYLINK`
--

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_INCIDENT`
--

DROP TABLE IF EXISTS `ACT_HI_INCIDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_INCIDENT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` timestamp NOT NULL,
    `END_TIME_` timestamp NULL DEFAULT NULL,
    `INCIDENT_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `INCIDENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `INCIDENT_STATE_` int(11) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_INCIDENT_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_INCIDENT_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_IDX_HI_INCIDENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_INCIDENT_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_INCIDENT_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_INCIDENT`
--

LOCK TABLES `ACT_HI_INCIDENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_INCIDENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_INCIDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_JOB_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_JOB_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_JOB_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TIMESTAMP_` datetime NOT NULL,
    `JOB_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `JOB_DUEDATE_` datetime DEFAULT NULL,
    `JOB_RETRIES_` int(11) DEFAULT NULL,
    `JOB_PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
    `JOB_EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `JOB_EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `JOB_STATE_` int(11) DEFAULT NULL,
    `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `JOB_DEF_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `JOB_DEF_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROCESS_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROCESS_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_JOB_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_JOB_LOG_PROCINST` (`PROCESS_INSTANCE_ID_`),
    KEY `ACT_IDX_HI_JOB_LOG_PROCDEF` (`PROCESS_DEF_ID_`),
    KEY `ACT_IDX_HI_JOB_LOG_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_JOB_LOG_JOB_DEF_ID` (`JOB_DEF_ID_`),
    KEY `ACT_IDX_HI_JOB_LOG_PROC_DEF_KEY` (`PROCESS_DEF_KEY_`),
    KEY `ACT_IDX_HI_JOB_LOG_EX_STACK` (`JOB_EXCEPTION_STACK_ID_`),
    KEY `ACT_IDX_HI_JOB_LOG_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_JOB_LOG`
--

LOCK TABLES `ACT_HI_JOB_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_JOB_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_JOB_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_OP_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_OP_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_OP_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `JOB_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TIMESTAMP_` timestamp NOT NULL,
    `OPERATION_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `OPERATION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ENTITY_TYPE_` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `PROPERTY_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ORG_VALUE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `NEW_VALUE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    `CATEGORY_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXTERNAL_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_OP_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_OP_LOG_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_OP_LOG_PROCDEF` (`PROC_DEF_ID_`),
    KEY `ACT_IDX_HI_OP_LOG_TASK` (`TASK_ID_`),
    KEY `ACT_IDX_HI_OP_LOG_RM_TIME` (`REMOVAL_TIME_`),
    KEY `ACT_IDX_HI_OP_LOG_TIMESTAMP` (`TIMESTAMP_`),
    KEY `ACT_IDX_HI_OP_LOG_USER_ID` (`USER_ID_`),
    KEY `ACT_IDX_HI_OP_LOG_OP_TYPE` (`OPERATION_TYPE_`),
    KEY `ACT_IDX_HI_OP_LOG_ENTITY_TYPE` (`ENTITY_TYPE_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_OP_LOG`
--

LOCK TABLES `ACT_HI_OP_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_OP_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_OP_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_PROCINST` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `START_TIME_` datetime NOT NULL,
    `END_TIME_` datetime DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    `DURATION_` bigint(20) DEFAULT NULL,
    `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_CASE_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `STATE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
    KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`),
    KEY `ACT_IDX_HI_PRO_INST_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_PRO_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_IDX_HI_PRO_INST_PROC_TIME` (`START_TIME_`,`END_TIME_`),
    KEY `ACT_IDX_HI_PI_PDEFID_END_TIME` (`PROC_DEF_ID_`,`END_TIME_`),
    KEY `ACT_IDX_HI_PRO_INST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_PRO_INST_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_PROCINST`
--

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_TASKINST` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `START_TIME_` datetime NOT NULL,
    `END_TIME_` datetime DEFAULT NULL,
    `DURATION_` bigint(20) DEFAULT NULL,
    `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_` int(11) DEFAULT NULL,
    `DUE_DATE_` datetime DEFAULT NULL,
    `FOLLOW_UP_DATE_` datetime DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_TASKINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_TASK_INST_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_TASK_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_IDX_HI_TASKINST_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_TASKINSTID_PROCINST` (`ID_`,`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_TASK_INST_RM_TIME` (`REMOVAL_TIME_`),
    KEY `ACT_IDX_HI_TASK_INST_START` (`START_TIME_`),
    KEY `ACT_IDX_HI_TASK_INST_END` (`END_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TASKINST`
--

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_VARINST`
--

DROP TABLE IF EXISTS `ACT_HI_VARINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_HI_VARINST` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
    `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` datetime DEFAULT NULL,
    `REV_` int(11) DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DOUBLE_` double DEFAULT NULL,
    `LONG_` bigint(20) DEFAULT NULL,
    `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `STATE_` varchar(20) COLLATE utf8_bin DEFAULT NULL,
    `REMOVAL_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_HI_VARINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
    KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
    KEY `ACT_IDX_HI_CASEVAR_CASE_INST` (`CASE_INST_ID_`),
    KEY `ACT_IDX_HI_VAR_INST_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_HI_VAR_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
    KEY `ACT_IDX_HI_VARINST_BYTEAR` (`BYTEARRAY_ID_`),
    KEY `ACT_IDX_HI_VARINST_RM_TIME` (`REMOVAL_TIME_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_VARINST`
--

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_GROUP`
--

DROP TABLE IF EXISTS `ACT_ID_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_GROUP` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_GROUP`
--

LOCK TABLES `ACT_ID_GROUP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_GROUP` DISABLE KEYS */;
INSERT INTO `ACT_ID_GROUP` VALUES ('camunda-admin',1,'camunda BPM Administrators','SYSTEM');
/*!40000 ALTER TABLE `ACT_ID_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_INFO`
--

DROP TABLE IF EXISTS `ACT_ID_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_INFO` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PASSWORD_` longblob,
    `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_INFO`
--

LOCK TABLES `ACT_ID_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_ID_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_MEMBERSHIP`
--

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
    `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
    KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
    CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
    CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_MEMBERSHIP`
--

LOCK TABLES `ACT_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `ACT_ID_MEMBERSHIP` VALUES ('root','camunda-admin');
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TENANT`
--

DROP TABLE IF EXISTS `ACT_ID_TENANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_TENANT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_TENANT`
--

LOCK TABLES `ACT_ID_TENANT` WRITE;
/*!40000 ALTER TABLE `ACT_ID_TENANT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_TENANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TENANT_MEMBER`
--

DROP TABLE IF EXISTS `ACT_ID_TENANT_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_TENANT_MEMBER` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `GROUP_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_USER` (`TENANT_ID_`,`USER_ID_`),
    UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_GROUP` (`TENANT_ID_`,`GROUP_ID_`),
    KEY `ACT_FK_TENANT_MEMB_USER` (`USER_ID_`),
    KEY `ACT_FK_TENANT_MEMB_GROUP` (`GROUP_ID_`),
    CONSTRAINT `ACT_FK_TENANT_MEMB` FOREIGN KEY (`TENANT_ID_`) REFERENCES `act_id_tenant` (`ID_`),
    CONSTRAINT `ACT_FK_TENANT_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
    CONSTRAINT `ACT_FK_TENANT_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_TENANT_MEMBER`
--

LOCK TABLES `ACT_ID_TENANT_MEMBER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_TENANT_MEMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_TENANT_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_USER`
--

DROP TABLE IF EXISTS `ACT_ID_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_ID_USER` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `SALT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `LOCK_EXP_TIME_` datetime DEFAULT NULL,
    `ATTEMPTS_` int(11) DEFAULT NULL,
    `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_USER`
--

LOCK TABLES `ACT_ID_USER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_USER` DISABLE KEYS */;
INSERT INTO `ACT_ID_USER` VALUES ('root',1,'Root','Root','root@localhost','{SHA-512}JpU4Mw4oR6WYECAMQnu/xy7POfGe/2Hemsop1LxQndYLvjo5rrJdwiD8MVXoYmTXC3g9XxlvpodDLGe/Z/wvKg==','8wcVTrw3DpRrhIhMGzr5pA==',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_CASE_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_CASE_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_CASE_DEF` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
    `VERSION_` int(11) NOT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `HISTORY_TTL_` int(11) DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_CASE_DEF_TENANT_ID` (`TENANT_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_CASE_DEF`
--

LOCK TABLES `ACT_RE_CASE_DEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_CASE_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_CASE_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DECISION_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_DECISION_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_DECISION_DEF` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
    `VERSION_` int(11) NOT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DEC_REQ_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DEC_REQ_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `HISTORY_TTL_` int(11) DEFAULT NULL,
    `VERSION_TAG_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_DEC_DEF_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_DEC_DEF_REQ_ID` (`DEC_REQ_ID_`),
    CONSTRAINT `ACT_FK_DEC_REQ` FOREIGN KEY (`DEC_REQ_ID_`) REFERENCES `act_re_decision_req_def` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DECISION_DEF`
--

LOCK TABLES `ACT_RE_DECISION_DEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DECISION_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_DECISION_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DECISION_REQ_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_DECISION_REQ_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_DECISION_REQ_DEF` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
    `VERSION_` int(11) NOT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_DEC_REQ_DEF_TENANT_ID` (`TENANT_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DECISION_REQ_DEF`
--

LOCK TABLES `ACT_RE_DECISION_REQ_DEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DECISION_REQ_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_DECISION_REQ_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DEPLOY_TIME_` datetime DEFAULT NULL,
    `SOURCE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_DEPLOYMENT_NAME` (`NAME_`),
    KEY `ACT_IDX_DEPLOYMENT_TENANT_ID` (`TENANT_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('70fdce23-8afa-11ea-b132-c605dd57b976','application','2020-04-30 23:51:23','process application',NULL);
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RE_PROCDEF` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
    `VERSION_` int(11) NOT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `VERSION_TAG_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `HISTORY_TTL_` int(11) DEFAULT NULL,
    `STARTABLE_` tinyint(1) NOT NULL DEFAULT '1',
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_PROCDEF_DEPLOYMENT_ID` (`DEPLOYMENT_ID_`),
    KEY `ACT_IDX_PROCDEF_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_PROCDEF_VER_TAG` (`VERSION_TAG_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_PROCDEF`
--

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;
INSERT INTO `ACT_RE_PROCDEF` VALUES ('fire-contruct-process:1:7134bca5-8afa-11ea-b132-c605dd57b976',1,'http://bpmn.io/schema/bpmn','消防工程验收审批','fire-contruct-process',1,'70fdce23-8afa-11ea-b132-c605dd57b976','bpmn/fire_check.bpmn',NULL,0,1,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_AUTHORIZATION`
--

DROP TABLE IF EXISTS `ACT_RU_AUTHORIZATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_AUTHORIZATION` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) NOT NULL,
    `TYPE_` int(11) NOT NULL,
    `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `RESOURCE_TYPE_` int(11) NOT NULL,
    `RESOURCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PERMS_` int(11) DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `ACT_UNIQ_AUTH_USER` (`USER_ID_`,`TYPE_`,`RESOURCE_TYPE_`,`RESOURCE_ID_`),
    UNIQUE KEY `ACT_UNIQ_AUTH_GROUP` (`GROUP_ID_`,`TYPE_`,`RESOURCE_TYPE_`,`RESOURCE_ID_`),
    KEY `ACT_IDX_AUTH_GROUP_ID` (`GROUP_ID_`),
    KEY `ACT_IDX_AUTH_RESOURCE_ID` (`RESOURCE_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_AUTHORIZATION`
--

LOCK TABLES `ACT_RU_AUTHORIZATION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_AUTHORIZATION` DISABLE KEYS */;
INSERT INTO `ACT_RU_AUTHORIZATION` VALUES ('6ecf7c60-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,0,'*',2147483647),('6ed10301-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,1,'*',2147483647),('6ed2b0b2-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,2,'*',2147483647),('6ed521b3-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,3,'*',2147483647),('6ed807e4-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,4,'*',2147483647),('6eda2ac5-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,5,'*',2147483647),('6edc9bc6-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,6,'*',2147483647),('6edfd017-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,7,'*',2147483647),('6ee17dc8-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,8,'*',2147483647),('6ee35289-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,9,'*',2147483647),('6ee5274a-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,10,'*',2147483647),('6ee6d4fb-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,11,'*',2147483647),('6ee85b9c-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,12,'*',2147483647),('6eea576d-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,13,'*',2147483647),('6eec2c2e-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,14,'*',2147483647),('6eee27ff-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,15,'*',2147483647),('6ef09900-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,16,'*',2147483647),('6ef2bbe1-8afa-11ea-b132-c605dd57b976',1,1,'camunda-admin',NULL,17,'*',2147483647);
/*!40000 ALTER TABLE `ACT_RU_AUTHORIZATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_BATCH`
--

DROP TABLE IF EXISTS `ACT_RU_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_BATCH` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) NOT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TOTAL_JOBS_` int(11) DEFAULT NULL,
    `JOBS_CREATED_` int(11) DEFAULT NULL,
    `JOBS_PER_SEED_` int(11) DEFAULT NULL,
    `INVOCATIONS_PER_JOB_` int(11) DEFAULT NULL,
    `SEED_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BATCH_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `MONITOR_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
    `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_BATCH_SEED_JOB_DEF` (`SEED_JOB_DEF_ID_`),
    KEY `ACT_IDX_BATCH_MONITOR_JOB_DEF` (`MONITOR_JOB_DEF_ID_`),
    KEY `ACT_IDX_BATCH_JOB_DEF` (`BATCH_JOB_DEF_ID_`),
    CONSTRAINT `ACT_FK_BATCH_JOB_DEF` FOREIGN KEY (`BATCH_JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`),
    CONSTRAINT `ACT_FK_BATCH_MONITOR_JOB_DEF` FOREIGN KEY (`MONITOR_JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`),
    CONSTRAINT `ACT_FK_BATCH_SEED_JOB_DEF` FOREIGN KEY (`SEED_JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_BATCH`
--

LOCK TABLES `ACT_RU_BATCH` WRITE;
/*!40000 ALTER TABLE `ACT_RU_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_CASE_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_CASE_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_CASE_EXECUTION` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_CASE_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PREV_STATE_` int(11) DEFAULT NULL,
    `CURRENT_STATE_` int(11) DEFAULT NULL,
    `REQUIRED_` tinyint(1) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_CASE_EXEC_BUSKEY` (`BUSINESS_KEY_`),
    KEY `ACT_IDX_CASE_EXE_CASE_INST` (`CASE_INST_ID_`),
    KEY `ACT_FK_CASE_EXE_PARENT` (`PARENT_ID_`),
    KEY `ACT_FK_CASE_EXE_CASE_DEF` (`CASE_DEF_ID_`),
    KEY `ACT_IDX_CASE_EXEC_TENANT_ID` (`TENANT_ID_`),
    CONSTRAINT `ACT_FK_CASE_EXE_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_re_case_def` (`ID_`),
    CONSTRAINT `ACT_FK_CASE_EXE_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_ru_case_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_CASE_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_case_execution` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_CASE_EXECUTION`
--

LOCK TABLES `ACT_RU_CASE_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_CASE_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_CASE_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_CASE_SENTRY_PART`
--

DROP TABLE IF EXISTS `ACT_RU_CASE_SENTRY_PART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_CASE_SENTRY_PART` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_EXEC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SENTRY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `SOURCE_CASE_EXEC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `STANDARD_EVENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `SOURCE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VARIABLE_EVENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VARIABLE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `SATISFIED_` tinyint(1) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_FK_CASE_SENTRY_CASE_INST` (`CASE_INST_ID_`),
    KEY `ACT_FK_CASE_SENTRY_CASE_EXEC` (`CASE_EXEC_ID_`),
    CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_EXEC` FOREIGN KEY (`CASE_EXEC_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
    CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_ru_case_execution` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_CASE_SENTRY_PART`
--

LOCK TABLES `ACT_RU_CASE_SENTRY_PART` WRITE;
/*!40000 ALTER TABLE `ACT_RU_CASE_SENTRY_PART` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_CASE_SENTRY_PART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EVENT_SUBSCR`
--

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CREATED_` datetime NOT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
    KEY `ACT_IDX_EVENT_SUBSCR_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
    KEY `ACT_IDX_EVENT_SUBSCR_EVT_NAME` (`EVENT_NAME_`),
    CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EVENT_SUBSCR`
--

LOCK TABLES `ACT_RU_EVENT_SUBSCR` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EXECUTION` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUPER_CASE_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
    `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
    `IS_SCOPE_` tinyint(4) DEFAULT NULL,
    `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
    `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
    `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_EXEC_ROOT_PI` (`ROOT_PROC_INST_ID_`),
    KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
    KEY `ACT_IDX_EXEC_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
    KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
    KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
    CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXECUTION`
--

LOCK TABLES `ACT_RU_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXT_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_EXT_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_EXT_TASK` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) NOT NULL,
    `WORKER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TOPIC_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `RETRIES_` int(11) DEFAULT NULL,
    `ERROR_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `ERROR_DETAILS_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `LOCK_EXP_TIME_` datetime DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_EXT_TASK_TOPIC` (`TOPIC_NAME_`),
    KEY `ACT_IDX_EXT_TASK_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_EXT_TASK_PRIORITY` (`PRIORITY_`),
    KEY `ACT_IDX_EXT_TASK_ERR_DETAILS` (`ERROR_DETAILS_ID_`),
    KEY `ACT_IDX_EXT_TASK_EXEC` (`EXECUTION_ID_`),
    CONSTRAINT `ACT_FK_EXT_TASK_ERROR_DETAILS` FOREIGN KEY (`ERROR_DETAILS_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_EXT_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXT_TASK`
--

LOCK TABLES `ACT_RU_EXT_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXT_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXT_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_FILTER`
--

DROP TABLE IF EXISTS `ACT_RU_FILTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_FILTER` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) NOT NULL,
    `RESOURCE_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
    `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `QUERY_` longtext COLLATE utf8_bin NOT NULL,
    `PROPERTIES_` longtext COLLATE utf8_bin,
    PRIMARY KEY (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_FILTER`
--

LOCK TABLES `ACT_RU_FILTER` WRITE;
/*!40000 ALTER TABLE `ACT_RU_FILTER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_FILTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
    KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
    KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
    CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_IDENTITYLINK`
--

LOCK TABLES `ACT_RU_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_INCIDENT`
--

DROP TABLE IF EXISTS `ACT_RU_INCIDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_INCIDENT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) NOT NULL,
    `INCIDENT_TIMESTAMP_` datetime NOT NULL,
    `INCIDENT_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `INCIDENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_INC_CONFIGURATION` (`CONFIGURATION_`),
    KEY `ACT_IDX_INC_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_INC_JOB_DEF` (`JOB_DEF_ID_`),
    KEY `ACT_IDX_INC_CAUSEINCID` (`CAUSE_INCIDENT_ID_`),
    KEY `ACT_IDX_INC_EXID` (`EXECUTION_ID_`),
    KEY `ACT_IDX_INC_PROCDEFID` (`PROC_DEF_ID_`),
    KEY `ACT_IDX_INC_PROCINSTID` (`PROC_INST_ID_`),
    KEY `ACT_IDX_INC_ROOTCAUSEINCID` (`ROOT_CAUSE_INCIDENT_ID_`),
    CONSTRAINT `ACT_FK_INC_CAUSE` FOREIGN KEY (`CAUSE_INCIDENT_ID_`) REFERENCES `act_ru_incident` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_INC_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_INC_JOB_DEF` FOREIGN KEY (`JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`),
    CONSTRAINT `ACT_FK_INC_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_INC_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_INC_RCAUSE` FOREIGN KEY (`ROOT_CAUSE_INCIDENT_ID_`) REFERENCES `act_ru_incident` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_INCIDENT`
--

LOCK TABLES `ACT_RU_INCIDENT` WRITE;
/*!40000 ALTER TABLE `ACT_RU_INCIDENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_INCIDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_JOB` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `LOCK_EXP_TIME_` datetime DEFAULT NULL,
    `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROCESS_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROCESS_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `RETRIES_` int(11) DEFAULT NULL,
    `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DUEDATE_` datetime DEFAULT NULL,
    `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) NOT NULL DEFAULT '1',
    `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
    `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` datetime DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_JOB_EXECUTION_ID` (`EXECUTION_ID_`),
    KEY `ACT_IDX_JOB_HANDLER` (`HANDLER_TYPE_`(100),`HANDLER_CFG_`(155)),
    KEY `ACT_IDX_JOB_PROCINST` (`PROCESS_INSTANCE_ID_`),
    KEY `ACT_IDX_JOB_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_JOB_JOB_DEF_ID` (`JOB_DEF_ID_`),
    KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
    KEY `ACT_IDX_JOB_HANDLER_TYPE` (`HANDLER_TYPE_`),
    CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOB`
--

LOCK TABLES `ACT_RU_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOBDEF`
--

DROP TABLE IF EXISTS `ACT_RU_JOBDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_JOBDEF` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `JOB_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `JOB_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
    `JOB_PRIORITY_` bigint(20) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_JOBDEF_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_JOBDEF_PROC_DEF_ID` (`PROC_DEF_ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOBDEF`
--

LOCK TABLES `ACT_RU_JOBDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOBDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOBDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_METER_LOG`
--

DROP TABLE IF EXISTS `ACT_RU_METER_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_METER_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REPORTER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VALUE_` bigint(20) DEFAULT NULL,
    `TIMESTAMP_` datetime DEFAULT NULL,
    `MILLISECONDS_` bigint(20) DEFAULT '0',
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_METER_LOG_MS` (`MILLISECONDS_`),
    KEY `ACT_IDX_METER_LOG_NAME_MS` (`NAME_`,`MILLISECONDS_`),
    KEY `ACT_IDX_METER_LOG_REPORT` (`NAME_`,`REPORTER_`,`MILLISECONDS_`),
    KEY `ACT_IDX_METER_LOG_TIME` (`TIMESTAMP_`),
    KEY `ACT_IDX_METER_LOG` (`NAME_`,`TIMESTAMP_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_METER_LOG`
--

LOCK TABLES `ACT_RU_METER_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_RU_METER_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_METER_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_TASK` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_` int(11) DEFAULT NULL,
    `CREATE_TIME_` datetime DEFAULT NULL,
    `DUE_DATE_` datetime DEFAULT NULL,
    `FOLLOW_UP_DATE_` datetime DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
    KEY `ACT_IDX_TASK_ASSIGNEE` (`ASSIGNEE_`),
    KEY `ACT_IDX_TASK_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
    KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
    KEY `ACT_FK_TASK_CASE_EXE` (`CASE_EXECUTION_ID_`),
    KEY `ACT_FK_TASK_CASE_DEF` (`CASE_DEF_ID_`),
    CONSTRAINT `ACT_FK_TASK_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_re_case_def` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TASK`
--

LOCK TABLES `ACT_RU_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_VARIABLE`
--

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACT_RU_VARIABLE` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `DOUBLE_` double DEFAULT NULL,
    `LONG_` bigint(20) DEFAULT NULL,
    `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `VAR_SCOPE_` varchar(64) COLLATE utf8_bin NOT NULL,
    `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
    `IS_CONCURRENT_LOCAL_` tinyint(4) DEFAULT NULL,
    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`),
    UNIQUE KEY `ACT_UNIQ_VARIABLE` (`VAR_SCOPE_`,`NAME_`),
    KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
    KEY `ACT_IDX_VARIABLE_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
    KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
    KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
    KEY `ACT_FK_VAR_CASE_EXE` (`CASE_EXECUTION_ID_`),
    KEY `ACT_FK_VAR_CASE_INST` (`CASE_INST_ID_`),
    CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 23:54:35

DROP TABLE IF EXISTS WORKER_NODE;
CREATE TABLE WORKER_NODE
(
    ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
    HOST_NAME VARCHAR(64) NOT NULL COMMENT 'host name',
    PORT VARCHAR(64) NOT NULL COMMENT 'port',
    TYPE INT NOT NULL COMMENT 'node type: CONTAINER(1), ACTUAL(2), FAKE(3)',
    LAUNCH_DATE DATE NOT NULL COMMENT 'launch date',
    MODIFIED TIMESTAMP NOT NULL COMMENT 'modified time',
    CREATED TIMESTAMP NOT NULL COMMENT 'created time',
    PRIMARY KEY(ID)
)
COMMENT='DB WorkerID Assigner for UID Generator',ENGINE = INNODB;

DROP TABLE IF EXISTS DEFINE_KEY;
DROP TABLE IF EXISTS BUSINESS_DESCRIPTION;
DROP TABLE IF EXISTS OPERATION;
DROP TABLE IF EXISTS BUSINESS;
DROP TABLE IF EXISTS BUSINESS_DEFINE;

CREATE TABLE BUSINESS
(
    ID bigint NOT NULL,
    STATUS varchar(9) NOT NULL,
    CREATE_TIME datetime NOT NULL,
    COMPLETE_TIME datetime,
    DEFINE varchar(32) NOT NULL,
    NAME varchar(32) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE BUSINESS_DEFINE
(
    NAME varchar(32) NOT NULL,
    ID varchar(32) NOT NULL,
    PROCESS varchar(32),
    DESCRIPTION_TEMPLATE text NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE BUSINESS_DESCRIPTION
(
    ID bigint NOT NULL,
    DESCRIPTION text NOT NULL,
    _KEYS varchar(1024),
    TAGS text,
    PROCESS boolean NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE OPERATION
(
    BUSINESS_ID bigint NOT NULL,
    OPERATION_TIME datetime NOT NULL,
    TYPE varchar(16) NOT NULL,
    EMP_ID varchar(32),
    EMP_NAME varchar(32) NOT NULL,
    TASK_NAME varchar(32) NULL,
    DESCRIPTION varchar(512),
    ID bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;

CREATE TABLE DEFINE_KEY
(
    BUSINESS bigint NOT NULL,
    CATEGORY varchar(16) NOT NULL,
    _KEYS varchar(1024) NOT NULL,
    PRIMARY KEY (BUSINESS, CATEGORY)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;

/* Create Foreign Keys */

ALTER TABLE BUSINESS_DESCRIPTION
    ADD FOREIGN KEY (ID)
        REFERENCES BUSINESS (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE OPERATION
    ADD FOREIGN KEY (BUSINESS_ID)
        REFERENCES BUSINESS (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE DEFINE_KEY
    ADD FOREIGN KEY (BUSINESS)
        REFERENCES BUSINESS_DESCRIPTION (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;

