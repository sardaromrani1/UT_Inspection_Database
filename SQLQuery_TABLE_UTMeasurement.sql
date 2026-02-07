-- Thickness Measurement

CREATE TABLE UTMeasurement(
	MeasurementID INT IDENTITY(1, 1) PRIMARY KEY,
	InspectionEventID INT NOT NULL,
	MeasurementLocation NVARCHAR(50) NULL,	-- Measurement Point
	Thickness DECIMAL(10, 2) NOT NULL,
	Status NVARCHAR(20) NULL,	-- OK / Monitor / Repair

	CONSTRAINT FK_Measurement_Inspection FOREIGN KEY (InspectionEventID) REFERENCES UTInspectionEvent (InspectionEventID)

	);