--ADD A HOTEL IN FAIRBANKS,ALASKA
EXEC ADD_A_NEW_HOTEL('H0 ','1238145312','MOOSE CREEK','FAIRBANKS','AK','99705');

--FIND HOTEL ID
EXEC FIND_HOTEL_ID('MOOSE CREEK','FAIRBANKS','AK','99705');

--ADD 2 SMALL,MEDIUM AND LARGE ROOMS TO THE ABOVE HOTEL
EXEC ADD_EVENT_ROOM(10000,'SMALL HALL'); 
EXEC ADD_EVENT_ROOM(10000,'SMALL HALL'); 
EXEC ADD_EVENT_ROOM(10000,'MEDIUM HALL'); 
EXEC ADD_EVENT_ROOM(10000,'MEDIUM HALL'); 
EXEC ADD_EVENT_ROOM(10000,'LARGE HALL'); 
EXEC ADD_EVENT_ROOM(10000,'LARGE HALL'); 

--ADD A NEW HOTEL IN HONOLULU, HAWAII
EXEC ADD_A_NEW_HOTEL('H1','1238145415','LEWERS ST','HONOLULU','HI','96830');

--FIND HOTEL ID
EXEC FIND_HOTEL_ID('LEWERS ST','HONOLULU','HI','96830');

--ADD 5 LARGE HALLS TO ABOVE HOTEL
EXEC ADD_EVENT_ROOM(10001,'LARGE HALL'); 
EXEC ADD_EVENT_ROOM(10001,'LARGE HALL'); 
EXEC ADD_EVENT_ROOM(10001,'LARGE HALL'); 
EXEC ADD_EVENT_ROOM(10001,'LARGE HALL'); 
EXEC ADD_EVENT_ROOM(10001,'LARGE HALL'); 

--ADD A NEW HOTEL IN BALTIMORE,MD
EXEC ADD_A_NEW_HOTEL('H2','1231145415','LONGWOOD RD','BALTIMORE','MD','21210');

--FIND HOTEL ID
EXEC FIND_HOTEL_ID('LONGWOOD RD','BALTIMORE','MD','21210');

--ADD EVENT ROOM
--ADD 1 SMALL, 1 MEDIUM AND 1 LARGE HALL
EXEC ADD_EVENT_ROOM(10002,'SMALL HALL'); 
EXEC ADD_EVENT_ROOM(10002,'MEDIUM HALL'); 
EXEC ADD_EVENT_ROOM(10002,'LARGE HALL');


--ADD A NEW HOTEL IN ANNAPOLIS,MD
EXEC ADD_A_NEW_HOTEL('H3','1231475419','ARUNDEL COUNTY','ANNAPOLIS','MD','21403');
--FIND HOTEL ID
EXEC FIND_HOTEL_ID('ARUNDEL COUNTY','ANNAPOLIS','MD','21403');
--ADD EVENT ROOM
--ADD 5 SMALL,MEDIUM AND LARGE HALLS
EXEC ADD_EVENT_ROOM(10003,'SMALL HALL');
EXEC ADD_EVENT_ROOM(10003,'SMALL HALL');
EXEC ADD_EVENT_ROOM(10003,'SMALL HALL');
EXEC ADD_EVENT_ROOM(10003,'SMALL HALL');
EXEC ADD_EVENT_ROOM(10003,'SMALL HALL');

EXEC ADD_EVENT_ROOM(10003,'MEDIUM HALL');
EXEC ADD_EVENT_ROOM(10003,'MEDIUM HALL');
EXEC ADD_EVENT_ROOM(10003,'MEDIUM HALL');
EXEC ADD_EVENT_ROOM(10003,'MEDIUM HALL');
EXEC ADD_EVENT_ROOM(10003,'MEDIUM HALL');

EXEC ADD_EVENT_ROOM(10003,'LARGE HALL');
EXEC ADD_EVENT_ROOM(10003,'LARGE HALL');
EXEC ADD_EVENT_ROOM(10003,'LARGE HALL');
EXEC ADD_EVENT_ROOM(10003,'LARGE HALL');
EXEC ADD_EVENT_ROOM(10003,'LARGE HALL');


--FIND HOTELS IN MD
EXEC REPORT_HOTEL_N_ROOM_STATE('MD');


