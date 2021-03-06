create or replace FUNCTION INSERT_RES (I_CUST_NAME VARCHAR, I_EMAIL VARCHAR, I_START_DATE DATE,
I_END_DATE DATE ,I_EVENT_TYPE VARCHAR,I_PPL_ATTEND NUMBER, I_HOTEL_ID NUMBER,I_EVENT_NAME VARCHAR,I_ROOM_TYPE VARCHAR) RETURN NUMBER AS 
    V_CUST_NAME VARCHAR(50);
    V_CUST_ID INT;
    V_RES_ID INT;
    I_ROOM_ID INT;
    I_ROOM_AVAILABILITY VARCHAR(1);
    V_HOTEL_ID NUMBER;
    V_CURR_DATE DATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE (' -- INSERT_RES STARTING --');
-- FIRST INSERT CUSTOMER INTO CUSTOMER TABLE

    BEGIN
        SELECT CUSTOMER_ID INTO V_CUST_ID FROM CUSTOMERS WHERE CUSTOMER_NAME = I_CUST_NAME AND EMAIL = I_EMAIL;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            INSERT INTO CUSTOMERS VALUES(CUST_SEQ.NEXTVAL,I_CUST_NAME,I_EMAIL);
            SELECT CUSTOMER_ID INTO V_CUST_ID FROM CUSTOMERS WHERE CUSTOMER_NAME = I_CUST_NAME AND EMAIL = I_EMAIL;
    END;


-- MAKE EVENT ENTRY INTO THE EVENTS TABLE. MAKE BOOKING
    BEGIN
        SELECT RESERVATION_ID INTO V_RES_ID FROM EVENTS 
        WHERE EVENT_STATUS='1' AND
            START_DATE=I_START_DATE AND
            END_DATE=I_END_DATE AND
            EVENT_TYPE =I_EVENT_TYPE AND
            PEOPLE_ATTENDING=I_PPL_ATTEND AND
            CUSTOMER_ID=V_CUST_ID AND 
            HOTEL_ID=I_HOTEL_ID AND
            EVENT_NAME=I_EVENT_NAME;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN

            INSERT INTO EVENTS VALUES(EVENTS_SEQ.NEXTVAL,I_START_DATE,I_END_DATE,I_EVENT_TYPE,I_PPL_ATTEND,'1',SYSDATE,V_CUST_ID,I_HOTEL_ID,I_EVENT_NAME);
            SELECT RESERVATION_ID INTO V_RES_ID FROM EVENTS 
            WHERE EVENT_STATUS='1' AND
                START_DATE=I_START_DATE AND
                END_DATE=I_END_DATE AND
                EVENT_TYPE =I_EVENT_TYPE AND
                PEOPLE_ATTENDING=I_PPL_ATTEND AND
                CUSTOMER_ID=V_CUST_ID AND 
                HOTEL_ID=I_HOTEL_ID AND
                EVENT_NAME=I_EVENT_NAME;
    END;

----MAKE THE ROOM RESERVATION INTO ROOMRESERVATION TABLE
V_CURR_DATE := I_START_DATE;

LOOP 
    SELECT ROOM_ID1 INTO I_ROOM_ID
    FROM (
    SELECT ER.ROOM_ID1, ER.ROOM_TYPE FROM EVENT_ROOM1 ER, HOTEL H
    WHERE H.HOTEL_ID = I_HOTEL_ID AND ER.HOTEL_ID = H.HOTEL_ID
    AND ER.ROOM_TYPE = I_ROOM_TYPE
    MINUS
    SELECT ROOM_ID, ROOM_TYPE FROM ROOMRESERVATION WHERE ROOM_DATE = V_CURR_DATE AND HOTEL_ID = I_HOTEL_ID
    AND ROOM_TYPE = I_ROOM_TYPE
    ORDER BY ROOM_ID1) S
    WHERE ROWNUM < 2;

    INSERT INTO ROOMRESERVATION VALUES(I_ROOM_ID,V_RES_ID,V_CURR_DATE,I_HOTEL_ID,'F',I_ROOM_TYPE);

    V_CURR_DATE := V_CURR_DATE + 1;
    EXIT WHEN V_CURR_DATE > I_END_DATE;
END LOOP;

RETURN V_RES_ID;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE('NO ROWS FOUND');
    RAISE;
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE('MANY ROWS FOUND');
    RAISE;    
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE('INSERT TO FAILED THE ROW IN THE TABLE');
    RAISE; 
END INSERT_RES;
