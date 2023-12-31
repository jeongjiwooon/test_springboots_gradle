-- CREATE SCHEMA db_yojulab;
-- DROP DATABASE `db_yojulab`;

-- use `db_yojulab`;

-- 공통코드
CREATE TABLE COMMONS_CODE
(
	-- 공통 코드_ID(사용자 입력 가능)
	COMMON_CODE_ID varchar(40) NOT NULL COMMENT '공통 코드_ID',
	-- 명칭
	NAME varchar(1000) NOT NULL COMMENT '명칭',
	-- 정렬순서
	ORDER_NUMBER decimal COMMENT '정렬순서',
	-- 속성_1 
	ATTRIBUTION_1 varchar(60) COMMENT '속성_1',
	-- 속성_2
	ATTRIBUTION_2 varchar(60) COMMENT '속성_2',
	DESCRIPTION varchar(1000) COMMENT '코드설명',
	-- 삭제불가(초기 시스템 코드 or 카테고리)
	SYSTEM_CODE_YN varchar(40) DEFAULT 'N' NOT NULL COMMENT '초기 시스템 코드 여부',
	-- 사용 여부
	USE_YN varchar(40) NOT NULL COMMENT '사용 여부',
	-- 공통 코드_ID(사용자 입력 가능)
	PARENT_COMMON_CODE_ID varchar(40) COMMENT '상위 공통 코드 ID',
	-- 등록자SEQ
	REGISTER_SEQ varchar(50) NOT NULL COMMENT '등록자SEQ',
	-- 등록일자
	REGISTRY_DATE varchar(20) NOT NULL COMMENT '등록일자',
	MODIFIER_SEQ varchar(40) NOT NULL COMMENT '수정자_SEQ',
	-- 수정일자
	MODIFY_DATE varchar(20) NOT NULL COMMENT '수정일자',
	PRIMARY KEY (COMMON_CODE_ID)
) COMMENT = '공통코드';


CREATE TABLE AUTH_NAMES
(
  AUTH_NAME VARCHAR(200) NOT NULL COMMENT '접근권한명',
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '접근권한 대표값',
  PRIMARY KEY (UNIQUE_ID)
) COMMENT '접근권한명';

CREATE TABLE AUTHS
(
  UNIQUE_ID_USERS      VARCHAR(200) NOT NULL COMMENT '대표값',
  UNIQUE_ID_AUTH_NAMES VARCHAR(200) NOT NULL COMMENT '접근권한 대표값',
  PRIMARY KEY (UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
) COMMENT '권한들';

CREATE TABLE USERS
(
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '대표값',
  NAME      VARCHAR(200) NOT NULL COMMENT '이름',
  PASSWORD  VARCHAR(200) NOT NULL COMMENT '암호화',
  EMAIL     VARCHAR(200) NOT NULL COMMENT '이메일',
  JOB       VARCHAR(200) NULL     COMMENT '직책',
  PRIMARY KEY (UNIQUE_ID)
) COMMENT '사용자들';

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_USERS_TO_AUTHS
    FOREIGN KEY (UNIQUE_ID_USERS)
    REFERENCES USERS (UNIQUE_ID);

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_AUTH_NAMES_TO_AUTHS
    FOREIGN KEY (UNIQUE_ID_AUTH_NAMES)
    REFERENCES AUTH_NAMES (UNIQUE_ID);


CREATE TABLE CAR_INFORS
(
  CAR_NAME     VARCHAR(50) NOT NULL COMMENT '자동차이름',
  YEAR         VARCHAR(50) NOT NULL COMMENT '연식',
  CAR_INFOR_ID VARCHAR(50) NOT NULL,
  COMPANY_ID   VARCHAR(50) NOT NULL,
  PRIMARY KEY (CAR_INFOR_ID)
) COMMENT '차_정보';

CREATE TABLE FACTORYS
(
  COMPANY_ID VARCHAR(50) NOT NULL,
  COMPANY    VARCHAR(50) NOT NULL COMMENT '회사명',
  PRIMARY KEY (COMPANY_ID)
) COMMENT '자동차회사';

CREATE TABLE OPTION_INFORS
(
  OPTION_INFOR_ID VARCHAR(50)  NOT NULL,
  OPTION_NAME     VARCHAR(500) NOT NULL COMMENT '옵션명',
  PRIMARY KEY (OPTION_INFOR_ID)
) COMMENT '옵션 정보';

CREATE TABLE OPTIONS
(
  OPTION_ID       VARCHAR(50) NOT NULL,
  CAR_INFOR_ID    VARCHAR(50) NOT NULL,
  OPTION_INFOR_ID VARCHAR(50) NOT NULL,
  PRIMARY KEY (OPTION_ID)
);

ALTER TABLE CAR_INFORS
  ADD CONSTRAINT FK_FACTORYS_TO_CAR_INFORS
    FOREIGN KEY (COMPANY_ID)
    REFERENCES FACTORYS (COMPANY_ID);

ALTER TABLE OPTIONS
  ADD CONSTRAINT FK_CAR_INFORS_TO_OPTIONS
    FOREIGN KEY (CAR_INFOR_ID)
    REFERENCES CAR_INFORS (CAR_INFOR_ID);

ALTER TABLE OPTIONS
  ADD CONSTRAINT FK_OPTION_INFORS_TO_OPTIONS
    FOREIGN KEY (OPTION_INFOR_ID)
    REFERENCES OPTION_INFORS (OPTION_INFOR_ID);    

select 'Done'    ;