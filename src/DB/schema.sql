DROP DATABASE IF EXISTS Newark_Medical;

CREATE DATABASE Newark_Medical;
USE Newark_Medical;

DROP TABLE IF EXISTS `Patient_Info`;
CREATE TABLE `Newark_Medical`.`Patient_Info` (
  `PatientID` INT NOT NULL AUTO_INCREMENT,
  `SSN` INT NULL,
  `PatientName` VARCHAR(45) NULL,
  `Gender` VARCHAR(45) NULL,
  `Address` VARCHAR(250) NULL,
  `Phone` VARCHAR(55) NULL,
  PRIMARY KEY (`PatientID`));

INSERT INTO `Patient_Info` (`PatientID`, `SSN`, `PatientName`, `Gender`, `Address`, `Phone`)
VALUES
(1234, 112211, 'Jill', 'Female', '1234 Jane Road', '828-989-7049'),
(2345, 223322, 'Adam', 'Male', '345 Rector Street', '305-713-3662'),
(3455, 334433, 'Trevor', 'Male', '652 Matthew Drive', '312-728-9999');

DROP TABLE IF EXISTS `Clinical_Personnel`;
CREATE TABLE `Newark_Medical`.`Clinical_Personnel` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `SSN` INT NULL,
  `CP_Name` VARCHAR(45) NULL,
  `Gender` VARCHAR(45) NULL,
  `Address` VARCHAR(250) NULL,
  `Salary` INT NULL,
  `Phone` VARCHAR(55) NULL,
  PRIMARY KEY (`EmployeeID`));

INSERT INTO `Clinical_Personnel` (`EmployeeID`, `SSN`, `CP_Name`, `Gender`, `Address`, `Salary`, `Phone`)
VALUES
(1234, 43215432, 'Grace', 'Female', '115 Matthew Drive', '40k', '305-713-4562'),
(2345, 54326543, 'Rohan', 'Male', '16 6th Street', '60k', '904-713-3662'),
(3456, 65435432, 'Kandy', 'Male', '30 River Court', '70k', '312-897-9176');

DROP TABLE IF EXISTS `PC_Physician`;
CREATE TABLE `Newark_Medical`.`PC_Physician` (
  `PhysicianID` INT NOT NULL AUTO_INCREMENT,
  `Phy_Name` VARCHAR(60) NULL,
  `Specialty` VARCHAR(60) NULL,
  `No_of_Patients` INT NULL,
  `PatientID` INT NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`PhysicianID`));

 INSERT INTO `PC_Physician` (`PhysicianID`, `Phy_Name`, `Specialty`, `No_of_Patients`, `PatientID`, `Salary`)
 VALUES
 (1234, 'Rebecca', 'Cardiology', '3', 1234, '70k'),
 (9876, 'Rachel', 'Pediatrics', '2', 2345, '60k'),
 (8765, 'Frank', 'Hospice', '1', 3456, '50k');

DROP TABLE IF EXISTS `Nurses`;
CREATE TABLE `Newark_Medical`.`Nurses` (
  `NurseID` INT NOT NULL AUTO_INCREMENT,
  `Surgery_Skills` VARCHAR(45) NULL,
  `Grade` INT NULL,
  `Salary` INT NULL,
  `Year_Experience` VARCHAR(45) NULL,
  `Nurse_Name` VARCHAR(45) NULL,
  `No_of_Patients` INT NULL,
  `Surgery_Inpatient` VARCHAR(45) Null,
  -- True false statement for here
  PRIMARY KEY (`NurseID`));

  INSERT INTO `Nurses` (`NurseID`, `Surgery_Skills`, `Grade`, `Salary`, `Year_Experience`, `Nurse_Name`, `No_of_Patients`, `Surgery_Inpatient`),
  VALUES
  (1234, 'Suction', 3, '45k', 6, 'Jane Austen', 3, 'Surgery'),
  (3456, 'Anesthesia', 4, '60k', 3, 'Adam Black', 2, 'Surgery'),
  (4567, NULL, 2, '45k', 2, 'Alice Ronan', 3, 'InPatient'),
  (5678, NULL, 3, '50k', 1, 'Anna Rigby', 4, 'InPatient');

