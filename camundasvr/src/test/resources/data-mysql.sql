

USE camunda;


insert into BUSINESS_DEFINE(ID, NAME,PROCESS,DESCRIPTION_TEMPLATE) VALUES ('FIRE_CHECK','建设工程消防验收','construct-fire-check','项目名称为${name!"-"}, 面积${area!"-"}');

-- insert into user_role(authority,username) VALUES ('HR','test2');