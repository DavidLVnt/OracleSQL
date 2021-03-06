/* Dung Luong
Lab12z
*/

--1
CREATE SEQUENCE primary_key_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1 MAXVALUE 9999999;

--2
CREATE TABLE BOAT
(
    ID                   NUMBER          DEFAULT PRIMARY_KEY_SEQUENCE.nextval,      
    REGISTRATION_NUMBER  VARCHAR2(20)    NOT NULL,
    NAME                 VARCHAR2(30)    NOT NULL,    
    CONSTRAINT BOAT_PK
        PRIMARY KEY (ID),
    CONSTRAINT BOAT_REGISTRATION_NUMBER_UQ
        UNIQUE (REGISTRATION_NUMBER)
);   

CREATE TABLE CAPTAIN
(
    ID                   NUMBER          DEFAULT PRIMARY_KEY_SEQUENCE.nextval,
    FIRST_NAME           VARCHAR2(20)    NOT NULL,
    LAST_NAME            VARCHAR2(20)    NOT NULL,
    MOBILE_PHONE_NUMBER  NUMBER          NOT NULL,
     CONSTRAINT CAPTAIN_PK
        PRIMARY KEY (ID)
);

CREATE TABLE DESTINATION
(
    ID                   NUMBER          DEFAULT PRIMARY_KEY_SEQUENCE.nextval,
    NAME                 VARCHAR2(50)    NOT NULL,
    CONSTRAINT DESTINATION_PK
        PRIMARY KEY (ID)
);

CREATE TABLE TRIP
(
    ID                   NUMBER          DEFAULT PRIMARY_KEY_SEQUENCE.nextval,
    BOAT_ID              NUMBER,
    CAPTAIN_ID           NUMBER,
    DESTINATION_ID       NUMBER,
    NUMBER_OF_GUESTS     NUMBER          NOT NULL,
    CONSTRAINT TRIP_PK
        PRIMARY KEY (ID),
    CONSTRAINT TRIP_FK_BOAT
        FOREIGN KEY (BOAT_ID) REFERENCES BOAT (ID),
    CONSTRAINT TRIP_FK_CAPTAIN
        FOREIGN KEY (CAPTAIN_ID) REFERENCES CAPTAIN (ID),
    CONSTRAINT TRIP_FK_DESTINATION
        FOREIGN KEY (DESTINATION_ID) REFERENCES DESTINATION (ID)
);

--3
ALTER TABLE BOAT
ADD (
    CAPACITY                NUMBER       NOT NULL,
    REGISTRATION_EXP_DATE   DATE         NOT NULL
    );
    
ALTER TABLE CAPTAIN
RENAME COLUMN MOBILE_PHONE_NUMBER TO PHONE_NUMBER;

ALTER TABLE TRIP
ADD (
    NUMBER_OF_CREW          NUMBER       NOT NULL,
    START_DATE              DATE         NOT NULL,
    CONSTRAINT NUMBER_OF_CREW_CK CHECK (NUMBER_OF_CREW > 0)
    );

ALTER TABLE TRIP
RENAME TO TRIP_DETAILS;

--4
INSERT INTO BOAT
VALUES (DEFAULT, 'FL-12345', 'PRANCING SEA HORSE', 6, '31-DEC-19');
INSERT INTO BOAT
VALUES (DEFAULT, 'FL-54321', 'SLOW AND STADY', 11, '31-DEC-20');
INSERT INTO BOAT
VALUES (DEFAULT, 'FL-10101', 'EAT MY BUBBLES', 3, '31-DEC-21');

INSERT INTO CAPTAIN
VALUES (DEFAULT, 'Becka', 'Swifterson', 1112221234);
INSERT INTO CAPTAIN
VALUES (DEFAULT, 'Birdy', 'Bold', 2223331234);

INSERT INTO DESTINATION
VALUES (DEFAULT, 'FANCY KEY');
INSERT INTO DESTINATION
VALUES (DEFAULT, 'FUN CAY');

insert into trip_details (boat_id,captain_id,destination_id,number_of_guests,number_of_crew,start_date)
    select
        (select id from boat where name = 'EAT MY BUBBLES'),
        (select id from captain where first_name = 'Becka'),
        (select id from destination where name = 'FUN CAY'),
        2,
        1,
        sysdate+14
    from dual;
commit;

--5
SELECT D.NAME AS DESTINATION, START_DATE AS TRIP_LEAVES_ON, B.NAME AS ON_BOAT, FIRST_NAME ||' ' || LAST_NAME AS WITH_CAPTAIN, CAPACITY AS MAX_NUMBER_OF_GUESTS
FROM TRIP_DETAILS T JOIN BOAT B
    ON T.BOAT_ID = B.ID
    JOIN CAPTAIN C
    ON T.CAPTAIN_ID = C.ID
    JOIN DESTINATION D
    ON T.DESTINATION_ID = D.ID;
    
CREATE OR REPLACE VIEW v_available_trips AS
    SELECT D.NAME AS DESTINATION, START_DATE AS TRIP_LEAVES_ON, B.NAME AS ON_BOAT, FIRST_NAME ||' ' || LAST_NAME AS WITH_CAPTAIN, CAPACITY AS MAX_NUMBER_OF_GUESTS
    FROM TRIP_DETAILS T JOIN BOAT B
    ON T.BOAT_ID = B.ID
    JOIN CAPTAIN C
    ON T.CAPTAIN_ID = C.ID
    JOIN DESTINATION D
    ON T.DESTINATION_ID = D.ID;
    
--6
SELECT NAME
FROM BOAT
    WHERE NAME NOT IN 
                    (SELECT ON_BOAT
                    FROM V_AVAILABLE_TRIPS);
                    
SELECT FIRST_NAME || ' ' || LAST_NAME
FROM CAPTAIN
    WHERE FIRST_NAME || ' ' || LAST_NAME NOT IN 
                    (SELECT WITH_CAPTAIN
                    FROM V_AVAILABLE_TRIPS);
                    
--7
CREATE INDEX FK_BOAT_ID_IX
ON TRIP_DETAILS (BOAT_ID);

--8
GRANT SELECT ON V_AVAILABLE_TRIPS TO PUBLIC;

--9
CREATE PUBLIC SYNONYM V_AVAILABLE_TRIPS FOR VIEWS.V_AVAILABLE_TRIPS;

    
    