--DISPLAY HOTEL INFORMATION FOR HOTEL IN FAIRBANKS
EXEC FIND_HOTEL_ID('MOOSE CREEK','FAIRBANKS','AK','99705');
EXEC DISPLAY_HOTEL_INFO(10000);

--DISPLAY HOTEL INFORMATION OF HOTEL_ID 55(WHICH DOES NOT EXIST)
EXEC DISPLAY_HOTEL_INFO(55);


--REPORT EVENT ROOMS AND HOTELS IN MD
EXEC REPORT_HOTEL_N_ROOM_STATE('MD');

--SHOW AVAILABLE ROOMS BY TYPE
EXEC SHOW_ROOM(10000);

-- Mrs. Brown makes a reservation at hotel H2 for a wedding for June 7. 100 people are attending.
EXEC MAKE_EVENT_RESERVATION('LONGWOOD RD','BALTIMORE','MD','21210','MR BROWN','BROWN@GMAIL.COM',DATE'2019-06-07',DATE'2019-06-07','WEDDING',100,'BROWNS WEDDING');

-- Mr. Zero makes a reservation at hotel H0 for a Birthday for July 9. 10 people are attending
EXEC MAKE_EVENT_RESERVATION('MOOSE CREEK','FAIRBANKS','AK','99705', 'MR ZERO', 'ZERO@GMAIL.COM', '09-JUL-19', '09-JUL-19', 'BIRTHDAY', 10, 'ZERO''S BIRTHDAY');

-- Mr. Zero makes a reservation at hotel H1 for a Birthday for August 9. 50 people are attending.
EXEC MAKE_EVENT_RESERVATION('LEWERS ST','HONOLULU','HI','96830', 'MR ZERO', 'ZERO@GMAIL.COM', '09-AUG-19', '09-AUG-19', 'BIRTHDAY', 50, 'ZERO''S SON''S BIRTHDAY');

-- Mrs. Brown makes a reservation at hotel H3 for a Conference for October 10-13. 1000 people are attending. -- FAILS
EXEC MAKE_EVENT_RESERVATION('ARUNDEL COUNTY','ANNAPOLIS','MD','21403', 'MR BROWN', 'BROWN@GMAIL.COM', '10-OCT-19', '13-OCT-19', 'CONFERENCE', 1000, 'TECH CONFERENCE');

-- Mr. Cyber makes a reservation at hotel H2 for a Hackathon for November 1. 100 people are attending
EXEC MAKE_EVENT_RESERVATION('LONGWOOD RD','BALTIMORE','MD','21210', 'MR CYBER', 'CYBER@GMAIL.COM', '01-NOV-19', '01-NOV-19', 'HACKATHON', 100, 'DATASCIENCE');

-- Show events reserved by Mr. Zero
EXEC SHOW_EVENTS_BYCUSTNAME('MR ZERO');

-- Show events reserved by Mr. Brown
EXEC SHOW_EVENTS_BYCUSTNAME ('MR BROWN');

-- Cancel Mr. Zero’s reservation at H0.
EXEC CANCEL_EVENT('MR ZERO','MOOSE CREEK','FAIRBANKS','AK','99705','09-JUL-19', '09-JUL-19');

-- Show events reserved by Mr. Zero
EXEC SHOW_EVENTS_BYCUSTNAME('MR ZERO');

--SHOW CANCELLATIONS
EXEC SHOW_CANCELATION();

--Produce total monthly income report
EXEC MONTHLY_INC_REPORT();

-- Change event Date of the Hackathon from Nov 1, to Dec 20.
EXEC DISPLAYSPECIFICEVENT('HACKATHON');
EXEC Change_Reservation_Date('LONGWOOD RD','BALTIMORE','MD','21210','20-DEC-19','20-DEC-19','MR CYBER','HACKATHON');

-- Produce total monthly income report (again)
EXEC MONTHLY_INC_REPORT();

-- Change room type of Hackathon to a large room
EXEC DISPLAYSPECIFICEVENT('HACKATHON');
EXEC CHANGE_ROOMTYP_BY_RESID('MR CYBER','LONGWOOD RD','BALTIMORE','MD','21210','20-DEC-19','20-DEC-19','LARGE HALL');

