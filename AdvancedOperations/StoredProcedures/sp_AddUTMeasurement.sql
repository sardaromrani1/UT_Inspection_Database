-- 3. Stored Procedures (Operational Automation)

-- A. Register New UT Inspection (Transaction-Safe)

-- Used by CMMS / Inspection apps
CREATE PROCEDURE sp_AddUTMeasurement
	@ComponentID INT,
	@Thickness_mm DECIMAL(6, 2),
	@InspectorID INT,
	@MeasurementDate DATE
AS
BEGIN
	BEGIN TRAN;
	INSERT INTO UTMeasurement(...)
	VALUES (...);

	UPDATE Component
	SET CurrentThickness_mm = @Thickness_mm,
		LastInspectionDate = @MeasurementDate
	WHERE ComponentID = @ComponentID;

	COMMIT;
END;