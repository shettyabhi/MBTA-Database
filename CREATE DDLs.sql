--CREATE TABLE--
CREATE TABLE SERVICE
(   
    Category [varchar](25) NOT NULL,
    Service_Type [varchar](25) NOT NULL,
    Capacity [varchar](15) NULL
    CONSTRAINT [Category_PK] PRIMARY KEY (Category)
);

--CREATE TABLE--
CREATE TABLE FARE
(
    Category varchar(25) NOT NULL,
    Charlie_Card decimal(18, 0) NULL,
    Charlie_Ticket decimal(15, 0) NULL,
    Cash decimal(15, 0) NULL
    CONSTRAINT Category_FK3 FOREIGN KEY(Category)
    REFERENCES SERVICE (Category)	
);

--CREATE TABLE--
CREATE TABLE BUS
(
    VehicleID int NOT NULL,
    Category varchar(25) NOT NULL
    CONSTRAINT VehicleID_PK2 PRIMARY KEY (VehicleID)
    CONSTRAINT Category_FK6 FOREIGN KEY(Category)
    REFERENCES SERVICE (Category),
    CONSTRAINT CHK_BUS CHECK (LEN(VehicleID) = 5)
);

--CREATE TABLE--
CREATE TABLE SUBWAY
(
    VehicleID int NOT NULL,
    Category varchar(25) NOT NULL
    CONSTRAINT VehicleID_PK1 PRIMARY KEY (VehicleID) 
    CONSTRAINT Category_FK5 FOREIGN KEY(Category)
    REFERENCES SERVICE (Category),
    CONSTRAINT CHK_SUBWAY CHECK (LEN(VehicleID) = 4)
);

--CREATE TABLE--
CREATE TABLE COMMUTERRAIL
(
    VehicleID int NOT NULL,
    Category varchar(25) NOT NULL,
    Zone varchar(10) NOT NULL
    CONSTRAINT VehicleID_PK PRIMARY KEY (VehicleID) 
    CONSTRAINT Category_FK4 FOREIGN KEY(Category)
    REFERENCES SERVICE (Category),
    CONSTRAINT CHK_COMMUTERRAIL CHECK (LEN(VehicleID) = 3)
);

--CREATE TABLE--
CREATE TABLE SCHEDULE
(
    Category varchar(20) not null,
    RouteID varchar(20) not null,
    Start_Time time, 
    End_Time time,
    Frequency varchar(20),
CONSTRAINT Schedule_PK primary key (RouteID)
);

--CREATE TABLE--
CREATE TABLE [ROUTE]
(
    Category varchar(20) not null,
    RouteID varchar(20) not null,
    Origin varchar(20) not null,
    Destination  varchar(20),   
CONSTRAINT ROUTE_PK primary key (RouteID)
);

--CREATE TABLE--
CREATE TABLE STATION
(
    Category varchar(20) not null,
    RouteID varchar(20) not null,
    Station_Name varchar(20) not null,
    City varchar(20),
    Zip_Code int,
    Elevator_Service varchar(20),
CONSTRAINT STATION_PK primary key (RouteID)
);

--CREATE TABLE--
CREATE TABLE TRAVELPASS
(
    Pass_Type varchar(55) NOT NULL,
    Price decimal(6, 2) NOT NULL,
    Validity varchar(25) NULL,
    Services varchar(255) NULL
CONSTRAINT PassType_PK PRIMARY KEY (Pass_Type)
);

--CREATE VIEW--
CREATE VIEW FARECHART
AS
(
    SELECT C.SERVICE_TYPE, A.CATEGORY, B.ORIGIN, B.DESTINATION, 
    B.RouteID, A.CHARLIE_CARD, A.CHARLIE_TICKET, A.CASH 
    FROM FARE A JOIN ROUTE B ON A.CATEGORY = B.CATEGORY 
    JOIN SERVICE C ON B.CATEGORY = C.CATEGORY
)

--CREATE VIEW--
CREATE VIEW TIMECHART
AS
(
    SELECT C.SERVICE_TYPE, C.CATEGORY, A.ORIGIN, A.DESTINATION, 
    A.RouteID, B.START_TIME, B.END_TIME, B.FREQUENCY
    FROM ROUTE A JOIN SCHEDULE B ON A.CATEGORY = B.CATEGORY 
    JOIN SERVICE C ON B.CATEGORY = C.CATEGORY
)

--CREATE VIEW--
CREATE VIEW ALLSTATIONS
AS
(
    SELECT A. ROUTEID, A.ORIGIN, A.DESTINATION, B.STATION_NAME,
    B. CITY, B.ZIP_CODE, B.ELEVATOR_SERVICE
    FROM ROUTE A JOIN STATION B ON A.ROUTEID = B.ROUTEID
)

--CREATE INDEX--
CREATE NONCLUSTERED INDEX IX_SCHEDULE_FREQUENCY ON ROUTE(ROUTEID)
SET STATISTICS IO ON
SET STATISTICS TIME ON

--CREATE TRIGGER--
CREATE TRIGGER stationhistory ON STATION
FOR UPDATE
AS
BEGIN
INSERT INTO stationhistory
(RouteID, Station_Name, City, Zip_Code, Action, Action_Date)
SELECT RouteID, Station_Name, City, Zip_Code, 'U' AS ACTION, GETDATE() AS Action_Date
FROM deleted
END;

--CREATE STORED PROCEDURE--
CREATE PROCEDURE AllRoutes
@Origin VARCHAR(25)
AS
BEGIN
SELECT ROUTEID, ORIGIN, DESTINATION, Category
FROM AllRoutes
WHERE Origin = @Origin
END

--CREATE STORED PROCEDURE--
CREATE PROCEDURE StationDetails
@Station_Name VARCHAR(25),
@City VARCHAR(25),
@Elevator_Service VARCHAR(5)
AS
BEGIN
SELECT ROUTEID, Station_Name, City, Zip_Code, Elevator_Service
FROM STATION
WHERE Station_Name = @Station_Name
END

--CREATE STORED PROCEDURE--
CREATE PROCEDURE RoutetoStation
@RouteID VARCHAR(25)
AS
BEGIN
SELECT ROUTEID, Origin, Destination, Station_Name
FROM ALLSTATIONS
WHERE RouteID = @RouteID
END

--CREATE FUNCTION--
CREATE FUNCTION GETTOTALROUTES (@ROUTEID INT)
RETURNS INT
AS
BEGIN
DECLARE @TOTALROUTES INT
SELECT COUNT(DISTINCT ROUTEID) AS @TOTALROUTES FROM ROUTE R
WHERE R.ROUTEID = @ROUTEID)
RETURN  @TOTALROUTES
END;
	


CREATE TABLE SUB
(
    VehicleID int NOT NULL,
    Capacity int,
    CONSTRAINT CHK_SUB CHECK (LEN(VehicleID) = 5)
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);