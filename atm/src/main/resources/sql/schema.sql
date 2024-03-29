
CREATE TABLE ACCOUNT_TYPE (
  ACCOUNT_TYPE_CODE VARCHAR(10) NOT NULL PRIMARY KEY,
  DESCRIPTION       VARCHAR(50) NOT NULL,
  TRANSACTIONAL     BIT
);


CREATE TABLE CLIENT_TYPE (
  CLIENT_TYPE_CODE VARCHAR(2)   NOT NULL PRIMARY KEY,
  DESCRIPTION      VARCHAR(255) NOT NULL
);

CREATE TABLE CLIENT_SUB_TYPE (
  CLIENT_SUB_TYPE_CODE VARCHAR(4)   NOT NULL PRIMARY KEY,
  CLIENT_TYPE_CODE     VARCHAR(2)   NOT NULL REFERENCES CLIENT_TYPE (CLIENT_TYPE_CODE),
  DESCRIPTION          VARCHAR(255) NOT NULL
);

CREATE TABLE CURRENCY (
  CURRENCY_CODE  VARCHAR(3)   NOT NULL PRIMARY KEY,
  DECIMAL_PLACES INTEGER(10)  NOT NULL,
  DESCRIPTION    VARCHAR(255) NOT NULL
);



CREATE TABLE CURRENCY_CONVERSION_RATE (
  CURRENCY_CODE        VARCHAR(3)     NOT NULL PRIMARY KEY REFERENCES CURRENCY (CURRENCY_CODE),
  CONVERSION_INDICATOR VARCHAR(1)     NOT NULL,
  RATE                 DECIMAL(18, 8) NOT NULL
);

CREATE TABLE DENOMINATION_TYPE (
  DENOMINATION_TYPE_CODE VARCHAR(1)   NOT NULL PRIMARY KEY,
  DESCRIPTION            VARCHAR(255) NOT NULL
);


CREATE TABLE DENOMINATION (
  DENOMINATION_ID        INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  VALUE                  DECIMAL(65,4) NOT NULL,
  DENOMINATION_TYPE_CODE VARCHAR(1) REFERENCES DENOMINATION_TYPE (DENOMINATION_TYPE_CODE)
);


CREATE TABLE CLIENT (
  CLIENT_ID            INTEGER(10) AUTO_INCREMENT PRIMARY KEY,
  TITLE                VARCHAR(10),
  NAME                 VARCHAR(255) NOT NULL,
  SURNAME              VARCHAR(100),
  DOB                  DATE         NOT NULL,
  CLIENT_SUB_TYPE_CODE VARCHAR(4)   NOT NULL REFERENCES CLIENT_SUB_TYPE (CLIENT_SUB_TYPE_CODE)
);


CREATE TABLE CLIENT_ACCOUNT (
  CLIENT_ACCOUNT_NUMBER BIGINT(10) AUTO_INCREMENT PRIMARY KEY,
  CLIENT_ID             INTEGER(10)     NOT NULL REFERENCES CLIENT (CLIENT_ID),
  ACCOUNT_TYPE_CODE     VARCHAR(10) NOT NULL REFERENCES ACCOUNT_TYPE (ACCOUNT_TYPE_CODE),
  CURRENCY_CODE         VARCHAR(3)  NOT NULL REFERENCES CURRENCY (CURRENCY_CODE),
  DISPLAY_BALANCE       NUMERIC(18, 3)
);


CREATE TABLE CREDIT_CARD_LIMIT (
  CREDIT_CARD_LIMIT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CLIENT_ACCOUNT_NUMBER BIGINT(10)    NOT NULL ,
  ACCOUNT_LIMIT         DECIMAL(18, 3) NOT NULL,
  FOREIGN KEY (CLIENT_ACCOUNT_NUMBER) REFERENCES CLIENT_ACCOUNT (CLIENT_ACCOUNT_NUMBER)
);

CREATE TABLE ATM (
  ATM_ID   INTEGER(10) AUTO_INCREMENT PRIMARY KEY,
  NAME     VARCHAR(10)  NOT NULL UNIQUE,
  LOCATION VARCHAR(255) NOT NULL
);

CREATE TABLE ATM_ALLOCATION (
  ATM_ALLOCATION_ID INTEGER(10) AUTO_INCREMENT PRIMARY KEY,
  ATM_ID            INTEGER(10) NOT NULL REFERENCES ATM (ATM_ID),
  DENOMINATION_ID   INTEGER(10) NOT NULL REFERENCES DENOMINATION (DENOMINATION_ID),
  COUNT             INTEGER(10) NOT NULL
);
