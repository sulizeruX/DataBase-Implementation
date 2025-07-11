CREATE TABLE DEPT(
  DUNM int PRIMARY KEY,
  HIRDATE date,
  DN varchar,
  SSN int
);

CREATE TABLE LOC(
  LOC varchar,
  DUNM int FOREIGN KEY REFERENCES DEPT(DUNM),
  PRIMARY Key (LOC, DUNM)
);

CREATE TABLE EMP(
  SSN int PRIMARY KEY,
  Fname varchar,
  Lname varchar,
  gender bit DEFAULT 0,
  BD date,
  DUNM int FOREIGN KEY REFERENCES DEPT(DUNM),
  Super_id int FOREIGN KEY REFERENCES EMP(SSN)
);

CREATE TABLE PROJECT(
  PNUM int PRIMARY KEY,
  PN varchar,
  LOC varchar,
  CITY varchar,
  DUNM int Foreign Key REFERENCES DEPT(DUNM)
);

CREATE TABLE WORK(
  SSN int FOREIGN Key REFERENCES EMP(SSN),
  PNUM int FOREIGN KEY REFERENCES PROJECT(PNUM),
  hours int,
  PRIMARY KEY (SSN, PNUM, hours)
);

CREATE TABLE dependant(
  dnum int PRIMARY KEY,
  BD date,
  GENDER bit,
  ssn int FOREIGN Key REFERENCES EMP(SSN)
);

ALTER TABLE DEPT
ADD FOREIGN key (SSN) REFERENCES EMP(SSN);