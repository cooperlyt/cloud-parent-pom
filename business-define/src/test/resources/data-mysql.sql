
USE CONSTRUCT;


insert into BUSINESS_DEFINE(ID, NAME,PROCESS,DESCRIPTION_TEMPLATE) VALUES ('FIRE_CHECK','建设工程消防验收','construct-fire-check','项目名称为${name!"-"}, 面积${area!"-"}');

insert into BUSINESS_FILE_DEFINE(BUSINESS, _ORDER,NAME,DESCRIPTION, TYPE) VALUES ('FIRE_CHECK',1,'测试要件','测试','ATT')
