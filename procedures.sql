
/* PROCEDURES:

PROCEDURE_ONE: SHOW ALL EVENTS FOR A USER_ID FOR THE MONTH OF DECEMBER

PROCEDURE_TWO: SHOW ALL EVENTS FOR A USER_ID BETWEEN SELECTED DATES */


-- PROCEDURE_ONE

-- STEP 1: TABLE BEING USED FOR PROCEDURE ONE 
SELECT * FROM tb_event;


--STEP 2: THE QUERY (GET EVENTS BETWEEN TWO SPECIFIC DATES (a specific month) FOR A USER ID
SELECT EVE_NAME FROM TB_EVENT WHERE EVE_DATE_BEGIN BETWEEN '01-DEC-16' AND '31-DEC-16' AND USER_ID =503;

-- STEP 3: CREATE PROCEDURE ONE (Get all events for a user_id for a specific month)
create or replace
procedure PROCEDURE_ONE
(USERID in number)
AS
    begin
    -- PRINTING THE REQUIRED VALUES WITH THE HELP OF A CURSOR
    FOR v_rec IN (SELECT EVE_NAME FROM TB_EVENT WHERE EVE_DATE_BEGIN BETWEEN '01-DEC-16' AND '31-DEC-16' AND USER_ID = USERID) LOOP      
    dbms_output.put_line('EVENT =' || v_rec.EVE_NAME);
    END LOOP;
END PROCEDURE_ONE;

-- STEP 4: RUNNING THE PROCEDURE THROUGH ANONYMOUS BLOCK
BEGIN
  -- ANY USER_ID CAN BE ENTERED 
  PROCEDURE_ONE(502);
END;


-- PROCEDURE_TWO

-- STEP 1: TABLE BEING USED FOR PROCEDURE ONE 
SELECT * FROM tb_event;


--STEP 2: THE QUERY (GET EVENTS BETWEEN TWO SPECIFIC DATES FOR A USER ID
SELECT EVE_NAME FROM TB_EVENT WHERE EVE_DATE_BEGIN BETWEEN '01-DEC-16' AND '31-DEC-16' AND USER_ID =503;

-- STEP 3: CREATE PROCEDURE TWO (Get all events for a user_id between certain dates)
create or replace
procedure PROCEDURE_TWO
(USERID in number,
 DATEBEGIN IN DATE,
 DATEEND IN DATE)
AS
    begin
    -- PRINTING THE REQUIRED VALUES WITH THE HELP OF A CURSOR
    FOR v_rec IN (SELECT EVE_NAME FROM TB_EVENT WHERE EVE_DATE_BEGIN BETWEEN DATEBEGIN AND DATEEND AND USER_ID = USERID) LOOP      
    dbms_output.put_line('EVENT =' || v_rec.EVE_NAME);
    END LOOP;
END PROCEDURE_TWO;

-- STEP 4: RUNNING THE PROCEDURE THROUGH ANONYMOUS BLOCK
BEGIN
  -- ANY USER_ID, BEGIN AND END DATE CAN BE ENTERED 
  PROCEDURE_TWO(502, '01-DEC-16', '7-DEC-16' );
END;