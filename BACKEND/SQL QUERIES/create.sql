CREATE DATABASE ALZHEIMER_DETECTOR_DBMS;

USE ALZHEIMER_DETECTOR_DBMS;

-- Create a table to store patient information
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10)
    -- Add other relevant patient information columns
);

-- Create a table to store medical images
CREATE TABLE MedicalImage (
    ImageID INT PRIMARY KEY,
    PatientID INT,
    ImagePath VARCHAR(255),
    ImageData BLOB, -- Assuming images are stored as binary large objects
    CONSTRAINT FK_Patient_Image FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
    -- Add other relevant image information columns
);

-- Create a table to store CNN model parameters
CREATE TABLE CNNModel (
    ModelID INT PRIMARY KEY,
    ModelName VARCHAR(50),
    ArchitectureDescription TEXT,
    TrainingParameters TEXT
    -- Add other relevant model information columns
);

-- Create a table to store classification results
CREATE TABLE ClassificationResult (
    ResultID INT PRIMARY KEY,
    ImageID INT,
    ModelID INT,
    Prediction FLOAT,
    IsAlzheimer BOOLEAN,
    Confidence FLOAT,
    ClassificationDate DATE,
    CONSTRAINT FK_Image_Result FOREIGN KEY (ImageID) REFERENCES MedicalImage(ImageID),
    CONSTRAINT FK_Model_Result FOREIGN KEY (ModelID) REFERENCES CNNModel(ModelID)
    -- Add other relevant result information columns
);