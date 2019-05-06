-- used in tests that use HSQL
/*
create table oauth_client_details (
  client_id VARCHAR(128) PRIMARY KEY,
  resource_ids VARCHAR(128),
  client_secret VARCHAR(128),
  scope VARCHAR(128),
  authorized_grant_types VARCHAR(128),
  web_server_redirect_uri VARCHAR(128),
  authorities VARCHAR(128),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(128)
);

create table oauth_client_token (
  token_id VARCHAR(128),
  token BLOB,
  authentication_id VARCHAR(128) PRIMARY KEY,
  user_name VARCHAR(128),
  client_id VARCHAR(128)
);

create table oauth_access_token (
  token_id VARCHAR(128),
  token BLOB,
  authentication_id VARCHAR(128) PRIMARY KEY,
  user_name VARCHAR(128),
  client_id VARCHAR(128),
  authentication BLOB,
  refresh_token VARCHAR(128)
);

create table oauth_refresh_token (
  token_id VARCHAR(128),
  token BLOB,
  authentication BLOB
);

create table oauth_code (
  code VARCHAR(128), authentication BLOB
);

create table oauth_approvals (
	userId VARCHAR(128),
	clientId VARCHAR(128),
	scope VARCHAR(128),
	status VARCHAR(10),
	expiresAt TIMESTAMP,
	lastModifiedAt TIMESTAMP
);


-- customized oauth_client_details table
create table ClientDetails (
  appId VARCHAR(128) PRIMARY KEY,
  resourceIds VARCHAR(128),
  appSecret VARCHAR(128),
  scope VARCHAR(128),
  grantTypes VARCHAR(128),
  redirectUrl VARCHAR(128),
  authorities VARCHAR(128),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additionalInformation VARCHAR(4096),
  autoApproveScopes VARCHAR(128)
);

insert into oauth_client_details(client_id,client_secret,scope,authorized_grant_types,authorities)
  VALUES('archives','{noop}thisissecret','webclient,mobileclient','refresh_token,password,client_credentials','oauth2');

*/

SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS _user;




/* Create Tables */

CREATE TABLE role
(
	authority varchar(32) NOT NULL,
	name varchar(32) NOT NULL,
	PRIMARY KEY (authority)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE user_role
(
	username varchar(32) NOT NULL,
	authority varchar(32) NOT NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE _user
(
	username varchar(32) NOT NULL,
	password varchar(512) NOT NULL,
	name varchar(64) NOT NULL,
	enabled boolean NOT NULL,
	PRIMARY KEY (username)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;



/* Create Foreign Keys */

ALTER TABLE user_role
	ADD FOREIGN KEY (authority)
REFERENCES role (authority)
ON UPDATE RESTRICT
ON DELETE RESTRICT
;


ALTER TABLE user_role
	ADD FOREIGN KEY (username)
REFERENCES _user (username)
ON UPDATE RESTRICT
ON DELETE RESTRICT
;





insert into role(authority, name) VALUES ('USER','普通用户');
insert into role(authority,name) VALUES('ADMIN','管理员');
insert into role(authority, name) VALUES ('CORP','从业机构');



-- pasword: dgsoft
insert into _user(username,password,name,enabled) VALUES ('root','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','开发商管理员', true);
insert into _user(username,password,name,enabled) VALUES ('test','$2a$10$CmODDYEHEYJYWDsxu9ZzfumnUhiFFViGwq9Fmx12tBjmB/TSzGmBu','测试用户', true);

insert into user_role(authority,username) VALUES ('USER','root');
insert into user_role(authority,username) VALUES ('ADMIN','root');

insert into user_role(authority,username) VALUES ('USER','test');

