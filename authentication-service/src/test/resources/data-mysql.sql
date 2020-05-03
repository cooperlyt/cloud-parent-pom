


insert into role(authority, name) VALUES ('HR','人力资源');

insert into role(authority, name) VALUES ('DATA_MGR','数据管理员');



-- pasword: dgsoft

insert into _user(username,password,name,enabled,phone)
VALUES('root','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','root',true,'none');


insert into user_role(authority,username) VALUES ('HR','root');
insert into user_role(authority,username) VALUES ('DATA_MGR','root');