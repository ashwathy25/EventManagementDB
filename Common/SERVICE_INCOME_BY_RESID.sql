create or replace FUNCTION SERVICE_INCOME_BY_RESID (I_RESERVATION_ID IN
VARCHAR)
RETURN NUMBER AS
V_TOTAL_SERVICE_COST NUMBER;
V_RESERVATION_ID EVENTS.RESERVATION_ID%TYPE;
BEGIN
VALIDATE_RES_ID(I_RESERVATION_ID);

SELECT
SUM(CASE
WHEN S.SERVICE_APPLICABILITY = 'P'
THEN E.PEOPLE_ATTENDING * S.SERVICE_RATE
ELSE S.SERVICE_RATE
END) TOTAL_SERVICE_COST INTO V_TOTAL_SERVICE_COST
FROM
EVENTS E
INNER JOIN SERVICERESERVATION SR ON (E.RESERVATION_ID =
SR.RESERVATION_ID)
INNER JOIN SERVICE S ON (SR.SERVICE_TYPE = S.SERVICE_TYPE)
WHERE e.reservation_id = I_RESERVATION_ID
GROUP BY E.RESERVATION_ID;
DBMS_OUTPUT.PUT_LINE('-- SERVICE_INCOME_BY_RESID : RESERVATION_ID : ' ||
I_RESERVATION_ID || ' : TOTAL COST : ' || V_TOTAL_SERVICE_COST);
RETURN V_TOTAL_SERVICE_COST;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('-- SERVICE_INCOME_BY_RESID : NO SERVICE FOUND
FOR REGISTRATION : ' || I_RESERVATION_ID);
RETURN 0;
WHEN OTHERS THEN
RAISE;
END SERVICE_INCOME_BY_RESID;