-- Add breakfast for all attendees of the Conference
EXEC DISPLAYSPECIFICEVENT('CONFERENCE');
EXEC ADD_SERVICE_TO_EVENT('MR BROWN','ARUNDEL COUNTY','ANNAPOLIS','MD','21403','10-OCT-19', '13-OCT-19','BREAKFAST','10-OCT-19');
EXEC ADD_SERVICE_TO_EVENT('MR BROWN','ARUNDEL COUNTY','ANNAPOLIS','MD','21403','10-OCT-19', '13-OCT-19','BREAKFAST','11-OCT-19');
EXEC ADD_SERVICE_TO_EVENT('MR BROWN','ARUNDEL COUNTY','ANNAPOLIS','MD','21403','10-OCT-19', '13-OCT-19','BREAKFAST','12-OCT-19');
EXEC ADD_SERVICE_TO_EVENT('MR BROWN','ARUNDEL COUNTY','ANNAPOLIS','MD','21403','10-OCT-19', '13-OCT-19','BREAKFAST','13-OCT-19');

-- Show reservation services report for the Conference event
EXEC DISPLAYSPECIFICEVENT('CONFERENCE');
EXEC RESERVATION_SERVICES_REPORT('MR BROWN','ARUNDEL COUNTY','ANNAPOLIS','MD','21403','10-OCT-19', '13-OCT-19');

-- Add a DJ to all birthday events (you may need to make multiple calls)
EXEC DISPLAYSPECIFICEVENT('BIRTHDAY');
EXEC ADD_SERVICE_TO_EVENT('MR ZERO','MOOSE CREEK','FAIRBANKS','AK','99705','9-JUL-19', '9-JUL-19','DJ','9-JUL-19');
EXEC ADD_SERVICE_TO_EVENT('MR ZERO','LEWERS ST','HONOLULU','HI','96830','09-AUG-19', '09-AUG-19','DJ','09-AUG-19');

-- Add a pop band to the wedding
EXEC DISPLAYSPECIFICEVENT('WEDDING');
EXEC ADD_SERVICE_TO_EVENT('MR BROWN','LONGWOOD RD','BALTIMORE','MD','21210','07-JUN-19', '07-JUN-19','POP BAND','07-JUN-19');

--Show Specific service report for DJ
EXEC SHOW_SPECIFIC_SERVICE_REPORT('DJ');

--Show services income report
EXEC SERVICES_INCOME_REPORT('LONGWOOD RD','BALTIMORE','MD','21210');

-- Show available halls at each hotel (multiple calls)
DECLARE
V_HOTEL_ID HOTEL.HOTEL_ID%TYPE;
BEGIN
V_HOTEL_ID := FIND_A_HOTEL('LONGWOOD RD','BALTIMORE','MD','21210');
SHOW_ROOM(V_HOTEL_ID);
END;

DECLARE
V_HOTEL_ID HOTEL.HOTEL_ID%TYPE;
BEGIN
V_HOTEL_ID := FIND_A_HOTEL('MOOSE CREEK','FAIRBANKS','AK','99705');
SHOW_ROOM(V_HOTEL_ID);
END;

DECLARE
V_HOTEL_ID HOTEL.HOTEL_ID%TYPE;
BEGIN
V_HOTEL_ID := FIND_A_HOTEL('LEWERS ST','HONOLULU','HI','96830');
SHOW_ROOM(V_HOTEL_ID);
END;

DECLARE
V_HOTEL_ID HOTEL.HOTEL_ID%TYPE;
BEGIN
V_HOTEL_ID := FIND_A_HOTEL('ARUNDEL COUNTY','ANNAPOLIS','MD','21403');
SHOW_ROOM(V_HOTEL_ID);
END;

-- Provide event invoice for Mrs. Brown
EXEC EVENT_INVOICE('MR BROWN','ARUNDEL COUNTY','ANNAPOLIS','MD','21403','10-OCT-19', '13-OCT-19');
EXEC EVENT_INVOICE('MR BROWN','LONGWOOD RD','BALTIMORE','MD','21210','7-JUN-19','7-JUN-19');

-- Provide event invoice for Mr. Zero
EXEC EVENT_INVOICE('MR ZERO','MOOSE CREEK','FAIRBANKS','AK','99705','09-JUL-19', '09-JUL-19');
EXEC EVENT_INVOICE('MR ZERO','LEWERS ST','HONOLULU','HI','96830','09-AUG-19', '09-AUG-19');

--Income for AK, MD (two calls)
EXEC INCOME_BY_STATE_REPORT('AK');
EXEC INCOME_BY_STATE_REPORT('MD');