/* Dung Luong
Lab11
*/

--3
CREATE TABLE members
(
    member_id   NUMBER          NOT NULL,
    first_name  VARCHAR2(50)    NOT NULL,
    last_name   VARCHAR2(50)    NOT NULL,
    address     VARCHAR2(100)   ,
    city        VARCHAR2(50)    NOT NULL,
    state       CHAR(2)         NOT NULL,
    phone       VARCHAR(15)     NOT NULL,
    CONSTRAINT members_pk
        PRIMARY KEY (member_id)
);

CREATE TABLE groups
(
    group_id    NUMBER          NOT NULL,
    group_name  VARCHAR2(100)   NOT NULL,
    CONSTRAINT groups_pk
        PRIMARY KEY (group_id)
);

CREATE TABLE members_groups
(
    member_id   NUMBER          NOT NULL,
    group_id    NUMBER          NOT NULL,
    CONSTRAINT members_groups_pk
        PRIMARY KEY (member_id, group_id),
    CONSTRAINT members_groups_fk_groups
        FOREIGN KEY (group_id) REFERENCES groups (group_id),
    CONSTRAINT members_groups_fk_members
        FOREIGN KEY (member_id) REFERENCES members (member_id)
);

INSERT INTO members
VALUES (1, 'John', 'Smith', '334 Valencia St.', 'San Francisco', 'CA', '415-942-1901');
INSERT INTO members
VALUES (2, 'Jane', 'Doe', '872 Chetwood St.', 'Oakland', 'CA', '510-123-4567');

INSERT INTO groups
VALUES (1, 'Book Club');
INSERT INTO groups
VALUES (2, 'Bicycle Coalition');

INSERT INTO members_groups
VALUES (1, 2);
INSERT INTO members_groups
VALUES (2, 1);
INSERT INTO members_groups
VALUES (2, 2);

--4
SELECT GROUP_NAME, LAST_NAME AS MEMBER_LAST_NAME , FIRST_NAME AS MEMBER_FIRST_NAME
FROM MEMBERS JOIN MEMBERS_GROUPS
    ON MEMBERS.MEMBER_ID = MEMBERS_GROUPS.MEMBER_ID
    JOIN GROUPS
    ON MEMBERS_GROUPS.GROUP_ID = GROUPS.GROUP_ID;
    
--5
CREATE SEQUENCE MEMBER_ID_SEQ
START WITH 3;

CREATE SEQUENCE GROUP_ID_SEQ
START WITH 3;

--6
INSERT INTO GROUPS
VALUES (GROUP_ID_SEQ.NEXTVAL, 'Football Club');

SELECT *
FROM GROUPS;

--7
ALTER TABLE MEMBERS
ADD(
    ANNUAL_DUES NUMBER(5,2) DEFAULT 52.50 NOT NULL,
    PAYMENT_DATE DATE
    );

--8
ALTER TABLE GROUPS
MODIFY(
        GROUP_NAME UNIQUE
        );






