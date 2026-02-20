-- 4. Triggers (Data Integrity & Engineering Rules)

-- Prevent Ultrasonic Thickness Values

-- Prevents bad field data
CREATE TRIGGER trg_ValidateUT
ON UTMeasurement
AFTER INSERT
AS 
BEGIN
	IF EXISTS(
		SELECT 1
		FROM inserted i
		JOIN Component c ON i.ComponentID = c.ComponentID
		WHERE i.Thickness_mm > c.NominalThickness
	)
	BEGIN 
		ROLLBACK;
		THROW 50001, 'Thickness exceeds nominal value', 1;
	END
END;