--
-- Type: TABLE; Owner: I2B2DEMODATA; Name: QT_QUERY_RESULT_INSTANCE
--
 CREATE TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" 
  (	"RESULT_INSTANCE_ID" NUMBER(5,0) NOT NULL ENABLE, 
"QUERY_INSTANCE_ID" NUMBER(5,0), 
"RESULT_TYPE_ID" NUMBER(3,0) NOT NULL ENABLE, 
"SET_SIZE" NUMBER(10,0), 
"START_DATE" DATE NOT NULL ENABLE, 
"END_DATE" DATE, 
"STATUS_TYPE_ID" NUMBER(3,0) NOT NULL ENABLE, 
"DELETE_FLAG" VARCHAR2(3 BYTE), 
"MESSAGE" CLOB, 
"DESCRIPTION" VARCHAR2(200 BYTE), 
"REAL_SET_SIZE" NUMBER(10,0), 
"OBFUSC_METHOD" VARCHAR2(500 BYTE), 
 CONSTRAINT "QT_QUERY_RESULT_INSTANCE_PKEY" PRIMARY KEY ("RESULT_INSTANCE_ID")
 USING INDEX
 TABLESPACE "I2B2_DATA"  ENABLE
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "I2B2_DATA" 
LOB ("MESSAGE") STORE AS BASICFILE (
 TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
 NOCACHE LOGGING ) ;

--
-- Type: SEQUENCE; Owner: I2B2DEMODATA; Name: QT_SQ_QRI_QRIID
--
CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QRI_QRIID"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 28694 CACHE 20 NOORDER  NOCYCLE ;

--
-- Type: TRIGGER; Owner: I2B2DEMODATA; Name: TRG_QT_QRI_RI_ID
--
  CREATE OR REPLACE TRIGGER "I2B2DEMODATA"."TRG_QT_QRI_RI_ID" 
   before insert on "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" 
   for each row 
begin  
   if inserting then 
      if :NEW."RESULT_INSTANCE_ID" is null then 
         select QT_SQ_QRI_QRIID.nextval into :NEW."RESULT_INSTANCE_ID" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "I2B2DEMODATA"."TRG_QT_QRI_RI_ID" ENABLE;
 
--
-- Type: REF_CONSTRAINT; Owner: I2B2DEMODATA; Name: QT_FK_QRI_RTID
--
ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ADD CONSTRAINT "QT_FK_QRI_RTID" FOREIGN KEY ("RESULT_TYPE_ID")
 REFERENCES "I2B2DEMODATA"."QT_QUERY_RESULT_TYPE" ("RESULT_TYPE_ID") ENABLE;

--
-- Type: REF_CONSTRAINT; Owner: I2B2DEMODATA; Name: QT_FK_QRI_STID
--
ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ADD CONSTRAINT "QT_FK_QRI_STID" FOREIGN KEY ("STATUS_TYPE_ID")
 REFERENCES "I2B2DEMODATA"."QT_QUERY_STATUS_TYPE" ("STATUS_TYPE_ID") ENABLE;

--
-- Type: REF_CONSTRAINT; Owner: I2B2DEMODATA; Name: QT_FK_QRI_RID
--
ALTER TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" ADD CONSTRAINT "QT_FK_QRI_RID" FOREIGN KEY ("QUERY_INSTANCE_ID")
 REFERENCES "I2B2DEMODATA"."QT_QUERY_INSTANCE" ("QUERY_INSTANCE_ID") ENABLE;

