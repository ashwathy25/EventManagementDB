create or replace PROCEDURE ADD_EVENT_ROOM(HOTELID_GIVEN IN NUMBER, ROOMTYPE_GIVEN IN VARCHAR)
IS
BEGIN
INSERT INTO EVENT_ROOM1 VALUES(EVE_ROO_SEQ.NEXTVAL,ROOMTYPE_GIVEN,HOTELID_GIVEN);
DBMS_OUTPUT.PUT_LINE('EVENT ROOM ADDED SUCCESSFULLY!');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE('-- ADD EVENT ROOM - FAILED');
        RAISE;
END ADD_EVENT_ROOM;