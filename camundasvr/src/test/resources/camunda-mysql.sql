-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: camunda
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB-1:10.3.14+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_BYTEARRAY` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `BYTES_` longblob DEFAULT NULL,
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
    CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('747d0b34-9547-11ea-957d-0242c0a8200e',1,'BOOT-INF/classes/bpmn/fire_check.bpmn','747cbd13-9547-11ea-957d-0242c0a8200e','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<bpmn:definitions xmlns:bpmn=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" id=\"Definitions_0an2ffa\" targetNamespace=\"http://bpmn.io/schema/bpmn\" exporter=\"Camunda Modeler\" exporterVersion=\"3.6.0\">\n  <bpmn:process id=\"construct-fire-check\" name=\"建设工程消防验收\" isExecutable=\"true\">\n    <bpmn:documentation>process description:${description}</bpmn:documentation>\n    <bpmn:startEvent id=\"StartEvent_1\">\n      <bpmn:extensionElements>\n        <camunda:formData>\n          <camunda:formField id=\"reapply\" label=\"重新受理\" type=\"boolean\" defaultValue=\"false\" />\n          <camunda:formField id=\"approved\" label=\"通过\" type=\"boolean\" defaultValue=\"true\" />\n          <camunda:formField id=\"description\" label=\"业务描述\" type=\"string\" />\n          <camunda:formField id=\"define\" label=\"定义\" type=\"string\" />\n          <camunda:formField id=\"_key\" label=\"key\" type=\"string\" />\n        </camunda:formData>\n      </bpmn:extensionElements>\n      <bpmn:outgoing>SequenceFlow_1g9236z</bpmn:outgoing>\n    </bpmn:startEvent>\n    <bpmn:userTask id=\"Task_0uh9i46\" name=\"初审\">\n      <bpmn:documentation>task description : ${approved}</bpmn:documentation>\n      <bpmn:extensionElements>\n        <camunda:properties>\n          <camunda:property name=\"check\" value=\"true\" />\n        </camunda:properties>\n      </bpmn:extensionElements>\n      <bpmn:incoming>SequenceFlow_07nl9hl</bpmn:incoming>\n      <bpmn:incoming>SequenceFlow_1g9236z</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_05iexw2</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:userTask id=\"Task_1n7az2l\" name=\"现场勘查\">\n      <bpmn:documentation>task description : ${approved}</bpmn:documentation>\n      <bpmn:incoming>SequenceFlow_1j45le8</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1a4il65</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_096df9l\">\n      <bpmn:incoming>SequenceFlow_05iexw2</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1j45le8</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_1q35odi</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_0cshi8n</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_05iexw2\" sourceRef=\"Task_0uh9i46\" targetRef=\"ExclusiveGateway_096df9l\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_1j45le8\" name=\"通过\" sourceRef=\"ExclusiveGateway_096df9l\" targetRef=\"Task_1n7az2l\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${approved &amp;&amp; !reapply}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_0hyq89q\">\n      <bpmn:incoming>SequenceFlow_1a4il65</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_0utdw6c</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_1ihydai</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_0pei03o</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1a4il65\" sourceRef=\"Task_1n7az2l\" targetRef=\"ExclusiveGateway_0hyq89q\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_0utdw6c\" name=\"合格\" sourceRef=\"ExclusiveGateway_0hyq89q\" targetRef=\"Task_0srpcip\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${approved &amp;&amp; !reapply}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:userTask id=\"Task_0srpcip\" name=\"审批\">\n      <bpmn:incoming>SequenceFlow_0utdw6c</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_0qoi6ga</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_149chwv\">\n      <bpmn:incoming>SequenceFlow_0qoi6ga</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1tvahgj</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_1cgqxaw</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_1gnecqi</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0qoi6ga\" sourceRef=\"Task_0srpcip\" targetRef=\"ExclusiveGateway_149chwv\" />\n    <bpmn:userTask id=\"Task_0kxq805\" name=\"重新受理\">\n      <bpmn:incoming>SequenceFlow_1q35odi</bpmn:incoming>\n      <bpmn:incoming>SequenceFlow_1ihydai</bpmn:incoming>\n      <bpmn:incoming>SequenceFlow_1tvahgj</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_07nl9hl</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:sequenceFlow id=\"SequenceFlow_07nl9hl\" sourceRef=\"Task_0kxq805\" targetRef=\"Task_0uh9i46\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_1q35odi\" sourceRef=\"ExclusiveGateway_096df9l\" targetRef=\"Task_0kxq805\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${reapply ==true}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1ihydai\" sourceRef=\"ExclusiveGateway_0hyq89q\" targetRef=\"Task_0kxq805\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${reapply ==true}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1tvahgj\" sourceRef=\"ExclusiveGateway_149chwv\" targetRef=\"Task_0kxq805\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${reapply ==true}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:serviceTask id=\"Task_18x713w\" name=\"验收合格\" camunda:delegateExpression=\"${qualifiedDelegate}\">\n      <bpmn:incoming>SequenceFlow_1cgqxaw</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1oz9rbs</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1cgqxaw\" name=\"合格\" sourceRef=\"ExclusiveGateway_149chwv\" targetRef=\"Task_18x713w\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${approved &amp;&amp; !reapply}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:endEvent id=\"EndEvent_12kfhux\">\n      <bpmn:incoming>SequenceFlow_1oz9rbs</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1oz9rbs\" sourceRef=\"Task_18x713w\" targetRef=\"EndEvent_12kfhux\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_1gnecqi\" sourceRef=\"ExclusiveGateway_149chwv\" targetRef=\"Task_0dbpyfv\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${!approved &amp;&amp; !reapply}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:serviceTask id=\"Task_0dbpyfv\" name=\"不合格\" camunda:delegateExpression=\"${unqualifiedDelegate}\">\n      <bpmn:incoming>SequenceFlow_1gnecqi</bpmn:incoming>\n      <bpmn:incoming>SequenceFlow_0pei03o</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1ogc7q3</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:endEvent id=\"EndEvent_0tmg0tf\">\n      <bpmn:incoming>SequenceFlow_1ogc7q3</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1ogc7q3\" sourceRef=\"Task_0dbpyfv\" targetRef=\"EndEvent_0tmg0tf\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_0pei03o\" sourceRef=\"ExclusiveGateway_0hyq89q\" targetRef=\"Task_0dbpyfv\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${!approved &amp;&amp; !reapply}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0cshi8n\" sourceRef=\"ExclusiveGateway_096df9l\" targetRef=\"Task_05swjnd\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${!approved &amp;&amp; !reapply}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:serviceTask id=\"Task_05swjnd\" name=\"不予受理\" camunda:delegateExpression=\"${noAcceptDelegate}\">\n      <bpmn:incoming>SequenceFlow_0cshi8n</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_163vend</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:endEvent id=\"EndEvent_0j9rh26\">\n      <bpmn:incoming>SequenceFlow_163vend</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_163vend\" sourceRef=\"Task_05swjnd\" targetRef=\"EndEvent_0j9rh26\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_1g9236z\" sourceRef=\"StartEvent_1\" targetRef=\"Task_0uh9i46\" />\n  </bpmn:process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_1\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"construct-fire-check\">\n      <bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1\">\n        <dc:Bounds x=\"152\" y=\"252\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"149\" y=\"295\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"UserTask_09cp3wf_di\" bpmnElement=\"Task_0uh9i46\">\n        <dc:Bounds x=\"270\" y=\"230\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"UserTask_0h8a1y2_di\" bpmnElement=\"Task_1n7az2l\">\n        <dc:Bounds x=\"570\" y=\"230\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_096df9l_di\" bpmnElement=\"ExclusiveGateway_096df9l\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"455\" y=\"245\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_05iexw2_di\" bpmnElement=\"SequenceFlow_05iexw2\">\n        <di:waypoint x=\"370\" y=\"270\" />\n        <di:waypoint x=\"455\" y=\"270\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1j45le8_di\" bpmnElement=\"SequenceFlow_1j45le8\">\n        <di:waypoint x=\"505\" y=\"270\" />\n        <di:waypoint x=\"570\" y=\"270\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"527\" y=\"252\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_0hyq89q_di\" bpmnElement=\"ExclusiveGateway_0hyq89q\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"715\" y=\"245\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1a4il65_di\" bpmnElement=\"SequenceFlow_1a4il65\">\n        <di:waypoint x=\"670\" y=\"270\" />\n        <di:waypoint x=\"715\" y=\"270\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0utdw6c_di\" bpmnElement=\"SequenceFlow_0utdw6c\">\n        <di:waypoint x=\"765\" y=\"270\" />\n        <di:waypoint x=\"820\" y=\"270\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"783\" y=\"252\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"UserTask_1o0tn02_di\" bpmnElement=\"Task_0srpcip\">\n        <dc:Bounds x=\"820\" y=\"230\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_149chwv_di\" bpmnElement=\"ExclusiveGateway_149chwv\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"965\" y=\"245\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0qoi6ga_di\" bpmnElement=\"SequenceFlow_0qoi6ga\">\n        <di:waypoint x=\"920\" y=\"270\" />\n        <di:waypoint x=\"965\" y=\"270\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"UserTask_0kg69p2_di\" bpmnElement=\"Task_0kxq805\">\n        <dc:Bounds x=\"270\" y=\"90\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_07nl9hl_di\" bpmnElement=\"SequenceFlow_07nl9hl\">\n        <di:waypoint x=\"320\" y=\"170\" />\n        <di:waypoint x=\"320\" y=\"230\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1q35odi_di\" bpmnElement=\"SequenceFlow_1q35odi\">\n        <di:waypoint x=\"480\" y=\"245\" />\n        <di:waypoint x=\"480\" y=\"130\" />\n        <di:waypoint x=\"370\" y=\"130\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1ihydai_di\" bpmnElement=\"SequenceFlow_1ihydai\">\n        <di:waypoint x=\"740\" y=\"245\" />\n        <di:waypoint x=\"740\" y=\"130\" />\n        <di:waypoint x=\"370\" y=\"130\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1tvahgj_di\" bpmnElement=\"SequenceFlow_1tvahgj\">\n        <di:waypoint x=\"990\" y=\"245\" />\n        <di:waypoint x=\"990\" y=\"130\" />\n        <di:waypoint x=\"370\" y=\"130\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_0ecic8i_di\" bpmnElement=\"Task_18x713w\">\n        <dc:Bounds x=\"1080\" y=\"230\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1cgqxaw_di\" bpmnElement=\"SequenceFlow_1cgqxaw\">\n        <di:waypoint x=\"1015\" y=\"270\" />\n        <di:waypoint x=\"1080\" y=\"270\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"1037\" y=\"252\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"EndEvent_12kfhux_di\" bpmnElement=\"EndEvent_12kfhux\">\n        <dc:Bounds x=\"1252\" y=\"252\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1oz9rbs_di\" bpmnElement=\"SequenceFlow_1oz9rbs\">\n        <di:waypoint x=\"1180\" y=\"270\" />\n        <di:waypoint x=\"1252\" y=\"270\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1gnecqi_di\" bpmnElement=\"SequenceFlow_1gnecqi\">\n        <di:waypoint x=\"990\" y=\"295\" />\n        <di:waypoint x=\"990\" y=\"380\" />\n        <di:waypoint x=\"1080\" y=\"380\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_0wu0sl1_di\" bpmnElement=\"Task_0dbpyfv\">\n        <dc:Bounds x=\"1080\" y=\"340\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"EndEvent_0tmg0tf_di\" bpmnElement=\"EndEvent_0tmg0tf\">\n        <dc:Bounds x=\"1252\" y=\"362\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1ogc7q3_di\" bpmnElement=\"SequenceFlow_1ogc7q3\">\n        <di:waypoint x=\"1180\" y=\"380\" />\n        <di:waypoint x=\"1252\" y=\"380\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0pei03o_di\" bpmnElement=\"SequenceFlow_0pei03o\">\n        <di:waypoint x=\"740\" y=\"295\" />\n        <di:waypoint x=\"740\" y=\"380\" />\n        <di:waypoint x=\"1080\" y=\"380\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0cshi8n_di\" bpmnElement=\"SequenceFlow_0cshi8n\">\n        <di:waypoint x=\"480\" y=\"295\" />\n        <di:waypoint x=\"480\" y=\"380\" />\n        <di:waypoint x=\"570\" y=\"380\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_1pmralp_di\" bpmnElement=\"Task_05swjnd\">\n        <dc:Bounds x=\"570\" y=\"340\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"EndEvent_0j9rh26_di\" bpmnElement=\"EndEvent_0j9rh26\">\n        <dc:Bounds x=\"722\" y=\"452\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_163vend_di\" bpmnElement=\"SequenceFlow_163vend\">\n        <di:waypoint x=\"620\" y=\"420\" />\n        <di:waypoint x=\"620\" y=\"470\" />\n        <di:waypoint x=\"722\" y=\"470\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1g9236z_di\" bpmnElement=\"SequenceFlow_1g9236z\">\n        <di:waypoint x=\"188\" y=\"270\" />\n        <di:waypoint x=\"270\" y=\"270\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</bpmn:definitions>\n',0,NULL,1,'2020-05-14 02:27:51',NULL,NULL),('747d0b35-9547-11ea-957d-0242c0a8200e',1,'BOOT-INF/classes/bpmn/sample.bpmn','747cbd13-9547-11ea-957d-0242c0a8200e','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<bpmn2:definitions xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmn2=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xsi:schemaLocation=\"http://www.omg.org/spec/BPMN/20100524/MODEL BPMN20.xsd\" id=\"_VtQR8L0REeSNuv6S7H6XsA\" exporter=\"camunda modeler\" exporterVersion=\"2.7.0\" targetNamespace=\"http://camunda.org/examples\">\n    <bpmn2:process id=\"testProcess\" isExecutable=\"true\">\n        <bpmn2:startEvent id=\"StartEvent_1\">\n            <bpmn2:outgoing>SequenceFlow_1</bpmn2:outgoing>\n        </bpmn2:startEvent>\n        <bpmn2:scriptTask id=\"ScriptTask_1\" name=\"Extract Price\" scriptFormat=\"javascript\">\n            <bpmn2:incoming>SequenceFlow_1</bpmn2:incoming>\n            <bpmn2:outgoing>SequenceFlow_2</bpmn2:outgoing>\n            <bpmn2:script><![CDATA[var carJson = execution.getVariableTyped(\"car\").getValueSerialized();\nvar price = S(carJson ).prop(\"price\").numberValue();\nexecution.setVariable(\"price\", price);]]></bpmn2:script>\n        </bpmn2:scriptTask>\n        <bpmn2:sequenceFlow id=\"SequenceFlow_1\" name=\"\" sourceRef=\"StartEvent_1\" targetRef=\"ScriptTask_1\"/>\n        <bpmn2:userTask id=\"UserTask_1\" name=\"Examine Price\">\n            <bpmn2:incoming>SequenceFlow_2</bpmn2:incoming>\n            <bpmn2:outgoing>SequenceFlow_3</bpmn2:outgoing>\n        </bpmn2:userTask>\n        <bpmn2:sequenceFlow id=\"SequenceFlow_2\" name=\"\" sourceRef=\"ScriptTask_1\" targetRef=\"UserTask_1\"/>\n        <bpmn2:endEvent id=\"EndEvent_1\">\n            <bpmn2:incoming>SequenceFlow_3</bpmn2:incoming>\n        </bpmn2:endEvent>\n        <bpmn2:sequenceFlow id=\"SequenceFlow_3\" name=\"\" sourceRef=\"UserTask_1\" targetRef=\"EndEvent_1\"/>\n    </bpmn2:process>\n    <bpmndi:BPMNDiagram id=\"BPMNDiagram_1\">\n        <bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"testProcess\">\n            <bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_39\" bpmnElement=\"StartEvent_1\">\n                <dc:Bounds height=\"36.0\" width=\"36.0\" x=\"120.0\" y=\"217.0\"/>\n            </bpmndi:BPMNShape>\n            <bpmndi:BPMNShape id=\"_BPMNShape_ScriptTask_2\" bpmnElement=\"ScriptTask_1\">\n                <dc:Bounds height=\"80.0\" width=\"100.0\" x=\"206.0\" y=\"195.0\"/>\n            </bpmndi:BPMNShape>\n            <bpmndi:BPMNEdge id=\"BPMNEdge_SequenceFlow_1\" bpmnElement=\"SequenceFlow_1\" sourceElement=\"_BPMNShape_StartEvent_39\" targetElement=\"_BPMNShape_ScriptTask_2\">\n                <di:waypoint xsi:type=\"dc:Point\" x=\"156.0\" y=\"235.0\"/>\n                <di:waypoint xsi:type=\"dc:Point\" x=\"206.0\" y=\"235.0\"/>\n            </bpmndi:BPMNEdge>\n            <bpmndi:BPMNShape id=\"_BPMNShape_UserTask_2\" bpmnElement=\"UserTask_1\">\n                <dc:Bounds height=\"80.0\" width=\"100.0\" x=\"356.0\" y=\"195.0\"/>\n            </bpmndi:BPMNShape>\n            <bpmndi:BPMNEdge id=\"BPMNEdge_SequenceFlow_2\" bpmnElement=\"SequenceFlow_2\" sourceElement=\"_BPMNShape_ScriptTask_2\" targetElement=\"_BPMNShape_UserTask_2\">\n                <di:waypoint xsi:type=\"dc:Point\" x=\"306.0\" y=\"235.0\"/>\n                <di:waypoint xsi:type=\"dc:Point\" x=\"356.0\" y=\"235.0\"/>\n            </bpmndi:BPMNEdge>\n            <bpmndi:BPMNShape id=\"_BPMNShape_EndEvent_102\" bpmnElement=\"EndEvent_1\">\n                <dc:Bounds height=\"36.0\" width=\"36.0\" x=\"506.0\" y=\"217.0\"/>\n            </bpmndi:BPMNShape>\n            <bpmndi:BPMNEdge id=\"BPMNEdge_SequenceFlow_3\" bpmnElement=\"SequenceFlow_3\" sourceElement=\"_BPMNShape_UserTask_2\" targetElement=\"_BPMNShape_EndEvent_102\">\n                <di:waypoint xsi:type=\"dc:Point\" x=\"456.0\" y=\"235.0\"/>\n                <di:waypoint xsi:type=\"dc:Point\" x=\"506.0\" y=\"235.0\"/>\n            </bpmndi:BPMNEdge>\n        </bpmndi:BPMNPlane>\n    </bpmndi:BPMNDiagram>\n</bpmn2:definitions>',0,NULL,1,'2020-05-14 02:27:51',NULL,NULL);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `ACT_GE_SCHEMA_LOG` VALUES ('0','2020-05-14 02:23:21','7.12.0');
/*!40000 ALTER TABLE `ACT_GE_SCHEMA_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
    `FULL_MSG_` longblob DEFAULT NULL,
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
-- Table structure for table `ACT_HI_DECINST`
--

