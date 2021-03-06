create or replace PROCEDURE VALIDATE_RES_ID(I_RESERVATION_ID IN EVENTS.RESERVATION_ID%TYPE) AS

V_RESERVATION_ID EVENTS.RESERVATION_ID%TYPE;

BEGIN

    IF I_RESERVATION_ID IS NULL
    THEN
        RAISE_APPLICATION_ERROR(-20015, 'INVALID RESERVATION ID : CANNOT BE NULL');
    END IF;

    BEGIN
        SELECT RESERVATION_ID INTO V_RESERVATION_ID
        FROM EVENTS
        WHERE RESERVATION_ID = I_RESERVATION_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20015, 'INVALID RESERVATION ID : RESERVATION_ID [' || I_RESERVATION_ID 
                                            || '] NOT FOUND IN EVENTS TABLE');
    END;

EXCEPTION
    WHEN OTHERS THEN
        RAISE;

END VALIDATE_RES_ID;

