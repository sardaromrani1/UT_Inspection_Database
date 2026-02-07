-- Identifying areas in need of repair

SELECT
	c.ComponentName,
	i.InspectionDate,
	m.Thickness, 
	m.Status
FROM UTMeasurement m 
JOIN UTInspectionEvent i ON m.InspectionEventID = i.InspectionEventID
JOIN Component c ON i.ComponentID = c.ComponentID
WHERE m.Status = 'Repair';