DROP TABLE IF EXISTS `ACT_HI_DECINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `ACT_HI_DEC_IN`
--

DROP TABLE IF EXISTS `ACT_HI_DEC_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
    KEY `ACT_IDX_HI_DETAIL_TASK_BYTEAR` (`BYTEARRAY_ID_`,`TASK_ID_`),
    KEY `ACT_IDX_HI_DETAIL_VAR_INST_ID` (`VAR_INST_ID_`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_EXT_TASK_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TIMESTAMP_` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `EXT_TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `RETRIES_` int(11) DEFAULT NULL,
    `TOPIC_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `WORKER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TIMESTAMP_` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_INCIDENT` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CREATE_TIME_` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `END_TIME_` timestamp NULL DEFAULT NULL,
    `INCIDENT_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `INCIDENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `ROOT_CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `HISTORY_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_JOB_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `TIMESTAMP_` datetime NOT NULL,
    `JOB_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `JOB_DUEDATE_` datetime DEFAULT NULL,
    `JOB_RETRIES_` int(11) DEFAULT NULL,
    `JOB_PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
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
    KEY `ACT_IDX_HI_JOB_LOG_RM_TIME` (`REMOVAL_TIME_`),
    KEY `ACT_IDX_HI_JOB_LOG_JOB_CONF` (`JOB_DEF_CONFIGURATION_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    `TIMESTAMP_` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
    `ANNOTATION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_INFO` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) DEFAULT NULL,
    `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `PASSWORD_` longblob DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
    `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
    KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
    CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
    CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_MEMBERSHIP`
--

LOCK TABLES `ACT_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `ACT_ID_MEMBERSHIP` VALUES ('camunda','camunda-admin');
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TENANT`
--

DROP TABLE IF EXISTS `ACT_ID_TENANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_TENANT_MEMB` FOREIGN KEY (`TENANT_ID_`) REFERENCES `ACT_ID_TENANT` (`ID_`),
    CONSTRAINT `ACT_FK_TENANT_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
    CONSTRAINT `ACT_FK_TENANT_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `ACT_ID_USER` VALUES ('camunda',1,'Camunda','Camunda','camunda@localhost','{SHA-512}xf0BI1NhEKHn6vsVdUxuZaufzzXB3LD0Wz5p7zvtJskMXf5MiCpg9mLFOw0/ZCgK2AtIypd0g13u5tbG91lDsA==','ULS0kr5jnYgf0sI0QjbYKw==',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_CASE_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_CASE_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_DEC_REQ` FOREIGN KEY (`DEC_REQ_ID_`) REFERENCES `ACT_RE_DECISION_REQ_DEF` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('747cbd13-9547-11ea-957d-0242c0a8200e','application','2020-05-14 02:27:51','process application',NULL);
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
    `STARTABLE_` tinyint(1) NOT NULL DEFAULT 1,
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
INSERT INTO `ACT_RE_PROCDEF` VALUES ('construct-fire-check:1:75381dd6-9547-11ea-957d-0242c0a8200e',1,'http://bpmn.io/schema/bpmn','建设工程消防验收','construct-fire-check',1,'747cbd13-9547-11ea-957d-0242c0a8200e','BOOT-INF/classes/bpmn/fire_check.bpmn',NULL,0,1,NULL,NULL,NULL,1),('testProcess:1:753b5227-9547-11ea-957d-0242c0a8200e',1,'http://camunda.org/examples',NULL,'testProcess',1,'747cbd13-9547-11ea-957d-0242c0a8200e','BOOT-INF/classes/bpmn/sample.bpmn',NULL,0,1,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_AUTHORIZATION`
--

DROP TABLE IF EXISTS `ACT_RU_AUTHORIZATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `ACT_RU_AUTHORIZATION` VALUES ('d79532b1-9546-11ea-9b87-0242c0a8200c',1,1,NULL,'camunda',1,'camunda',2147483647),('d7a426d2-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,2,'camunda-admin',2),('d7aab683-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,0,'*',2147483647),('d7ae38f4-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,1,'*',2147483647),('d7b16d45-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,2,'*',2147483647),('d7b45376-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,3,'*',2147483647),('d7b82407-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,4,'*',2147483647),('d7bba678-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,5,'*',2147483647),('d7c2d269-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,6,'*',2147483647),('d7c9d74a-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,7,'*',2147483647),('d7d0b51b-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,8,'*',2147483647),('d7d4fadc-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,9,'*',2147483647),('d7d9198d-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,10,'*',2147483647),('d7dc4dde-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,11,'*',2147483647),('d7dee5ef-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,12,'*',2147483647),('d7e1a510-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,13,'*',2147483647),('d7e54e91-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,14,'*',2147483647),('d7e882e2-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,15,'*',2147483647),('d7eb4203-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,16,'*',2147483647),('d7ef87c4-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,17,'*',2147483647),('d7f21fd5-9546-11ea-9b87-0242c0a8200c',1,1,'camunda-admin',NULL,18,'*',2147483647);
/*!40000 ALTER TABLE `ACT_RU_AUTHORIZATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_BATCH`
--

DROP TABLE IF EXISTS `ACT_RU_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_BATCH_JOB_DEF` FOREIGN KEY (`BATCH_JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`),
    CONSTRAINT `ACT_FK_BATCH_MONITOR_JOB_DEF` FOREIGN KEY (`MONITOR_JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`),
    CONSTRAINT `ACT_FK_BATCH_SEED_JOB_DEF` FOREIGN KEY (`SEED_JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_CASE_EXE_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_RE_CASE_DEF` (`ID_`),
    CONSTRAINT `ACT_FK_CASE_EXE_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_CASE_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_EXEC` FOREIGN KEY (`CASE_EXEC_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
    CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    `PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
    PRIMARY KEY (`ID_`),
    KEY `ACT_IDX_EXT_TASK_TOPIC` (`TOPIC_NAME_`),
    KEY `ACT_IDX_EXT_TASK_TENANT_ID` (`TENANT_ID_`),
    KEY `ACT_IDX_EXT_TASK_PRIORITY` (`PRIORITY_`),
    KEY `ACT_IDX_EXT_TASK_ERR_DETAILS` (`ERROR_DETAILS_ID_`),
    KEY `ACT_IDX_EXT_TASK_EXEC` (`EXECUTION_ID_`),
    CONSTRAINT `ACT_FK_EXT_TASK_ERROR_DETAILS` FOREIGN KEY (`ERROR_DETAILS_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
    CONSTRAINT `ACT_FK_EXT_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_FILTER` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REV_` int(11) NOT NULL,
    `RESOURCE_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
    `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
    `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `QUERY_` longtext COLLATE utf8_bin NOT NULL,
    `PROPERTIES_` longtext COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_FILTER`
--

LOCK TABLES `ACT_RU_FILTER` WRITE;
/*!40000 ALTER TABLE `ACT_RU_FILTER` DISABLE KEYS */;
INSERT INTO `ACT_RU_FILTER` VALUES ('d806b947-9546-11ea-9b87-0242c0a8200c',1,'Task','All tasks',NULL,'{}','');
/*!40000 ALTER TABLE `ACT_RU_FILTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
    CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_INC_CAUSE` FOREIGN KEY (`CAUSE_INCIDENT_ID_`) REFERENCES `ACT_RU_INCIDENT` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_INC_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_INC_JOB_DEF` FOREIGN KEY (`JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`),
    CONSTRAINT `ACT_FK_INC_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
    CONSTRAINT `ACT_FK_INC_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_INC_RCAUSE` FOREIGN KEY (`ROOT_CAUSE_INCIDENT_ID_`) REFERENCES `ACT_RU_INCIDENT` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE
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
/*!40101 SET character_set_client = utf8 */;
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
    `REPEAT_OFFSET_` bigint(20) DEFAULT 0,
    `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `SUSPENSION_STATE_` int(11) NOT NULL DEFAULT 1,
    `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
    `PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
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
    CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_METER_LOG` (
    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
    `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
    `REPORTER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `VALUE_` bigint(20) DEFAULT NULL,
    `TIMESTAMP_` datetime DEFAULT NULL,
    `MILLISECONDS_` bigint(20) DEFAULT 0,
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
INSERT INTO `ACT_RU_METER_LOG` VALUES ('dadfc9e8-9546-11ea-9b87-0242c0a8200c','activity-instance-start','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214050),('dadfc9e9-9546-11ea-9b87-0242c0a8200c','job-acquired-failure','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214050),('dadfc9ea-9546-11ea-9b87-0242c0a8200c','job-locked-exclusive','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214050),('dadff0fb-9546-11ea-9b87-0242c0a8200c','job-execution-rejected','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214051),('dadff0fc-9546-11ea-9b87-0242c0a8200c','executed-decision-elements','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214051),('dadff0fd-9546-11ea-9b87-0242c0a8200c','activity-instance-end','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214051),('dadff0fe-9546-11ea-9b87-0242c0a8200c','job-successful','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214051),('dadff0ff-9546-11ea-9b87-0242c0a8200c','job-acquired-success','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214051),('dadff100-9546-11ea-9b87-0242c0a8200c','job-acquisition-attempt','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214051),('dadff101-9546-11ea-9b87-0242c0a8200c','job-failed','192.168.32.12$default',0,'2020-05-14 02:23:34',1589394214051);
/*!40000 ALTER TABLE `ACT_RU_METER_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_TASK_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_RE_CASE_DEF` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
    CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
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
/*!40101 SET character_set_client = utf8 */;
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
    CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
    CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;



