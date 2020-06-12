
-- DROP TABLES
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE EVENTS CASCADE CONSTRAINTS;
DROP TABLE HOTEL CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;
DROP TABLE ROOMRESERVATION CASCADE CONSTRAINTS;
DROP TABLE EVENT_ROOM1 CASCADE CONSTRAINTS;
DROP TABLE SERVICE CASCADE CONSTRAINTS;
DROP TABLE SERVICERESERVATION CASCADE CONSTRAINTS;

--DROP SEQUENCE
DROP SEQUENCE CUST_SEQ;
DROP SEQUENCE EVENTS_SEQ;
DROP SEQUENCE HOTEL_SEQ;
DROP SEQUENCE EVE_ROO_SEQ;
DROP SEQUENCE SERVICERESERVATION_SEQ;

--CREATE SEQUENCE
CREATE SEQUENCE CUST_SEQ START WITH 5000;
CREATE SEQUENCE EVENTS_SEQ START WITH 1;
CREATE SEQUENCE HOTEL_SEQ START WITH 10000;
CREATE SEQUENCE EVE_ROO_SEQ START WITH 100;
CREATE SEQUENCE SERVICERESERVATION_SEQ START WITH 1000;

--CREATE TABLE
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50),
    EMAIL VARCHAR(80)
);

-- HOTEL
CREATE TABLE HOTEL(
    HOTEL_ID INTEGER PRIMARY KEY,
    HOTEL_NAME VARCHAR(50),
    HOTEL_PHONE VARCHAR(10),
    STREET_NAME VARCHAR(100),
    CITY_NAME VARCHAR(30),
    STATE_CODE VARCHAR(2),
    ZIP_CODE VARCHAR(5)
);

CREATE TABLE EVENTS (
    RESERVATION_ID INT PRIMARY KEY,
    START_DATE DATE,
    END_DATE DATE,
    EVENT_TYPE VARCHAR(20),
    PEOPLE_ATTENDING INT,
    EVENT_STATUS VARCHAR(1) CHECK (EVENT_STATUS IN ('0','1','2')),
    RESERVATION_DATE DATE,
    CUSTOMER_ID INT,
    HOTEL_ID INT,
    EVENT_NAME VARCHAR2(100),
    CONSTRAINT EVENTS_CUSTOMERS_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
    CONSTRAINT EVENTS_HOTEL_FK FOREIGN KEY(HOTEL_ID) REFERENCES HOTEL(HOTEL_ID)
    );

--ROOM
CREATE TABLE ROOM (
    ROOM_TYPE VARCHAR(20) PRIMARY KEY,
    ROOM_CAPACITY INTEGER,
    ROOM_PRICE NUMBER
);

--EVENT_ROOM1
CREATE TABLE EVENT_ROOM1(
    ROOM_ID1 INT PRIMARY KEY,
    ROOM_TYPE VARCHAR(20),
    HOTEL_ID,
    CONSTRAINT ER1_HOTEL_FK FOREIGN KEY(HOTEL_ID) REFERENCES HOTEL(HOTEL_ID),
    CONSTRAINT ER1_ROOM_FK FOREIGN KEY(ROOM_TYPE) REFERENCES ROOM(ROOM_TYPE)
);

CREATE TABLE ROOMRESERVATION (
    ROOM_ID INTEGER ,
    RESERVATION_ID INTEGER,
    ROOM_DATE DATE,
    HOTEL_ID INTEGER,
    ROOM_AVAILABILITY VARCHAR(1) CHECK (ROOM_AVAILABILITY IN ('T','F')),
    ROOM_TYPE VARCHAR(20),
    PRIMARY KEY(ROOM_ID,RESERVATION_ID,HOTEL_ID, ROOM_DATE),
    CONSTRAINT RR_EVENTS_FK FOREIGN KEY(RESERVATION_ID) REFERENCES EVENTS(RESERVATION_ID),
    CONSTRAINT RR_HOTEL_FK FOREIGN KEY(HOTEL_ID) REFERENCES HOTEL(HOTEL_ID),
    CONSTRAINT RR_ROOM_FK FOREIGN KEY(ROOM_TYPE) REFERENCES ROOM(ROOM_TYPE),
    CONSTRAINT RR_EVENT_ROOM1_FK FOREIGN KEY(ROOM_ID) REFERENCES EVENT_ROOM1(ROOM_ID1)
);

--SERVICE
CREATE TABLE SERVICE (
    SERVICE_TYPE VARCHAR(20) PRIMARY KEY,
    SERVICE_RATE INT,
    SERVICE_APPLICABILITY VARCHAR(1)CHECK(SERVICE_APPLICABILITY IN ('P','E'))
);

CREATE TABLE SERVICERESERVATION (
    SERVICE_ID INT PRIMARY KEY,
    RESERVATION_ID INT,
    SERVICE_DATE DATE,
    SERVICE_TYPE VARCHAR(20),
    CONSTRAINT SR_SERVICE_FK FOREIGN KEY (SERVICE_TYPE) REFERENCES SERVICE(SERVICE_TYPE),
    CONSTRAINT SR_EVENTS_FK FOREIGN KEY (RESERVATION_ID) REFERENCES EVENTS(RESERVATION_ID)
);  

INSERT INTO SERVICE VALUES('BREAKFAST',10,'P');
INSERT INTO SERVICE VALUES('LUNCH',20,'P');
INSERT INTO SERVICE VALUES('DJ',500,'E');
INSERT INTO SERVICE VALUES('SINGER',2000,'E');
INSERT INTO SERVICE VALUES('POP BAND',10000,'E');
COMMIT;

INSERT INTO ROOM VALUES('SMALL HALL',100,500);
INSERT INTO ROOM VALUES('MEDIUM HALL',250,1000);
INSERT INTO ROOM VALUES('LARGE HALL',500,2000);
COMMIT;