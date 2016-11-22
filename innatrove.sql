CREATE TABLE GROUP_TBL
(
  GROUP_ID int(11) NOT NULL,
  GROUP_TYPE varchar(40),
  GPNAME varchar(40) DEFAULT NULL,
  PRIMARY KEY (GROUP_ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE VOCAB_TBL
(
  VOCAB_ID int(11) NOT NULL,
  VOCAB_TERM varchar(60) NOT NULL,
  PRIMARY KEY (VOCAB_ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE PMN_TBL
(
  PMSN varchar(40) DEFAULT NULL,
  DESCR varchar(500) DEFAULT NULL,
  PRIMARY KEY (PMSN)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE ADULT_TBL
(
  ADLT_ID int(11) NOT NULL,
  ADNAME varchar(40) NOT NULL,
  GROUP_ID int(11) NOT NULL,
  ADLT_PSWD varchar(128) NOT NULL,
  ADLT_PMN varchar(100) DEFAULT NULL,
  PRIMARY KEY (ADLT_ID),
  FOREIGN KEY (GROUP_ID) REFERENCES GROUP_TBL(GROUP_ID),
  FOREIGN KEY (ADLT_PMN) REFERENCES PMN_TBL(PMSN)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE STUDENT_TBL
(
  STDNT_ID varchar(40) NOT NULL,
  ADULT_ID int(11),
  SDNT_PMN varchar(100) DEFAULT NULL,
  FNAME varchar(40) NOT NULL,
  LNAME varchar(40) NOT NULL,
  AGE varchar(40) NOT NULL,
  SCHOOL varchar(40) NOT NULL,
  GRADE varchar(40) NOT NULL,
  READLVL varchar(40) NOT NULL,
  READFREQ varchar(40) NOT NULL,
  READPURP varchar(40) NOT NULL,
  READENJ varchar(40) NOT NULL,
  PRIMARY KEY (STDNT_ID),  
  FOREIGN KEY (ADULT_ID) REFERENCES ADULT_TBL(ADLT_ID),
  FOREIGN KEY (SDNT_PMN) REFERENCES PMN_TBL(PMSN)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE CORE_STND_TBL
(
  STND_ID int(11) NOT NULL,
  STND_DSCR varchar(500) NOT NULL,
  PRIMARY KEY (STND_ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE BOOK_TBL
(
  BK_TITLE varchar(256) NOT NULL,
  CHPTRS int (11) NOT NULL,
  PAGES int(4) NOT NULL,
  BOOK_ID int(11) NOT NULL,
  UPLOADER_ID int(11) NOT NULL,
  GROUP_ID int(11) NOT NULL,
  BK_FMT varchar(5) NOT NULL,
  GRADE_LVL int(1) DEFAULT NULL,
  LANG varchar(40) NOT NULL,
  VOCAB_ID int(11) NOT NULL,
  STND_ID int(11) NOT NULL,
  PRIMARY KEY (BOOK_ID),
  FOREIGN KEY (VOCAB_ID) REFERENCES VOCAB_TBL(VOCAB_ID),
  FOREIGN KEY (STND_ID) REFERENCES CORE_STND_TBL(STND_ID),
  FOREIGN KEY (GROUP_ID) REFERENCES GROUP_TBL(GROUP_ID),
  FOREIGN KEY (UPLOADER_ID) REFERENCES ADULT_TBL(ADLT_ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE NOTES_TBL
(
  GROUP_ID int(11) NOT NULL,
  NOTE_ID int(11) NOT NULL,
  NOTE_TXT varchar(1000) NOT NULL,
  NOTE_TYPE varchar(64) NOT NULL,
  PAGE_NUM int(4) DEFAULT NULL,
  BOOK_ID int(11) NOT NULL,
  LANG varchar(40) NOT NULL,  
  PRIMARY KEY (NOTE_ID),
  FOREIGN KEY (GROUP_ID) REFERENCES GROUP_TBL(GROUP_ID),
  FOREIGN KEY (BOOK_ID) REFERENCES BOOK_TBL(BOOK_ID) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE QUIZ_TBL
(
  GROUP_ID int(11) NOT NULL,
  QUIZ_ID int(11) NOT NULL,
  QUIZ_TXT varchar(1000) NOT NULL,
  QUIZ_TYPE varchar(40) NOT NULL,
  BOOK_ID int(11) NOT NULL,
  QUIZ_FMT varchar(5) DEFAULT NULL,
  STND_ID int(11) NOT NULL,
  PRIMARY KEY (QUIZ_ID),
  FOREIGN KEY (BOOK_ID) REFERENCES BOOK_TBL(BOOK_ID),
  FOREIGN KEY (GROUP_ID) REFERENCES GROUP_TBL(GROUP_ID),
  FOREIGN KEY (STND_ID) REFERENCES CORE_STND_TBL(STND_ID)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;