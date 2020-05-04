

DROP DATABASE IF EXISTS CLOUD_AUTH;

CREATE DATABASE CLOUD_AUTH;

USE CLOUD_AUTH;

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
    description varchar(512) NULL,
    `system` boolean NOT NULL,
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
    password varchar(64) NOT NULL,
    name varchar(32) NOT NULL,
    enabled boolean NOT NULL,
    email varchar(32) UNIQUE NULL,
    phone varchar(16) UNIQUE NOT NULL ,
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