DROP TABLE IF EXISTS `Surgeon`;
CREATE TABLE `Newark_Medical`.`Surgeon` (
  `SurgeonID` INT NOT NULL AUTO_INCREMENT,
  `Surgeon_Name` VARCHAR(45) NULL,
  `Contract_Info` VARCHAR(2000) NULL,
  `Surgery_Skills` VARCHAR(45) NULL,
  `Specialty` VARCHAR(45) NULL);
  PRIMARY KEY (`SurgeonID`));

  INSERT INTO `Surgeon` (`SurgeonID`, `Surgeon_Name`, `Contract_Info`, `Surgery_Skills`, `Specialty`)
  VALUES
  (6543, 'Ronald Weasley', 'This is Ronald Weasley contract information', 'Open-Heart', 'Cardiology'),
  (7654, 'Harry Potter', 'This is Harry Potter contract information', 'Gunshots', 'Trama'),
  (8765, 'Hermine Granger', 'This is Hermine contract information', 'Liver Replacement', 'Replacement Surgery');

DROP TABLE IF EXISTS `Patient_Medical_Data`;
CREATE TABLE `Newark_Medical`.`Patient_Medical_Data` (
  `Medical_Data_ID` INT NOT NULL AUTO_INCREMENT,
  -- Can primary key be patientID?
  `Bloodtype` VARCHAR(45) NULL,
  `Cholesterol` VARCHAR(45) NULL,
  `Allergy_Code` VARCHAR(45) NULL,
  `PatientID` INT NULL,
  `Illness_Code` INT NULL
  `No_of_Illnesses` VARCHAR(45) NULL
  `No_of_Allergies` INT NULL
  PRIMARY KEY (`Medical_Data_ID`));

  INSERT INTO `Patient_Medical_Data` (`Medical_Data_ID`, `Bloodtype`, `Cholesterol`, `Allergy_Code`, `PatientID`,
  `Illness_Code`, `No_of_Illnesses`, `No_of_Allergies`)
  VALUES
  (4567, 'A', '129mg/dL', 3456, 1234, 2345, 2, 3),
  (5678, 'AB', '135mg/DL', 2345, 3456, 4567, 1, 2),
  (6789, 'B', '155mg/DL', 1234, 2345, 1234, 3, 1),
  (8976, 'O', '145mg/DL', 4567, 5678, 3456, 1, NULL);

DROP TABLE IF EXISTS `Location`;
CREATE TABLE `Newark_Medical`.`Location` (
  `Room_No` INT NOT NULL,
  `Nursing_Unit` VARCHAR(45) NULL,
  `Bed_No` INT NULL,
  `PatientID` INT NULL,
  `Date_of_Admission` VARCHAR(45) NULL,
  PRIMARY KEY (`Room_No`));

  INSERT INTO `Location` (`Room_No`, `Nursing_Unit`, `Bed_No`, `PatientID`, `Date_of_Admission`)
  VALUES
  (1, 3, 67, 1234, 'January 1st, 2020'),
  (3, 2, 34, 2345, 'February 7th, 2020'),
  (1, 3, 62, 3456, 'March 1st, 2020');

-- Is there a way to do this on check in and not have a seperate table?
DROP TABLE IF EXISTS `Patient_Type`;
CREATE TABLE `Newark_Medical`.`Patient_Type` (
  `InPatientID` INT NULL,
  `OutPatientID` INT NULL,
  `PatientID` VARCHAR(45) NULL,
  PRIMARY KEY (`EmployeeID`));

DROP TABLE IF EXISTS `Illness`;
CREATE TABLE `Newark_Medical`.`Illness` (
  `Illness_Code` INT NOT NULL AUTO_INCREMENT,
  `PatientID` VARCHAR(45) NULL,
  `Description` VARCHAR(600) NULL,
  `Illness_Name` VARCHAR(75) NULL,
  PRIMARY KEY (`Illness_Code`));

  INSERT INTO `Illness` (`Illness_Code`, `PatientID`, `Description`, `Illness_Name`)
  VALUES
  (1234, 2345, 'This is a description of the liver failure', 'Liver Replacement'),
  (2345, 5678, 'This is a description of illness 2', 'Heart Circulation'),
  (4567, 1234, 'Illness 4 description is here', 'Covid-19'),

DROP TABLE IF EXISTS `Allergy`;
CREATE TABLE `Newark_Medical`.`Allergy` (
  `Allergy_Code` INT NOT NULL AUTO_INCREMENT,
  `Allergy_Name` VARCHAR(45) NULL,
  `Description` VARCHAR(800) NULL,
  `PatientID` INT NULL,
  PRIMARY KEY (`Allergy_Code`));

  INSERT INTO `Allergy` (`Allergy_Code`, `Allergy_Name`, `Description`, `PatientID`)
  VALUES
  (1234, 'Yams', 'Be careful of Yams allergy when cooking.', 1234),
  (2345, 'Apples', 'Do not include apples in cooking.', 2345),
  (1234, 'Yams', 'Do not include Yams in food.', 4567),
  (2345, 'Apples', 'Do not include apples in food.', 3456),
  (3456, 'Penicillin', 'Gets a major rash with this in medication.', 1234);

