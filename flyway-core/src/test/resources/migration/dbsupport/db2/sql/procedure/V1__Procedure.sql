--
-- Copyright 2010-2016 Boxfuse GmbH
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--         http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

CREATE TABLE "HOURS_OF_OPRTN" (
  "HOURS_OF_OPRTN_ID"	BIGINT	NOT NULL	GENERATED BY DEFAULT
    AS IDENTITY (START WITH 1, INCREMENT BY 1, CACHE 20,
       NO MINVALUE, NO MAXVALUE, NO CYCLE, NO ORDER),
  "MACH_ID"	INTEGER,
  "START_TS"	TIMESTAMP,
  "END_TS"	TIMESTAMP,
  BEGIN	SMALLINT,
  "MACH_CO_ID"	INTEGER,
  "MOD_TS"	TIMESTAMP	NOT NULL	GENERATED BY DEFAULT FOR EACH ROW ON UPDATE AS ROW CHANGE TIMESTAMP,
  "CHG_IND"	CHARACTER(1)	NOT NULL	DEFAULT 'I'
  ) 
  ;

ALTER TABLE "HOURS_OF_OPRTN"
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

CREATE PROCEDURE SP_EQIP_HOURS_AGGRGT_DAY_VIS (
    IN "@MACH_CO_ID"	VARCHAR(15000),
    IN "@START_TIME"	TIMESTAMP,
    IN "@END_TIME"	TIMESTAMP,
    IN "@TIMEZONEOFFSET"	DECIMAL(4, 2) )
  SPECIFIC "SP_EQIP_HOURS_AGGRGT_DAY_VIS"
  DYNAMIC RESULT SETS 1
  LANGUAGE SQL
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  READS SQL DATA
  CALLED ON NULL INPUT
  INHERIT SPECIAL REGISTERS
  OLD SAVEPOINT LEVEL
BEGIN
DECLARE V_MINUTES INTEGER DEFAULT 0;
SET V_MINUTES = (SELECT MOD(5,1) * 60
			FROM SYSIBM.SYSDUMMY1);

RETURN; END;

