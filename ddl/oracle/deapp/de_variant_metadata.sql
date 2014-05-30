--
-- Type: TABLE; Owner: DEAPP; Name: DE_VARIANT_METADATA
--
 CREATE TABLE "DEAPP"."DE_VARIANT_METADATA" 
  (	"DE_VARIANT_METADATA_ID" NUMBER(*,0) NOT NULL ENABLE, 
"DATASET_ID" VARCHAR2(50 BYTE), 
"KEY" VARCHAR2(255 BYTE), 
"VALUE" CLOB, 
 CONSTRAINT "DE_VARIANT_METADATA_PK" PRIMARY KEY ("DE_VARIANT_METADATA_ID")
 USING INDEX
 TABLESPACE "DEAPP"  ENABLE
  ) SEGMENT CREATION DEFERRED
 TABLESPACE "DEAPP" 
LOB ("VALUE") STORE AS BASICFILE (
 TABLESPACE "DEAPP" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
 NOCACHE LOGGING ) ;

--
-- Type: REF_CONSTRAINT; Owner: DEAPP; Name: VAR_MET_DATASET_ID
--
ALTER TABLE "DEAPP"."DE_VARIANT_METADATA" ADD CONSTRAINT "VAR_MET_DATASET_ID" FOREIGN KEY ("DATASET_ID")
 REFERENCES "DEAPP"."DE_VARIANT_DATASET" ("DATASET_ID") ENABLE;

--
-- Type: SEQUENCE; Owner: DEAPP; Name: DE_VARIANT_METADATA_SEQ
--
CREATE SEQUENCE  "DEAPP"."DE_VARIANT_METADATA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--
-- Type: TRIGGER; Owner: DEAPP; Name: TRG_DE_VARIANT_METADATA_ID
--
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_VARIANT_METADATA_ID" 
before insert on "DEAPP"."DE_VARIANT_METADATA"
for each row begin
       	if inserting then
               	if :NEW."DE_VARIANT_METADATA_ID" is null then
                       	select DE_VARIANT_METADATA_SEQ.nextval into :NEW."DE_VARIANT_METADATA_ID" from dual;
               	end if;
       	end if;
end;
/
ALTER TRIGGER "DEAPP"."TRG_DE_VARIANT_METADATA_ID" ENABLE;
 
