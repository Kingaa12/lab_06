CREATE DATABASE patient_db;
CREATE TABLE Patients (
patientID SERIAL PRIMARY KEY,
firstname VARCHAR(50),
lastname VARCHAR(50),
birthdate DATE,
smoker BOOLEAN,
gender CHAR(1));
CREATE TABLE MedicalLogs (
patientID INT,
date DATE,
title VARCHAR(100),
description TEXT,
PRIMARY KEY (patientID, date, title),
FOREIGN KEY (patientID) REFERENCES Patients(patientID)
);
INSERT INTO Patients (patientID, firstname, lastname, birthdate, smoker, gender) VALUES
(100, 'John', 'Doe', '1980-01-01', false, 'M'), (200, 'Jane', 'Doe', '1982-02-02', true, 'F');
INSERT INTO MedicalLogs (patientID, date, title, description) VALUES (100, '2023-01-01', 'Annual Checkup', 'Complete physical examination. All results normal.'),(100, '2023-02-15', 'Follow-up', 'Discussion of exercise benefits. No issues.'),(200, '2023-03-03', 'Routine Checkup', 'Routine health checkup. Advised to reduce smoking.');

UPDATE MedicalLogs SET description = 'Annual checkup results normal. Recommended dietary adjustments.'WHERE patientID = 100 AND date = '2023-01-01' AND title = 'Annual Checkup';
UPDATE 1

DELETE FROM MedicalLogs WHERE patientID = 100 AND date = '2023-02-15' AND title = 'Follow-up';

\COPY Patients(patientID, firstname, lastname, birthdate, smoker, gender) FROM '/home/dan/web2/lab6/SectionA/patients.csv' DELIMITER ',' CSV HEADER;

\copy MedicalLogs(patientID, date, title, description) FROM '/home/dan/web2/lab6/SectionA/medical_logs.csv' DELIMITER ',' CSV HEADER;