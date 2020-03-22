
insert into role(authority, name, category) VALUES ('HOUSE_GOV','交易管理机构','HG');

insert into role(authority, name, category) VALUES ('ATTACH_CORP','从业机构管理','HG');

insert into role(authority, name, category) VALUES ('HR','人力资源','HG');

insert into role(authority, name,category) VALUES ('DEVELOPER','开发商','DEV');

insert into role(authority,name,category) VALUES('ATTACH_ROOT','从业机构根用户','DEV');



-- pasword: dgsoft

insert into _user(username,password,name,enabled,phone)
VALUES('root','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','root',true,'none');

insert into _user(username,password,name,enabled,phone,org)
VALUES('dtest','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','测试开发商',true,'none2','N2560');


insert into _user(username,password,name,enabled,phone,org)
VALUES('001','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','测试开发商',true,'none2','N2560');

insert into user_role(authority,username) VALUES ('HOUSE_GOV','root');
insert into user_role(authority,username) VALUES ('DEVELOPER','dtest');
insert into user_role(authority,username) VALUES ('DEVELOPER','001');