DROP TABLE IF EXISTS `Surgery`;
CREATE TABLE `Newark_Medical`.`Surgery` (
  `SurgeryID` INT NOT NULL AUTO_INCREMENT,
  `SurgeonID` INT NULL,
  `Surgery_Skills` VARCHAR(75) NULL,
  `Surgery_Time` VARCHAR(45) NULL,
  `PatientID` INT NULL,
  `NurseID` INT NULL,
  `Skill_Code` INT NULL,
  `Surgery_Date` VARCHAR(45) NULL,
  PRIMARY KEY (`SurgeryID`));

  INSERT INTO `Surgery` (`SurgeryID`, `SurgeonID`, `Surgery_Skills`, `Surgery_Time`, `PatientID`, `NurseID`, `Skill_Code`)
  VALUES
  (7777, 4567, 'S.Skill #1', '8am', 1234, 2345, 1234, 'March 10th, 2020'),
  (8888, 1234, 'S.Skill #2', '10am', 2345, 3456, 5678, 'April 1st, 2020'),
  (9999, 3456, 'S.Skill #3', '11am', 3456, 1234, 2345, 'March 8th, 2020');

DROP TABLE IF EXISTS `Surgery_Type`;
CREATE TABLE `Newark_Medical`.`Surgery_Type` (
  `ST_Code` INT NOT NULL AUTO_INCREMENT,
  `Surgery_Category` VARCHAR(75) NULL,
  `Surgery_Frequency` VARCHAR(75) NULL,
  `Surgery_SpecialNeeds` VARCHAR(45) NULL,
  `Anatomical_Location` VARCHAR(75) NULL,
  `Surgery_Skills` VARCHAR(75) NULL,
  PRIMARY KEY (`ST_Code`));

  INSERT INTO `Surgery_Type` (`ST_Code`, `Surgery_Category`, `Surgery_Frequency`, `Surgery_SpecialNeeds`,
  `Anatomical_Location`, `Surgery_Skills`)
  VALUES
  (4545, 'Trauma', '1 per 4 months', 'Emergency Room', 'Leg', 'Gunshot'),
  (5656, 'Trauma', '1 per 6 months', 'Special Need 1', 'Arm', 'Surgery Skill 2'),
  (6767, 'Cardiology', '1 per 2 month', 'Special Need 2', 'Heart', 'Open Heart'),
  (7878, 'Cardiology', '1 per 7 months', 'Special Need 3', 'Heart', 'Surgery Skill 4');

DROP TABLE IF EXISTS `Consultation`;
CREATE TABLE `Newark_Medical`.`Consultation` (
  `Consultation_Type` VARCHAR(100) NOT NULL,
  `PatientID` INT NULL,
  `PhysicianID` INT NULL,
  PRIMARY KEY (`Consultation_Type`));

  INSERT INTO `Consultation` (`Consultation_Type`, `PatientID`, `PhysicianID`)
  VALUES
  ('Introduction Consult', 1234, 9876),
  ('Intermediate Consult', 2345, 8765),
  ('Intro Consult', 3456, 1234);

CREATE TABLE `Newark_Medical`.`Nurse_Qualification` (
  `Specialty` VARCHAR(50) NOT NULL,
  `Surgery_Skills` VARCHAR(45) NULL,
  `NurseID` INT NULL,
  PRIMARY KEY (`Specialty`));

CREATE TABLE `Newark_Medical`.`Surgery_Skills` (
  `Skill_Code` INT NOT NULL AUTO_INCREMENT,
  `SurgeonID` INT NULL,
  `NurseID` INT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Skill_Code`));

CREATE TABLE `Newark_Medical`.`Clinic_Ownership` (
  `OwnerID` INT NOT NULL,
  `Corporation_Name` VARCHAR(45) NULL,
  `Headquarters` VARCHAR(45) NULL,
  `Percentage_Owned` INT NULL,
  PRIMARY KEY (`OwnerID`));

CREATE TABLE `Newark_Medical`.`Medication` (
  `Medication_Code` INT NOT NULL AUTO_INCREMENT,
  `Dosage` VARCHAR(45) NULL,
  `YTD_Usage` VARCHAR(45) NULL,
  `Medication_Name` VARCHAR(45) NULL,
  `PhysicianID` INT NULL,
  `PatientID` INT NULL,
  `Quantity_On_Hand` INT NULL,
  `Frequency` VARCHAR(45) NULL,
  `Unit_Cost` INT NULL,
  `Quantity_On_Order` INT NULL,
  PRIMARY KEY (`Medication_Code`));