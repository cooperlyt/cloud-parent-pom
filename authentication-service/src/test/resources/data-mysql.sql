

USE CLOUD_AUTH;
insert into role(authority, name, `system`, description) VALUES ('HR','人力资源', false, '管理用户及权限和相关操作');

insert into role(authority, name, `system`, description) VALUES ('DATA_MGR','数据管理员', false, '可不通过业务修改数据!及进行档案补录.');

insert into role(authority, name, `system`, description) VALUES ('Master','业务人员',false, '登录内部审批管理系统');

insert into role(authority, name, `system`, description) VALUES ('CONSTRUCT.CORP','参建单位管理', false, '管理参建单位');

insert into role(authority, name, `system`, description) VALUES ('Trust','托管认证', true, '用于托管认证,本系统中为外部机构登录');


-- 消防验收管理
insert into role(authority, name, `system`, description) VALUES ('FIRE_CONSTRUCT_CHECK','消防验收管理', false, '对管理消防验收业务进行管理');



insert into role(authority, name, `system`, description) VALUES ('camunda-admin','工作流管理组',false, '工作流管理组, 拥有工作流引擎全部功能');

insert into role(authority, name, `system`, description) VALUES ('camunda-fire-apply','消防验收-受理',false, '消防验收业务办理权限-受理');
insert into role(authority, name, `system`, description) VALUES ('camunda-fire-site','消防验收-现场勘查',false, '消防验收业务办理权限-现场勘查');
insert into role(authority, name, `system`, description) VALUES ('camunda-fire-approval','消防验收-审批',false, '消防验收业务办理权限-审批');


-- pasword: dgsoft

insert into _user(username,password,name,enabled,phone)
VALUES('root','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','root',true,'none');

insert into _user(username,password,name,enabled,phone)
VALUES('apply','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','受理人员',true,'apply');

insert into _user(username,password,name,enabled,phone)
VALUES('apply2','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','受理人员2',true,'apply2');

insert into _user(username,password,name,enabled,phone)
VALUES('site','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','现场勘查',true,'site');


insert into _user(username,password,name,enabled,phone)
VALUES('check','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','审批人员',true,'check');

insert into user_role(authority,username) VALUES ('HR','root');
insert into user_role(authority,username) VALUES ('DATA_MGR','root');
insert into user_role(authority,username) VALUES ('Master','root');
insert into user_role(authority,username) VALUES ('CONSTRUCT.CORP','root');

insert into user_role(authority,username) VALUES ('camunda-admin','root');

insert into user_role(authority,username) VALUES ('Master','apply2');
insert into user_role(authority,username) VALUES ('camunda-fire-apply','apply2');

insert into user_role(authority,username) VALUES ('Master','site');
insert into user_role(authority,username) VALUES ('camunda-fire-site','site');

insert into user_role(authority,username) VALUES ('Master','apply');
insert into user_role(authority,username) VALUES ('camunda-fire-apply','apply');
insert into user_role(authority,username) VALUES ('camunda-fire-site','apply');

insert into user_role(authority,username) VALUES ('Master','check');
insert into user_role(authority,username) VALUES ('camunda-fire-approval','check');


-- insert into user_role(authority,username) VALUES ('HR','test2');