CREATE DATABASE registered_vehicle;
USE registered_vehicle;

-- Creating Person table
CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    DrivingLicenseNumber VARCHAR(255),
    Address VARCHAR(255),
    ContactNumber VARCHAR(255)
);

-- Creating License table
CREATE TABLE License (
    LicenseNumber VARCHAR(255) PRIMARY KEY,
    LicenseType VARCHAR(255),
    IssueDate DATE,
    ExpiryDate DATE
);
-- Creating Vehicle table
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    VIN VARCHAR(255),
    Make VARCHAR(255),
    Model VARCHAR(255),
    Color VARCHAR(255),
    Year INT
);

-- Creating Ownership table
CREATE TABLE Ownership (
    OwnershipID INT PRIMARY KEY,
    PersonID INT,
    VehicleID INT,
    PurchaseDate DATE,
    SaleDate DATE,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Creating Registration table
CREATE TABLE Registration (
    RegistrationID INT PRIMARY KEY,
    RegistrationDate DATE,
    ExpiryDate DATE,
    RegistrationFee FLOAT
);

-- Creating VehicleRegistration table
CREATE TABLE VehicleRegistration (
    VehicleID INT,
    RegistrationID INT,
    Active BOOLEAN,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (RegistrationID) REFERENCES Registration(RegistrationID),
    PRIMARY KEY (VehicleID, RegistrationID)
);


-- Creating InsurancePolicy table
CREATE TABLE InsurancePolicy (
    InsuranceID INT PRIMARY KEY,
    Provider VARCHAR(255),
    PolicyNumber VARCHAR(255),
    IssueDate DATE,
    ExpiryDate DATE
);

-- Creating VehicleInsurance table
CREATE TABLE VehicleInsurance (
    VehicleID INT,
    InsuranceID INT,
    Active BOOLEAN,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (InsuranceID) REFERENCES InsurancePolicy(InsuranceID),
    PRIMARY KEY (VehicleID, InsuranceID)
);

-- Creating Accident table
CREATE TABLE Accident (
    AccidentID INT PRIMARY KEY,
    DateOfAccident DATE,
    Description VARCHAR(255),
    DamageEstimate FLOAT
);

-- Creating AccidentVehicle table
CREATE TABLE AccidentVehicle (
    AccidentID INT,
    VehicleID INT,
    FOREIGN KEY (AccidentID) REFERENCES Accident(AccidentID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    PRIMARY KEY (AccidentID, VehicleID)
);

-- Creating AccidentPerson table
CREATE TABLE AccidentPerson (
    AccidentID INT,
    PersonID INT,
    FOREIGN KEY (AccidentID) REFERENCES Accident(AccidentID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    PRIMARY KEY (AccidentID, PersonID)
);

-- Creating PersonLicense table
CREATE TABLE PersonLicense (
    PersonID INT,
    LicenseNumber VARCHAR(255),
    Active BOOLEAN,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (LicenseNumber) REFERENCES License(LicenseNumber),
    PRIMARY KEY (PersonID, LicenseNumber)
);

-- Data Insertion in Person Table
INSERT INTO person (PersonID, FirstName, LastName, DateOfBirth, DrivingLicenseNumber, Address, ContactNumber) VALUES 
(1, 'John', 'Taylor', '1962-04-08', 'DL60091869', '6000 Johnson St, New York, USA', '787-7513'),
(2, 'Jane', 'Wilson', '1971-03-08', 'DL32282877', '8673 Williams St, New York, USA', '805-7059'),
(3, 'William', 'Smith', '1971-04-13', 'DL84627019', '695 Williams St, New York, USA', '425-5551'),
(4, 'Elizabeth', 'Moore', '1992-01-16', 'DL97418876', '943 Moore St, New York, USA', '996-6557'),
(5, 'Patricia', 'Miller', '1983-12-23', 'DL81086863', '9636 Wilson St, New York, USA', '513-8744'),
(6, 'William', 'Miller', '1971-04-12', 'DL01097966', '9595 Miller St, New York, USA', '402-9562'),
(7, 'William', 'Williams', '1996-10-17', 'DL20969985', '5309 Jones St, New York, USA', '203-1566'),
(8, 'William', 'Davis', '1971-03-18', 'DL09652423', '4536 Williams St, New York, USA', '799-4013'),
(9, 'Jennifer', 'Wilson', '1993-12-08', 'DL16450434', '5940 Miller St, New York, USA', '564-2889'),
(10, 'Linda', 'Williams', '1987-10-02', 'DL67082773', '1048 Brown St, New York, USA', '432-1403'),
(11, 'Patricia', 'Johnson', '1958-01-07', 'DL28888903', '9569 Johnson St, New York, USA', '279-1635'),
(12, 'Jane', 'Johnson', '1994-12-09', 'DL80512753', '6604 Miller St, New York, USA', '926-4118'),
(13, 'James', 'Brown', '1960-01-28', 'DL13848110', '688 Brown St, New York, USA', '452-7480'),
(14, 'James', 'Brown', '1983-12-01', 'DL77179120', '2653 Johnson St, New York, USA', '624-5393'),
(15, 'Michael', 'Wilson', '1981-04-09', 'DL97930496', '1392 Davis St, New York, USA', '873-6124'),
(16, 'James', 'Taylor', '1972-10-16', 'DL82716665', '8222 Jones St, New York, USA', '402-5780'),
(17, 'Jane', 'Taylor', '1974-06-23', 'DL70437151', '217 Miller St, New York, USA', '827-2356'),
(18, 'Patricia', 'Johnson', '1964-07-11', 'DL24792678', '6172 Miller St, New York, USA', '790-9933'),
(19, 'Linda', 'Smith', '1984-08-21', 'DL66091406', '163 Brown St, New York, USA', '917-2093'),
(20, 'Linda', 'Davis', '1992-11-16', 'DL25590703', '4170 Smith St, New York, USA', '622-8976'),
(21, 'Elizabeth', 'Jones', '1960-08-01', 'DL51365898', '1586 Williams St, New York, USA', '184-6497'),
(22, 'Patricia', 'Brown', '1969-05-22', 'DL60947992', '3439 Wilson St, New York, USA', '101-6313'),
(23, 'William', 'Davis', '1981-02-15', 'DL07112490', '3147 Moore St, New York, USA', '202-9108'),
(24, 'James', 'Smith', '1971-01-14', 'DL54383332', '3165 Williams St, New York, USA', '572-7563'),
(25, 'Michael', 'Williams', '1998-05-07', 'DL69103175', '6825 Johnson St, New York, USA', '751-3524'),
(26, 'Jane', 'Wilson', '1988-02-13', 'DL50140865', '6860 Jones St, New York, USA', '681-8935'),
(27, 'Elizabeth', 'Jones', '1964-01-15', 'DL18370886', '4885 Davis St, New York, USA', '474-4083'),
(28, 'John', 'Brown', '1980-12-12', 'DL28589708', '6117 Jones St, New York, USA', '113-8282'),
(29, 'James', 'Wilson', '1993-01-15', 'DL06028722', '5726 Taylor St, New York, USA', '621-1613'),
(30, 'Jennifer', 'Taylor', '1968-02-05', 'DL46477745', '4452 Moore St, New York, USA', '516-6629'),
(31, 'Linda', 'Brown', '1951-12-21', 'DL56117986', '5882 Williams St, New York, USA', '376-1082'),
(32, 'Elizabeth', 'Miller', '1975-06-10', 'DL06304343', '6136 Miller St, New York, USA', '447-4017'),
(33, 'John', 'Taylor', '1972-05-02', 'DL24619151', '1815 Moore St, New York, USA', '912-6729'),
(34, 'Elizabeth', 'Jones', '1972-01-03', 'DL94135651', '4932 Moore St, New York, USA', '164-2767'),
(35, 'James', 'Smith', '1979-07-18', 'DL79614894', '7106 Brown St, New York, USA', '561-8199'),
(36, 'Elizabeth', 'Moore', '1973-11-24', 'DL98561009', '8554 Taylor St, New York, USA', '922-2307'),
(37, 'Elizabeth', 'Miller', '1950-04-12', 'DL67197106', '2915 Jones St, New York, USA', '708-3547'),
(38, 'Patricia', 'Taylor', '1982-07-11', 'DL94118266', '8173 Johnson St, New York, USA', '293-1187'),
(39, 'Michael', 'Jones', '1976-11-11', 'DL39134247', '5528 Taylor St, New York, USA', '163-7761'),
(40, 'Jennifer', 'Brown', '1980-07-16', 'DL77310466', '4917 Johnson St, New York, USA', '591-1001'),
(41, 'Linda', 'Brown', '1967-08-11', 'DL99058647', '8644 Miller St, New York, USA', '255-7009'),
(42, 'Patricia', 'Brown', '1950-05-01', 'DL66750748', '9255 Brown St, New York, USA', '615-6385'),
(43, 'Patricia', 'Davis', '1955-03-06', 'DL23029835', '8891 Williams St, New York, USA', '929-4146'),
(44, 'Robert', 'Moore', '2000-09-12', 'DL25003863', '2910 Brown St, New York, USA', '569-6496'),
(45, 'Linda', 'Miller', '1995-10-12', 'DL69597404', '6778 Wilson St, New York, USA', '605-1320'),
(46, 'Elizabeth', 'Wilson', '1971-06-20', 'DL42013671', '4635 Smith St, New York, USA', '504-5867'),
(47, 'Jane', 'Johnson', '1968-11-20', 'DL32977891', '7923 Taylor St, New York, USA', '913-5244'),
(48, 'John', 'Johnson', '1973-08-26', 'DL32819252', '8036 Williams St, New York, USA', '584-8110'),
(49, 'Robert', 'Johnson', '1994-08-05', 'DL05120950', '1074 Taylor St, New York, USA', '688-7176'),
(50, 'Patricia', 'Davis', '1951-03-16', 'DL68385999', '7610 Moore St, New York, USA', '383-9862'),
(51, 'Jane', 'Taylor', '1983-05-16', 'DL23384373', '7187 Wilson St, New York, USA', '982-7547'),
(52, 'Jane', 'Taylor', '1975-01-07', 'DL37663420', '6923 Johnson St, New York, USA', '912-7003'),
(53, 'Michael', 'Smith', '1993-02-06', 'DL70456797', '287 Wilson St, New York, USA', '222-7027'),
(54, 'William', 'Davis', '1992-04-27', 'DL12890534', '5124 Williams St, New York, USA', '400-5259'),
(55, 'Robert', 'Moore', '1955-10-16', 'DL57807465', '3445 Miller St, New York, USA', '774-2712'),
(56, 'Patricia', 'Williams', '1977-04-21', 'DL97955781', '5341 Jones St, New York, USA', '963-8177'),
(57, 'Robert', 'Williams', '1953-04-19', 'DL22144538', '7682 Taylor St, New York, USA', '519-2276'),
(58, 'Linda', 'Miller', '1977-09-07', 'DL35749389', '4915 Wilson St, New York, USA', '504-1927'),
(59, 'William', 'Davis', '1962-11-18', 'DL97667418', '4262 Moore St, New York, USA', '173-4836'),
(60, 'Elizabeth', 'Brown', '1987-06-28', 'DL20111496', '2838 Miller St, New York, USA', '278-6402');

-- Data Insertion in Vehicle table
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (1, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (2, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (3, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (4, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (5, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (6, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (7, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (8, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (9, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (10, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (11, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (12, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (13, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (14, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (15, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (16, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (17, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (18, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (19, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (20, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (21, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (22, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (23, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (24, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (25, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (26, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (27, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (28, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (29, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (30, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (31, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (32, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (33, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (34, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (35, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (36, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (37, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (38, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (39, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (40, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (41, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (42, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (43, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (44, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (45, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (46, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (47, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (48, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (49, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (50, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (51, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (52, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (53, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (54, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (55, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (56, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (57, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (58, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (59, 'VEY0K167XL8OFTPMT', 'Kia', 'Sorento', 'Blue', 1998);
INSERT INTO Vehicle (VehicleID, VIN, Make, Model, Color, Year) VALUES (60, '4P2S1S8NP7IJ5QZ6Q', 'Kia', 'Sonata', 'Red', 2019);

-- Data Updation in Vehicle Table
UPDATE Vehicle SET VIN = 'BEGSXWS0849ZWNQX9', Make = 'Mercedes', Model = 'Sorento', Color = 'Yellow', Year = 1996 WHERE VehicleID = 2;
UPDATE Vehicle SET VIN = 'XAQK1HL9GYOWWW9SM', Make = 'Ford', Model = 'Civic', Color = 'Silver', Year = 1998 WHERE VehicleID = 3;
UPDATE Vehicle SET VIN = 'PQWOSGEW14JN57HII', Make = 'Hyundai', Model = '3 Series', Color = 'Yellow', Year = 2000 WHERE VehicleID = 4;
UPDATE Vehicle SET VIN = 'NGK6V24LS1Y620S6E', Make = 'Honda', Model = 'A4', Color = 'Silver', Year = 1991 WHERE VehicleID = 5;
UPDATE Vehicle SET VIN = 'SHEJK6THSJQXSQ76Y', Make = 'BMW', Model = 'Corolla', Color = 'Silver', Year = 2009 WHERE VehicleID = 6;
UPDATE Vehicle SET VIN = 'QDV300H2671HMVE99', Make = 'Nissan', Model = 'Sorento', Color = 'Blue', Year = 2007 WHERE VehicleID = 7;
UPDATE Vehicle SET VIN = 'PGF3LN69ZGYQP89IY', Make = 'Kia', Model = 'F-150', Color = 'White', Year = 2018 WHERE VehicleID = 8;
UPDATE Vehicle SET VIN = 'WNRN1Z01E4XWYVZF1', Make = 'BMW', Model = 'Corolla', Color = 'Blue', Year = 2009 WHERE VehicleID = 9;
UPDATE Vehicle SET VIN = 'PH6V715WKBL98LNBT', Make = 'Nissan', Model = 'Corolla', Color = 'Grey', Year = 2009 WHERE VehicleID = 10;
UPDATE Vehicle SET VIN = 'L87FT52M5HFGYL0IZ', Make = 'Nissan', Model = 'C-Class', Color = 'Grey', Year = 2002 WHERE VehicleID = 11;
UPDATE Vehicle SET VIN = 'OLJ2JJN97PD5HMF5L', Make = 'Mercedes', Model = 'A4', Color = 'Blue', Year = 1999 WHERE VehicleID = 12;
UPDATE Vehicle SET VIN = '0CKJVVQ1186KWR4WA', Make = 'Mercedes', Model = '3 Series', Color = 'White', Year = 2016 WHERE VehicleID = 13;
UPDATE Vehicle SET VIN = 'RAUA73J56K4VTYPQ5', Make = 'BMW', Model = 'Corolla', Color = 'Silver', Year = 2020 WHERE VehicleID = 14;
UPDATE Vehicle SET VIN = 'Y7QW2V6LOBPO0TN3Y', Make = 'Kia', Model = 'A4', Color = 'Black', Year = 1992 WHERE VehicleID = 15;
UPDATE Vehicle SET VIN = '598FZJBHOJ3MRUD5B', Make = 'Honda', Model = '3 Series', Color = 'Yellow', Year = 2014 WHERE VehicleID = 16;
UPDATE Vehicle SET VIN = 'L0M1PHNC31TXPPOLT', Make = 'Toyota', Model = 'Sorento', Color = 'Blue', Year = 2020 WHERE VehicleID = 17;
UPDATE Vehicle SET VIN = 'CP9Q7DGBIPVDK5ZMR', Make = 'Hyundai', Model = 'Altima', Color = 'Blue', Year = 2010 WHERE VehicleID = 18;
UPDATE Vehicle SET VIN = 'VFS85M97ANAV8FTHG', Make = 'Honda', Model = '3 Series', Color = 'Blue', Year = 2019 WHERE VehicleID = 19;
UPDATE Vehicle SET VIN = 'MZS6QOKPQKXME9ZRN', Make = 'BMW', Model = 'Camaro', Color = 'Yellow', Year = 1998 WHERE VehicleID = 20;
UPDATE Vehicle SET VIN = 'BRC2UD34H82BE7HC0', Make = 'Nissan', Model = '3 Series', Color = 'Silver', Year = 1992 WHERE VehicleID = 21;
UPDATE Vehicle SET VIN = '1I2JX5PBYMTHEGGNU', Make = 'Nissan', Model = 'Corolla', Color = 'Grey', Year = 2018 WHERE VehicleID = 22;
UPDATE Vehicle SET VIN = '7W39NX8DIPODTDAUQ', Make = 'Toyota', Model = 'Civic', Color = 'Silver', Year = 2022 WHERE VehicleID = 23;
UPDATE Vehicle SET VIN = 'DQ9HKCQ1L0UBZFBSN', Make = 'BMW', Model = 'A4', Color = 'Purple', Year = 2021 WHERE VehicleID = 24;
UPDATE Vehicle SET VIN = 'Q7805K91F4G6R692U', Make = 'Toyota', Model = 'Corolla', Color = 'Red', Year = 2004 WHERE VehicleID = 25;
UPDATE Vehicle SET VIN = 'L5RGLKU4IPNKXW0P4', Make = 'Hyundai', Model = 'Civic', Color = 'Grey', Year = 1996 WHERE VehicleID = 26;
UPDATE Vehicle SET VIN = 'OGX26M4F1YZF40W81', Make = 'Ford', Model = 'Altima', Color = 'Silver', Year = 2010 WHERE VehicleID = 27;
UPDATE Vehicle SET VIN = 'EOMI31IFEGXB3SX7G', Make = 'Nissan', Model = 'C-Class', Color = 'Purple', Year = 2008 WHERE VehicleID = 28;
UPDATE Vehicle SET VIN = 'WWVIRHUDFDREKZ3AZ', Make = 'Ford', Model = 'Camaro', Color = 'Silver', Year = 1992 WHERE VehicleID = 29;
UPDATE Vehicle SET VIN = 'UB0CW89EHMA01YNJI', Make = 'Mercedes', Model = 'A4', Color = 'White', Year = 1999 WHERE VehicleID = 30;
UPDATE Vehicle SET VIN = 'UFZYONIW1GCMJE623', Make = 'Chevrolet', Model = '3 Series', Color = 'Purple', Year = 2016 WHERE VehicleID = 31;
UPDATE Vehicle SET VIN = '48KILLINRCBDRGITW', Make = 'Kia', Model = 'Sorento', Color = 'Silver', Year = 1991 WHERE VehicleID = 32;
UPDATE Vehicle SET VIN = 'RYV9QOMUUNP9F65YJ', Make = 'Honda', Model = 'Camaro', Color = 'White', Year = 1990 WHERE VehicleID = 33;
UPDATE Vehicle SET VIN = 'N0FJDY7ERTL29WNFI', Make = 'Toyota', Model = '3 Series', Color = 'Black', Year = 2015 WHERE VehicleID = 34;
UPDATE Vehicle SET VIN = 'S9OS6ZXZMF9QBC2MW', Make = 'Nissan', Model = 'Corolla', Color = 'Black', Year = 2006 WHERE VehicleID = 35;
UPDATE Vehicle SET VIN = '2VLBSUWA60RY2NRPP', Make = 'Mercedes', Model = 'Sorento', Color = 'Blue', Year = 2005 WHERE VehicleID = 36;
UPDATE Vehicle SET VIN = 'UX0U4TLGECAW1RGEY', Make = 'BMW', Model = 'F-150', Color = 'Red', Year = 2000 WHERE VehicleID = 37;
UPDATE Vehicle SET VIN = '1MF7GMTH3BJQ8JMP4', Make = 'Toyota', Model = 'Corolla', Color = 'Grey', Year = 2004 WHERE VehicleID = 38;
UPDATE Vehicle SET VIN = 'ELQSQBF88AY2GLD30', Make = 'Chevrolet', Model = 'Sorento', Color = 'Silver', Year = 2016 WHERE VehicleID = 39;
UPDATE Vehicle SET VIN = 'USM6PEWFPFRSQHZWU', Make = 'Toyota', Model = 'Camaro', Color = 'Blue', Year = 2019 WHERE VehicleID = 40;
UPDATE Vehicle SET VIN = 'XCI4Z4AA7YJVKURYS', Make = 'Chevrolet', Model = 'Civic', Color = 'Red', Year = 1990 WHERE VehicleID = 41;
UPDATE Vehicle SET VIN = 'WIV5VWTZK6ER0XQYS', Make = 'Ford', Model = 'F-150', Color = 'Blue', Year = 2009 WHERE VehicleID = 42;
UPDATE Vehicle SET VIN = 'B32HNUFF54UL6H4BO', Make = 'Ford', Model = 'Altima', Color = 'Yellow', Year = 2007 WHERE VehicleID = 43;
UPDATE Vehicle SET VIN = 'KZH9PJZ0STWG73JGS', Make = 'Ford', Model = 'Altima', Color = 'Red', Year = 1998 WHERE VehicleID = 44;
UPDATE Vehicle SET VIN = 'CH1WQ7ZVZ4WWYPZ5R', Make = 'BMW', Model = 'C-Class', Color = 'Blue', Year = 2009 WHERE VehicleID = 45;
UPDATE Vehicle SET VIN = 'DH4OKSFV4QKHBD7OL', Make = 'Mercedes', Model = 'F-150', Color = 'Purple', Year = 1996 WHERE VehicleID = 46;
UPDATE Vehicle SET VIN = '187I7JL7N4QW7U6HA', Make = 'BMW', Model = 'Civic', Color = 'Green', Year = 2001 WHERE VehicleID = 47;
UPDATE Vehicle SET VIN = '2Z7Z3UV2ZQ54OW8NE', Make = 'Audi', Model = 'Corolla', Color = 'Blue', Year = 2018 WHERE VehicleID = 48;
UPDATE Vehicle SET VIN = '6GV2AZRUDVSE7FLZL', Make = 'Honda', Model = 'Corolla', Color = 'Purple', Year = 2022 WHERE VehicleID = 49;
UPDATE Vehicle SET VIN = 'NQKZR1WI6EX0ED5IH', Make = 'Kia', Model = 'Altima', Color = 'Black', Year = 1991 WHERE VehicleID = 50;
UPDATE Vehicle SET VIN = 'PRCKTL6JLOCQ3HN06', Make = 'Mercedes', Model = '3 Series', Color = 'White', Year = 2016 WHERE VehicleID = 51;
UPDATE Vehicle SET VIN = 'N88N8BZNR0E3W2N92', Make = 'Kia', Model = 'F-150', Color = 'Silver', Year = 2013 WHERE VehicleID = 52;
UPDATE Vehicle SET VIN = 'CKTOGHH6EG00AVXBF', Make = 'Audi', Model = 'Altima', Color = 'Black', Year = 2003 WHERE VehicleID = 53;
UPDATE Vehicle SET VIN = '72XN5U0SNAHUBEUT0', Make = 'Kia', Model = 'C-Class', Color = 'Orange', Year = 1994 WHERE VehicleID = 54;
UPDATE Vehicle SET VIN = 'BOA9ISSSJN3R2IH9R', Make = 'Mercedes', Model = 'Civic', Color = 'Red', Year = 1996 WHERE VehicleID = 55;
UPDATE Vehicle SET VIN = '2YKZR12K40WWW78M5', Make = 'BMW', Model = 'Camaro', Color = 'Purple', Year = 1993 WHERE VehicleID = 56;
UPDATE Vehicle SET VIN = 'LFJI5PEB9G9K6HBSR', Make = 'Mercedes', Model = 'C-Class', Color = 'Silver', Year = 2021 WHERE VehicleID = 57;
UPDATE Vehicle SET VIN = 'X22QDD9V4S1BU8NG6', Make = 'Nissan', Model = 'Sorento', Color = 'Blue', Year = 2021 WHERE VehicleID = 58;
UPDATE Vehicle SET VIN = 'GSA5ZOBZ68Q47BNCI', Make = 'Ford', Model = 'Civic', Color = 'Red', Year = 2005 WHERE VehicleID = 59;
UPDATE Vehicle SET VIN = 'MZ5WDC6I20OEMAGMV', Make = 'Ford', Model = 'Sorento', Color = 'Purple', Year = 2000 WHERE VehicleID = 60;

 -- Data Insertion in Accident Table
 INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (1, '2021-04-11', 'Minor fender bender', 15810.39);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (2, '2019-05-19', 'Major collision', 964.2);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (3, '2019-09-14', 'Minor fender bender', 7983.69);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (4, '2019-05-12', 'Major collision', 7740.46);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (5, '2022-07-08', 'Major collision', 263.09);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (6, '2021-11-28', 'Property damage', 16029.61);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (7, '2020-01-13', 'Major collision', 19367.57);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (8, '2021-08-01', 'Pedestrian involved', 427.56);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (9, '2020-05-04', 'Major collision', 19651.55);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (10, '2020-06-18', 'Minor fender bender', 11387.06);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (11, '2020-01-01', 'Vehicle rollover', 263.19);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (12, '2021-07-16', 'Property damage', 3572.12);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (13, '2022-04-17', 'Major collision', 10215.78);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (14, '2022-08-12', 'Property damage', 15099.01);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (15, '2021-10-15', 'Vehicle rollover', 1361.62);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (16, '2022-03-22', 'Property damage', 2919.06);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (17, '2020-07-19', 'Property damage', 17449.3);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (18, '2019-10-14', 'Property damage', 9929.94);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (19, '2020-11-30', 'Major collision', 9340.4);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (20, '2023-01-09', 'Major collision', 14571.56);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (21, '2021-03-06', 'Property damage', 5085.73);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (22, '2021-03-20', 'Pedestrian involved', 12110.42);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (23, '2023-04-09', 'Major collision', 1160.28);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (24, '2024-01-23', 'Vehicle rollover', 18656.19);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (25, '2021-09-09', 'Vehicle rollover', 14450.97);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (26, '2021-02-17', 'Pedestrian involved', 4035.98);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (27, '2022-03-15', 'Vehicle rollover', 6301.78);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (28, '2021-11-18', 'Minor fender bender', 15880.88);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (29, '2019-08-29', 'Major collision', 5644.46);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (30, '2020-05-04', 'Pedestrian involved', 4210.82);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (31, '2019-11-26', 'Major collision', 18249.04);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (32, '2020-11-08', 'Pedestrian involved', 7931.51);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (33, '2021-03-25', 'Property damage', 10208.73);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (34, '2022-09-04', 'Major collision', 3202.97);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (35, '2023-03-17', 'Property damage', 14786.12);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (36, '2021-01-05', 'Major collision', 2418.01);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (37, '2021-09-24', 'Vehicle rollover', 5576.57);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (38, '2019-07-18', 'Vehicle rollover', 14884.99);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (39, '2021-03-05', 'Pedestrian involved', 3581.22);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (40, '2022-08-10', 'Vehicle rollover', 16266.1);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (41, '2023-05-28', 'Pedestrian involved', 3799.81);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (42, '2019-09-16', 'Vehicle rollover', 2833.1);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (43, '2021-02-18', 'Pedestrian involved', 111.85);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (44, '2023-11-10', 'Vehicle rollover', 7065.36);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (45, '2023-11-20', 'Pedestrian involved', 11972.23);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (46, '2020-03-26', 'Major collision', 5096.13);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (47, '2021-10-12', 'Vehicle rollover', 15144.47);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (48, '2023-07-19', 'Minor fender bender', 13231.95);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (49, '2021-05-14', 'Vehicle rollover', 4754.19);
INSERT INTO Accident (AccidentID, DateOfAccident, Description, DamageEstimate) VALUES (50, '2021-11-17', 'Property damage', 8646.1);

-- Data Insertion in AccidentPerson Table
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (1, 28);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (1, 1);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (2, 15);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (2, 5);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (3, 12);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (3, 9);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (4, 31);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (4, 6);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (5, 41);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (5, 25);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (6, 36);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (6, 26);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (7, 23);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (7, 31);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (8, 47);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (8, 60);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (9, 56);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (9, 18);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (10, 42);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (10, 20);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (11, 13);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (11, 56);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (12, 44);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (12, 23);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (13, 52);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (13, 24);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (14, 20);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (14, 36);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (15, 35);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (15, 41);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (16, 58);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (16, 12);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (17, 57);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (17, 28);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (18, 31);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (18, 57);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (19, 14);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (19, 50);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (20, 10);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (20, 39);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (21, 22);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (21, 1);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (22, 8);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (22, 51);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (23, 39);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (23, 46);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (24, 29);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (24, 24);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (25, 9);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (25, 16);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (26, 33);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (26, 52);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (27, 34);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (27, 25);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (28, 19);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (28, 7);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (29, 7);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (29, 40);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (30, 33);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (30, 9);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (31, 35);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (31, 42);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (32, 45);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (32, 32);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (33, 45);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (33, 9);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (34, 47);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (34, 59);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (35, 18);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (35, 51);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (36, 22);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (36, 4);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (37, 11);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (37, 32);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (38, 16);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (38, 20);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (39, 40);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (39, 28);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (40, 58);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (40, 25);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (41, 57);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (41, 58);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (42, 15);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (42, 40);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (43, 37);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (43, 38);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (44, 12);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (44, 14);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (45, 10);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (45, 9);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (46, 48);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (46, 8);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (47, 24);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (47, 7);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (48, 43);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (48, 29);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (49, 12);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (49, 5);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (50, 47);
INSERT INTO AccidentPerson (AccidentID, PersonID) VALUES (50, 3);

-- Data Insertion in AccidentVehicle Table
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (15, 16);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (31, 16);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (6, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (14, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (8, 60);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (5, 25);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (27, 25);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (40, 25);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (25, 43);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (38, 43);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (10, 2);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (31, 2);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (6, 14);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (14, 14);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (22, 24);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (35, 24);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (4, 19);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (5, 20);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (15, 20);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (1, 52);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (17, 52);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (39, 52);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (10, 38);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (31, 38);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (3, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (25, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (30, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (33, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (45, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (8, 22);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (34, 22);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (50, 22);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (25, 10);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (38, 10);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (48, 16);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (8, 12);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (8, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (34, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (50, 45);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (46, 56);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (17, 43);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (18, 43);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (41, 43);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (27, 36);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (10, 15);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (31, 15);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (13, 52);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (24, 52);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (47, 52);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (15, 38);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (13, 4);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (24, 4);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (47, 4);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (8, 28);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (27, 26);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (23, 10);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (32, 27);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (33, 27);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (11, 25);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (9, 20);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (11, 20);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (46, 24);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (3, 10);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (30, 10);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (33, 10);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (45, 10);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (13, 16);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (26, 16);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (10, 6);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (14, 6);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (38, 6);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (50, 35);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (25, 27);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (38, 27);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (4, 12);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (34, 51);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (20, 44);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (23, 44);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (32, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (33, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (2, 13);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (49, 13);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (9, 47);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (11, 47);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (28, 38);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (6, 17);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (13, 25);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (24, 25);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (47, 25);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (3, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (25, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (30, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (45, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (46, 8);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (19, 44);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (44, 44);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (25, 56);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (38, 56);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (3, 53);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (25, 53);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (30, 53);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (33, 53);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (45, 53);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (22, 21);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (35, 21);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (24, 11);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (48, 11);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (27, 39);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (37, 22);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (5, 36);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (15, 36);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (1, 15);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (21, 15);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (17, 29);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (18, 29);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (41, 29);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (13, 3);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (26, 3);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (22, 53);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (46, 53);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (5, 9);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (15, 9);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (11, 54);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (26, 28);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (30, 28);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (24, 34);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (48, 34);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (28, 47);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (29, 47);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (47, 47);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (20, 18);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (45, 18);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (8, 44);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (4, 52);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (9, 16);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (35, 16);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (43, 19);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (6, 60);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (23, 3);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (27, 21);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (27, 20);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (40, 20);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (12, 37);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (26, 36);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (30, 36);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (37, 13);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (24, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (48, 41);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (9, 39);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (35, 39);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (26, 30);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (30, 30);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (11, 31);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (6, 23);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (14, 23);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (12, 47);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (20, 35);
INSERT INTO AccidentVehicle (AccidentID, VehicleID) VALUES (23, 35);

-- Data Insertion in Registration Table

INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (1, '2023-10-11', '2024-10-10', 98.11);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (2, '2023-09-17', '2025-09-16', 275.12);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (3, '2022-07-13', '2024-07-12', 205.57);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (4, '2023-07-09', '2025-07-08', 138.82);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (5, '2023-06-17', '2026-06-16', 73.65);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (6, '2024-04-01', '2026-04-01', 95.8);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (7, '2022-04-27', '2023-04-27', 113.51);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (8, '2022-12-24', '2023-12-24', 276.74);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (9, '2022-10-17', '2024-10-16', 261.72);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (10, '2022-08-02', '2023-08-02', 181.29);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (11, '2024-01-19', '2027-01-18', 298.11);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (12, '2023-04-10', '2025-04-09', 277.06);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (13, '2023-02-28', '2024-02-28', 211.94);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (14, '2022-08-26', '2023-08-26', 83.05);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (15, '2023-12-14', '2026-12-13', 261.82);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (16, '2022-11-20', '2024-11-19', 146.76);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (17, '2022-09-02', '2024-09-01', 235.14);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (18, '2023-09-03', '2025-09-02', 288.78);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (19, '2024-01-02', '2025-01-01', 295.77);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (20, '2024-03-11', '2025-03-11', 242.09);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (21, '2024-01-23', '2026-01-22', 254.89);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (22, '2023-02-10', '2025-02-09', 258.19);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (23, '2023-10-20', '2026-10-19', 95.51);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (24, '2022-06-13', '2025-06-12', 58.21);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (25, '2022-10-19', '2024-10-18', 103.23);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (26, '2022-10-25', '2024-10-24', 133.1);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (27, '2024-03-14', '2025-03-14', 85.8);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (28, '2024-04-02', '2027-04-02', 167.62);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (29, '2023-02-13', '2025-02-12', 163.9);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (30, '2023-11-18', '2024-11-17', 122.69);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (31, '2023-11-22', '2024-11-21', 108.53);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (32, '2022-04-25', '2023-04-25', 117.55);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (33, '2023-03-13', '2026-03-12', 115.01);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (34, '2024-01-27', '2025-01-26', 202.73);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (35, '2024-01-03', '2025-01-02', 284.66);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (36, '2023-05-22', '2025-05-21', 215.44);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (37, '2023-09-05', '2024-09-04', 239.16);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (38, '2023-05-10', '2025-05-09', 274.67);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (39, '2023-03-16', '2026-03-15', 252.39);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (40, '2023-06-29', '2025-06-28', 81.38);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (41, '2024-01-01', '2025-12-31', 133.72);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (42, '2023-04-18', '2025-04-17', 244.68);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (43, '2022-05-01', '2023-05-01', 103.1);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (44, '2024-03-15', '2025-03-15', 108.51);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (45, '2024-01-16', '2026-01-15', 180.64);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (46, '2022-09-09', '2024-09-08', 251.52);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (47, '2022-07-07', '2024-07-06', 172.79);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (48, '2023-12-07', '2026-12-06', 135.2);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (49, '2023-03-29', '2024-03-28', 252.5);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (50, '2024-02-17', '2025-02-16', 146.13);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (51, '2022-05-06', '2023-05-06', 129.21);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (52, '2022-04-24', '2023-04-24', 180.61);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (53, '2023-04-15', '2025-04-14', 178.49);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (54, '2022-08-31', '2024-08-30', 94.31);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (55, '2023-01-22', '2025-01-21', 214.37);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (56, '2023-12-23', '2024-12-22', 133.12);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (57, '2023-08-26', '2025-08-25', 79.89);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (58, '2022-11-08', '2023-11-08', 110.52);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (59, '2022-09-28', '2025-09-27', 213.59);
INSERT INTO Registration (RegistrationID, RegistrationDate, ExpiryDate, RegistrationFee) VALUES (60, '2023-02-05', '2026-02-04', 197.72);

-- Data Insertion in VehicleRegistration Table
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (1, 1, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (2, 2, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (3, 3, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (4, 4, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (5, 5, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (6, 6, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (7, 7, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (8, 8, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (9, 9, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (10, 10, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (11, 11, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (12, 12, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (13, 13, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (14, 14, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (15, 15, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (16, 16, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (17, 17, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (18, 18, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (19, 19, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (20, 20, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (21, 21, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (22, 22, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (23, 23, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (24, 24, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (25, 25, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (26, 26, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (27, 27, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (28, 28, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (29, 29, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (30, 30, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (31, 31, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (32, 32, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (33, 33, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (34, 34, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (35, 35, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (36, 36, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (37, 37, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (38, 38, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (39, 39, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (40, 40, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (41, 41, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (42, 42, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (43, 43, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (44, 44, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (45, 45, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (46, 46, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (47, 47, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (48, 48, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (49, 49, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (50, 50, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (51, 51, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (52, 52, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (53, 53, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (54, 54, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (55, 55, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (56, 56, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (57, 57, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (58, 58, True);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (59, 59, False);
INSERT INTO VehicleRegistration (VehicleID, RegistrationID, Active) VALUES (60, 60, True);

-- Data Insertion in Ownership Table
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (1, 35, 16, '2018-09-08', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (2, 36, 41, '2014-08-30', '2016-05-04');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (3, 60, 60, '2014-06-25', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (4, 25, 25, '2022-02-10', '2023-09-06');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (5, 16, 43, '2017-01-13', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (6, 42, 2, '2014-06-02', '2015-07-09');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (7, 36, 14, '2017-06-19', '2018-07-06');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (8, 51, 24, '2016-12-24', '2017-02-27');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (9, 6, 19, '2016-07-09', '2017-09-28');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (10, 41, 20, '2018-06-19', '2019-01-29');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (11, 28, 52, '2022-05-24', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (12, 42, 38, '2022-11-12', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (13, 9, 45, '2020-03-14', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (14, 47, 22, '2014-06-16', '2015-06-25');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (15, 16, 10, '2017-12-16', '2019-01-07');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (16, 43, 16, '2018-11-21', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (17, 60, 12, '2017-11-29', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (18, 2, 17, '2017-07-25', '2018-11-24');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (19, 47, 45, '2019-05-26', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (20, 41, 20, '2022-08-14', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (21, 48, 56, '2019-12-11', '2022-11-17');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (22, 57, 43, '2022-05-19', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (23, 34, 36, '2018-04-03', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (24, 42, 15, '2017-11-12', '2019-11-11');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (25, 54, 37, '2021-06-16', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (26, 24, 52, '2020-08-01', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (27, 35, 38, '2016-02-15', '2016-09-29');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (28, 17, 34, '2014-11-04', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (29, 30, 45, '2018-04-30', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (30, 24, 4, '2017-10-02', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (31, 60, 28, '2017-12-30', '2020-05-30');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (32, 34, 26, '2022-01-02', '2024-01-10');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (33, 46, 10, '2020-04-10', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (34, 45, 27, '2018-08-21', '2019-10-22');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (35, 13, 25, '2017-06-13', '2018-02-08');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (36, 56, 20, '2020-07-19', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (37, 8, 24, '2021-07-07', '2024-04-19');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (38, 9, 10, '2018-10-03', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (39, 30, 35, '2015-02-07', '2016-11-07');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (40, 52, 16, '2017-09-28', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (41, 17, 4, '2022-06-19', '2022-07-29');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (42, 20, 6, '2016-09-13', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (43, 3, 35, '2018-07-21', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (44, 16, 27, '2021-10-03', '2023-09-18');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (45, 6, 12, '2015-08-05', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (46, 59, 51, '2020-11-01', '2022-12-05');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (47, 39, 44, '2017-01-11', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (48, 45, 41, '2022-01-25', '2023-12-09');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (49, 5, 13, '2015-07-18', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (50, 56, 47, '2021-05-29', '2023-05-11');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (51, 19, 38, '2019-07-15', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (52, 26, 17, '2022-09-11', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (53, 24, 25, '2016-04-25', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (54, 9, 41, '2016-11-26', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (55, 48, 8, '2020-06-27', '2021-05-13');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (56, 14, 44, '2023-02-25', '2025-05-07');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (57, 16, 56, '2022-12-16', '2024-10-26');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (58, 9, 53, '2023-04-11', '2023-08-29');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (59, 30, 14, '2019-02-25', '2020-09-06');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (60, 51, 21, '2016-04-30', '2017-04-06');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (61, 54, 3, '2015-09-12', '2016-07-02');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (62, 29, 11, '2014-04-30', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (63, 34, 39, '2020-10-24', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (64, 11, 22, '2019-04-14', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (65, 54, 24, '2019-04-16', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (66, 41, 36, '2022-07-30', '2024-07-18');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (67, 1, 15, '2016-12-06', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (68, 57, 29, '2022-09-29', '2024-05-21');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (69, 52, 3, '2015-11-04', '2018-06-13');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (70, 8, 53, '2014-11-30', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (71, 41, 9, '2021-11-19', '2024-01-06');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (72, 13, 54, '2021-03-11', '2021-08-19');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (73, 33, 28, '2022-08-18', '2024-07-31');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (74, 29, 34, '2015-05-02', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (75, 7, 47, '2017-08-04', '2017-11-28');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (76, 10, 18, '2023-04-08', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (77, 60, 44, '2014-05-01', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (78, 6, 52, '2019-05-09', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (79, 18, 16, '2022-09-15', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (80, 38, 19, '2019-12-03', '2021-08-07');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (81, 26, 60, '2022-04-01', '2024-11-17');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (82, 30, 44, '2019-12-31', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (83, 46, 3, '2014-08-16', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (84, 34, 21, '2023-02-06', '2025-11-04');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (85, 25, 20, '2017-01-29', '2019-12-15');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (86, 44, 37, '2014-12-01', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (87, 33, 36, '2017-04-24', '2017-06-26');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (88, 37, 19, '2022-01-30', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (89, 11, 13, '2022-05-05', '2024-06-13');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (90, 29, 41, '2016-07-27', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (91, 18, 39, '2018-06-04', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (92, 33, 30, '2014-05-11', '2016-08-22');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (93, 13, 31, '2018-11-30', '2019-06-12');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (94, 49, 2, '2015-05-12', '2016-10-08');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (95, 16, 56, '2020-07-14', '2022-03-31');
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (96, 36, 23, '2020-09-21', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (97, 44, 47, '2021-10-13', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (98, 25, 20, '2018-04-13', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (99, 30, 5, '2020-06-14', NULL);
INSERT INTO Ownership (OwnershipID, PersonID, VehicleID, PurchaseDate, SaleDate) VALUES (100, 39, 35, '2015-09-07', NULL);

-- Data Insertion in License Table
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL60091869', 'Class B', '1980-04-07', '1990-04-08');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL32282877', 'Commercial Driver License', '1989-03-07', '1999-03-08');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL84627019', 'Class C', '1989-04-12', '1999-04-13');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL97418876', 'Commercial Driver License', '2010-01-15', '2020-01-16');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL81086863', 'Motorcycle License', '2001-12-22', '2011-12-23');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL01097966', 'Class B', '1989-04-11', '1999-04-12');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL20969985', 'Class B', '2014-10-17', '2024-10-17');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL09652423', 'Class B', '1989-03-17', '1999-03-18');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL16450434', 'Class C', '2011-12-08', '2021-12-08');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL67082773', 'Class C', '2005-10-01', '2015-10-02');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL28888903', 'Class A', '1976-01-07', '1986-01-07');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL80512753', 'Class A', '2012-12-08', '2022-12-09');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL13848110', 'Motorcycle License', '1978-01-27', '1988-01-28');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL77179120', 'Commercial DriverLicense', '2001-11-30', '2011-12-01');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL97930496', 'Class C', '1999-04-09', '2009-04-09');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL82716665', 'Class C', '1990-10-16', '2000-10-16');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL70437151', 'Motorcycle License', '1992-06-22', '2002-06-23');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL24792678', 'Class B', '1982-07-11', '1992-07-11');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL66091406', 'Commercial Driver License', '2002-08-21', '2012-08-21');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL25590703', 'Motorcycle License', '2010-11-16', '2020-11-16');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL51365898', 'Commercial Driver License', '1978-08-01', '1988-08-01');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL60947992', 'Commercial Driver License', '1987-05-22', '1997-05-22');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL07112490', 'Commercial Driver License', '1999-02-15', '2009-02-15');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL54383332', 'Class A', '1989-01-13', '1999-01-14');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL69103175', 'Class B', '2016-05-06', '2026-05-07');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL50140865', 'Class A', '2006-02-12', '2016-02-13');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL18370886', 'Commercial Driver License', '1982-01-14', '1992-01-15');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL28589708', 'Class A', '1998-12-12', '2008-12-12');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL06028722', 'Class A', '2011-01-15', '2021-01-15');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL46477745', 'Class A', '1986-02-04', '1996-02-05');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL56117986', 'Class A', '1969-12-20', '1979-12-21');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL06304343', 'Commercial Driver License', '1993-06-09', '2003-06-10');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL24619151', 'Commercial Driver License', '1990-05-02', '2000-05-02');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL94135651', 'Class C', '1990-01-02', '2000-01-03');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL79614894', 'Motorcycle License', '1997-07-17', '2007-07-18');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL98561009', 'Motorcycle License', '1991-11-24', '2001-11-24');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL67197106', 'Class B', '1968-04-11', '1978-04-12');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL94118266', 'Class C', '2000-07-10', '2010-07-11');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL39134247', 'Motorcycle License', '1994-11-11', '2004-11-11');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL77310466', 'Class C', '1998-07-16', '2008-07-16');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL99058647', 'Class A', '1985-08-10', '1995-08-11');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL66750748', 'Commercial Driver License', '1968-04-30', '1978-05-01');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL23029835', 'Class B', '1973-03-05', '1983-03-06');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL25003863', 'Class C', '2018-09-12', '2028-09-12');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL69597404', 'Motorcycle License', '2013-10-11', '2023-10-12');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL42013671', 'Class C', '1989-06-19', '1999-06-20');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL32977891', 'Class C', '1986-11-20', '1996-11-20');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL32819252', 'Motorcycle License', '1991-08-26', '2001-08-26');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL05120950', 'Class A', '2012-08-04', '2022-08-05');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL68385999', 'Class A', '1969-03-15', '1979-03-16');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL23384373', 'Commercial Driver License', '2001-05-15', '2011-05-16');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL37663420', 'Motorcycle License', '1993-01-06', '2003-01-07');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL70456797', 'Class C', '2011-02-06', '2021-02-06');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL12890534', 'Class B', '2010-04-27', '2020-04-27');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL57807465', 'Class A', '1973-10-15', '1983-10-16');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL97955781', 'Commercial Driver License', '1995-04-21', '2005-04-21');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL22144538', 'Motorcycle License', '1971-04-19', '1981-04-19');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL35749389', 'Motorcycle License', '1995-09-07', '2005-09-07');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL97667418', 'Motorcycle License', '1980-11-17', '1990-11-18');
INSERT INTO License (LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES ('DL20111496', 'Motorcycle License', '2005-06-27', '2015-06-28');

-- Data Insetion in PersonLicense Table
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (1, 'DL60091869', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (2, 'DL32282877', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (3, 'DL84627019', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (4, 'DL97418876', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (5, 'DL81086863', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (6, 'DL01097966', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (7, 'DL20969985', TRUE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (8, 'DL09652423', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (9, 'DL16450434', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (10, 'DL67082773', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (11, 'DL28888903', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (12, 'DL80512753', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (13, 'DL13848110', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (14, 'DL77179120', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (15, 'DL97930496', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (16, 'DL82716665', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (17, 'DL70437151', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (18, 'DL24792678', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (19, 'DL66091406', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (20, 'DL25590703', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (21, 'DL51365898', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (22, 'DL60947992', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (23, 'DL07112490', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (24, 'DL54383332', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (25, 'DL69103175', TRUE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (26, 'DL50140865', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (27, 'DL18370886', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (28, 'DL28589708', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (29, 'DL06028722', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (30, 'DL46477745', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (31, 'DL56117986', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (32, 'DL06304343', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (33, 'DL24619151', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (34, 'DL94135651', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (35, 'DL79614894', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (36, 'DL98561009', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (37, 'DL67197106', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (38, 'DL94118266', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (39, 'DL39134247', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (40, 'DL77310466', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (41, 'DL99058647', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (42, 'DL66750748', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (43, 'DL23029835', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (44, 'DL25003863', TRUE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (45, 'DL69597404', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (46, 'DL42013671', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (47, 'DL32977891', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (48, 'DL32819252', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (49, 'DL05120950', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (50, 'DL68385999', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (51, 'DL23384373', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (52, 'DL37663420', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (53, 'DL70456797', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (54, 'DL12890534', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (55, 'DL57807465', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (56, 'DL97955781', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (57, 'DL22144538', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (58, 'DL35749389', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (59, 'DL97667418', FALSE);
INSERT INTO PersonLicense (PersonID, LicenseNumber, Active) VALUES (60, 'DL20111496', FALSE);

-- Data Insertion in InsurancePloicy Table
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (1, 'Progressive', 'OF9MS782KB', '2022-09-06', '2023-09-06');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (2, 'Allstate', 'D9GQR1IXQN', '2015-04-21', '2018-04-20');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (3, 'Nationwide', '397WLBLFAP', '2024-04-11', '2029-04-10');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (4, 'Geico', 'K3MQM7NBXW', '2018-09-23', '2023-09-22');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (5, 'State Farm', 'MHWVJYWXAX', '2015-11-19', '2016-11-18');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (6, 'State Farm', 'VH6QMYDM8J', '2020-05-15', '2023-05-15');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (7, 'Progressive', '98BY77J7GC', '2015-03-16', '2020-03-14');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (8, 'Nationwide', '0TWP0WV557', '2018-02-25', '2019-02-25');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (9, 'Nationwide', 'IDJZ4ATCIY', '2019-02-20', '2021-02-19');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (10, 'Geico', '7NDL50QV6L', '2021-03-01', '2024-02-29');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (11, 'Progressive', '1FCVRFV7D4', '2022-07-18', '2025-07-17');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (12, 'Allstate', '1HDKDHX3A2', '2020-08-30', '2021-08-30');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (13, 'Geico', 'XAV86ZZ9MZ', '2017-06-21', '2018-06-21');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (14, 'Allstate', '9E5P0973ST', '2021-11-28', '2024-11-27');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (15, 'Progressive', '1MBLVMKI63', '2024-02-02', '2029-01-31');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (16, 'Progressive', 'HPBQB8QWR8', '2016-12-12', '2021-12-11');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (17, 'Geico', 'V2Z9ITX1SA', '2018-04-21', '2022-04-20');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (18, 'State Farm', 'ZV537ZRLBJ', '2017-04-13', '2022-04-12');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (19, 'State Farm', '87CXKSHXJO', '2015-05-06', '2020-05-04');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (20, 'Nationwide', 'DMC05MMCA8', '2016-04-05', '2017-04-05');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (21, 'State Farm', 'LYDHB9TD7S', '2016-05-11', '2017-05-11');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (22, 'Geico', 'F500A1MJA5', '2014-10-18', '2015-10-18');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (23, 'Geico', '0YRMK10TMM', '2020-06-19', '2021-06-19');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (24, 'Geico', '9XNFOGMRR3', '2014-06-29', '2016-06-28');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (25, 'Allstate', 'WW472ZHS8T', '2021-08-26', '2024-08-25');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (26, 'Nationwide', 'DDP17W9PU9', '2023-09-09', '2025-09-08');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (27, 'Nationwide', 'FQDEUTRUPF', '2019-04-28', '2022-04-27');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (28, 'Allstate', 'GM803SDM43', '2018-04-02', '2020-04-01');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (29, 'State Farm', 'LL4IXQ4F04', '2017-11-18', '2018-11-18');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (30, 'Geico', 'CX51LJFWU5', '2020-08-11', '2024-08-10');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (31, 'Nationwide', 'QYJ2YPY0TM', '2016-10-20', '2017-10-20');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (32, 'Geico', 'V2B59XPUV3', '2016-09-30', '2021-09-29');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (33, 'Progressive', '5IBXVVWET8', '2014-06-01', '2018-05-31');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (34, 'Geico', 'NQE3PE0YZR', '2017-05-01', '2019-05-01');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (35, 'Progressive', '8Z7KV7X2IW', '2019-10-03', '2020-10-02');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (36, 'State Farm', 'Z3486SLWAA', '2023-07-23', '2027-07-22');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (37, 'Geico', 'PEIHCX3THY', '2020-03-05', '2023-03-05');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (38, 'Progressive', 'X75ATBPJDL', '2022-09-28', '2024-09-27');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (39, 'Nationwide', 'UBKCWHFQJS', '2018-11-19', '2019-11-19');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (40, 'Geico', 'E814DUI40Z', '2022-03-02', '2024-03-01');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (41, 'Progressive', 'WV3PQXZJC0', '2014-06-19', '2015-06-19');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (42, 'State Farm', 'GOR6VHISZ2', '2014-12-07', '2019-12-06');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (43, 'State Farm', 'PESDDBI108', '2014-08-29', '2017-08-28');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (44, 'State Farm', 'ZMONNOTTNJ', '2023-05-26', '2028-05-24');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (45, 'Progressive', 'SZQG0GTO69', '2022-01-25', '2027-01-24');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (46, 'Nationwide', 'QA8JUIWE3G', '2024-01-06', '2025-01-05');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (47, 'Progressive', 'Y8J7E9PLFA', '2022-03-12', '2025-03-11');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (48, 'State Farm', '3CDW8Q06GN', '2019-01-24', '2021-01-23');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (49, 'State Farm', 'ACRUDY60XV', '2016-01-21', '2021-01-19');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (50, 'Nationwide', 'QBT795K5AH', '2017-08-13', '2018-08-13');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (51, 'Progressive', 'I8OGUMZA6F', '2018-07-29', '2020-07-28');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (52, 'Progressive', 'UI9D5ZMFBR', '2015-08-26', '2017-08-25');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (53, 'Geico', 'SUESLWLJF4', '2019-05-23', '2022-05-22');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (54, 'Progressive', 'I9FFC25IEU', '2022-10-20', '2026-10-19');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (55, 'Progressive', 'TGC1CD9EXP', '2022-01-16', '2025-01-15');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (56, 'Geico', 'FYNNM34HWT', '2022-01-05', '2023-01-05');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (57, 'State Farm', 'WR74BP0VNL', '2021-08-31', '2025-08-30');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (58, 'Progressive', 'IF4Y204UM3', '2019-03-16', '2020-03-15');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (59, 'Geico', 'EZEL2E3PQ0', '2014-07-17', '2017-07-16');
INSERT INTO InsurancePolicy (InsuranceID, Provider, PolicyNumber, IssueDate, ExpiryDate) VALUES (60, 'Nationwide', '4F4GSDKN00', '2018-12-20', '2023-12-19');

-- Data Insertion in VehicleInsurance Table

INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (56, 22, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (46, 46, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (7, 7, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (10, 31, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (6, 20, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (38, 60, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (52, 45, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (44, 35, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (35, 4, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (22, 57, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (42, 25, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (16, 17, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (51, 44, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (21, 1, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (55, 54, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (23, 21, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (15, 48, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (57, 12, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (41, 36, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (49, 23, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (24, 34, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (2, 33, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (18, 51, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (54, 55, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (13, 30, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (28, 28, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (45, 10, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (48, 49, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (14, 38, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (11, 24, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (59, 29, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (40, 6, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (58, 9, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (5, 59, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (39, 40, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (53, 52, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (8, 56, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (17, 41, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (12, 11, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (19, 50, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (31, 43, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (9, 37, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (37, 14, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (33, 58, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (36, 47, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (32, 16, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (4, 3, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (50, 2, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (43, 13, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (47, 32, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (60, 19, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (25, 27, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (30, 15, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (34, 8, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (27, 39, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (20, 26, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (1, 18, False);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (29, 5, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (3, 42, True);
INSERT INTO VehicleInsurance (VehicleID, InsuranceID, Active) VALUES (26, 53, False);

-- Data Viewing
SELECT * FROM accident;
SELECT * FROM accidentperson;
SELECT * FROM accidentvehicle;
SELECT * FROM insurancepolicy;
SELECT * FROM license;
SELECT * FROM ownership;
SELECT * FROM person;
SELECT * FROM personlicense;
SELECT * FROM registration;
SELECT * FROM vehicle;
SELECT * FROM vehicleinsurance;
SELECT * FROM vehicleregistration;

-- Checking for Accidents of cars made by 'FORD'
SELECT accident.AccidentID Unique_Vehicle_No, count(accident.AccidentID) Total_Accidents
FROM vehicle
JOIN accidentvehicle
ON vehicle.VehicleID = accidentvehicle.VehicleID
JOIN accident
ON accidentvehicle.AccidentID = accident.AccidentID
WHERE make = 'Ford'
GROUP BY accident.AccidentID
ORDER BY accident.AccidentID;


-- Checking for registered cars by a particular car company which were sold between two dates
SELECT count(vehicle.make) Total
FROM ownership
JOIN vehicle
ON ownership.VehicleID=vehicle.VehicleID
WHERE 
PurchaseDate>"2015-01-01" AND PurchaseDate<"2020-01-01" AND vehicle.make ='Kia';



 
