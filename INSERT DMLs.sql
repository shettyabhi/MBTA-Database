INSERT INTO SERVICE VALUES
('Local', 'Bus', 55),
('Inner Express', 'Bus', 55),
('Outer Express', 'Bus', 55),
('Orange Line', 'Subway', 786),
('Blue Line', 'Subway', 570),
('Red Line', 'Subway', 1002),
('Green Line', 'Subway', 303),
('Mattapan Trolley', 'Subway', 130),
('Silver Line', 'Bus', 97),
('Cross Town', 'Bus', 97),
('Commuter Rail', 'Commuter Rail', '400 to 1400’);


INSERT INTO FARE VALUES
('Local', 1.70, 2.00, 2.00),
('Inner Express', 4.25, 5.25, 5.25),
('Outer Express', 5.25, 7.00, 7.00),
('Orange Line', 2.40, 2.90, 2.90),
('Blue Line', 2.40, 2.90, 2.90),
('Red Line', 2.40, 2.90, 2.90),
('Green Line', 2.40, 2.90, 2.90),
('Mattapan Trolley', 2.40, 2.90, 2.90),
('Silver Line', 4.25, 5.25, 5.25),
('Cross Town', 1.70, 2.00, 2.00),
('Commuter Rail', 10.00, 13.25, 13.25);


INSERT INTO BUS VALUES
(10001, (select Category from SERVICE where Category='Local'))
(10002, (select Category from SERVICE where Category='Inner Express')),
(10003, (select Category from SERVICE where Category='Outer Express')),
(10004, (select Category from SERVICE where Category='Silver Line')),
(10010, (select Category from SERVICE where Category='Cross Town')),
(10006, (select Category from SERVICE where Category='Local')),
(10007, (select Category from SERVICE where Category='Inner Express')),
(10008, (select Category from SERVICE where Category='Outer Express')),
(10009, (select Category from SERVICE where Category='Silver Line')),
(10010, (select Category from SERVICE where Category='Cross Town'))



INSERT INTO SUBWAY VALUES
(1001, (select Category from SERVICE where Category='Orange Line')),
(1002, (select Category from SERVICE where Category='Blue Line')),
(1003, (select Category from SERVICE where Category='Red Line')),
(1004, (select Category from SERVICE where Category='Green Line')),
(1005, (select Category from SERVICE where Category='Orange Line')),
(1006, (select Category from SERVICE where Category='Blue Line')),
(1007, (select Category from SERVICE where Category='Green Line')),
(1008, (select Category from SERVICE where Category='Red Line')),
(1009, (select Category from SERVICE where Category='Green Line')),
(1010, (select Category from SERVICE where Category='Orange Line'))



INSERT INTO COMMUTERRAIL VALUES
(101, (select Category from SERVICE where Category='Commuter Rail'),'1A'),
(102, (select Category from SERVICE where Category='Commuter Rail'),'1'),
(103, (select Category from SERVICE where Category='Commuter Rail'),'2'),
(104, (select Category from SERVICE where Category='Commuter Rail'),'3'),
(105, (select Category from SERVICE where Category='Commuter Rail'),'4'),
(106, (select Category from SERVICE where Category='Commuter Rail'),'5'),
(107, (select Category from SERVICE where Category='Commuter Rail'),'6'),
(108, (select Category from SERVICE where Category='Commuter Rail'),'7'),
(109, (select Category from SERVICE where Category='Commuter Rail'),'8'),
(110, (select Category from SERVICE where Category='Commuter Rail'),'9'),
(111, (select Category from SERVICE where Category='Commuter Rail'),'10')

Insert into SCHEDULE values
((select Category from SERVICE where Category='Orange Line'), '1','03:26:00', '01:10:00', '6 mins'),
((select Category from SERVICE where Category='Blue Line'),'2', '03:30:00', '01:10:00', '7 mins'),
((select Category from SERVICE where Category='Red Line'),'3', '03:35:00', '01:10:00', '6 mins'),
((select Category from SERVICE where Category='Green Line'),'4', '03:30:00', '01:00:00', '7 mins'),
((select Category from SERVICE where Category='Silver Line'),'5', '03:30:00', '01:00:00', '12 mins'),
((select Category from SERVICE where Category='Mattapan Trolley'),'6', '03:30:00', '01:00:00', '9 mins'),
((select Category from SERVICE where Category='Local'),'7', '03:30:00', '01:00:00', '20 mins'),
((select Category from SERVICE where Category='Inner Express'),'8', '03:30:00', '12:00:00', '30 mins'),
((select Category from SERVICE where Category='Outer Express'),'9', '03:30:00', '12:00:00', '30 mins'),
((select Category from SERVICE where Category='Cross Town'),'10', '03:30:00', '12:00:00', '10 mins');


Insert into ROUTE values
((select Category from SERVICE where Category='Orange Line'), '1','Malden Center', 'North Station', 'Inbound'),
((select Category from SERVICE where Category='Red Line'),'2','Downtown Crossing', 'Alewife', 'Outbound'),
((select Category from SERVICE where Category='Local'),'3','Malden Center','Sullivan Square', 'Inbound'),
((select Category from SERVICE where Category='Inner Express'),'4','Brighton Center','Copley Square', 'Inbound'),
((select Category from SERVICE where Category='Outer Express'),'5','Woburn','State Street, Boston', 'Inbound'),
((select Category from SERVICE where Category='Green Line'),'6','Lechmere','Heath Street', 'Inbound'),
((select Category from SERVICE where Category='Silver Line'),'7','South Station','Terminal A', 'Outbound'),
((select Category from SERVICE where Category='Blue Line'),'8','Wonderland','Chelsea', 'Outbound'),
((select Category from SERVICE where Category='Mattapan Trolley'),'9','Ashmont','Quincy', 'Outbound'),
((select Category from SERVICE where Category='Cross Town'),'10','Ruggles', 'Sullivan Square', ‘Outbound');

Insert into STATION values
((select Category from SERVICE where Category='Orange Line'), '1','Forest Hills', 'Boston', 02100, 'Yes'),
((select Category from SERVICE where Category='Red Line'),'2','Ashmont', 'Boston', 02120, 'Yes'),
((select Category from SERVICE where Category='Local'),'3','Harvard','Boston', 02121, 'No'),
((select Category from SERVICE where Category='Inner Express'),'4','Braintree','Boston', 02140, 'No'),
((select Category from SERVICE where Category='Outer Express'),'5','Lechmere','Boston', 02150, 'No'),
((select Category from SERVICE where Category='Green Line'),'6','Lechmere','Boston', 02130, 'Yes'),
((select Category from SERVICE where Category='Silver Line'),'7','Lechmere','Boston', 02110, 'No'),
((select Category from SERVICE where Category='Blue Line'),'8','Wonderland','Boston', 02180, 'Yes'),
((select Category from SERVICE where Category='Mattapan Trolley'),'9','Ashmont','Boston', 02125, 'No'),
((select Category from SERVICE where Category='Cross Town'),'10','Ruggles', 'Boston', 02128, 'Yes');


Insert into TRAVELPASS values
('1-Day Pass', 12.75,'24 hours', 'Subway, Local Bus, Silver Line'),
('7-Day Pass', 22.50,'7 days', 'Subway, Local Bus, Silver Line'),
('Monthly Link Pass', 90.00,'1 calendar month', 'Subway, Local Bus, Silver Line'),
('Monthly Local Bus Pass', 55.00,'1 calendar month', 'Local Bus, SL4, SL5'),
('Monthly Inner Express Bus Pass', 136.00,'1 calendar month', 'Subway, Local and Inner Express Bus, Silver Line'),
('Monthly Outer Express Bus Pass', 168.00,'1 calendar month', 'Subway, Local, Inner, and Outer Express Bus, Silver Line'),
('Monthly Commuter Rail Pass CharlieTicket', 90.00,'1 calendar month', 'Commuter Rail, up to designated pass zone, Subway, Bus, Silver Line, Charlestown Ferry, Hingham/Hull Ferry with Zone 6 passes and up, Zone 1A passes not valid on Express Bus, Interzone passes not valid on subway, Express Bus, and ferry'),
('Monthly Commuter Rail Pass mTicket', 80.00,'1 calendar month', 'Commuter Rail, up to designated pass zone')