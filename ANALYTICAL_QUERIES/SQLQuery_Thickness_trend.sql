-- Thickness trend of each component over time

SELECT 
	c.ComponentName,
	i.InspectionDate,
	m.Thickness

FROM UTMeasurement m

JOIN UTInspectionEvent i ON m.InspectionEventID = i.InspectionEventID

JOIN Component c ON i.ComponentID = c.ComponentID

ORDER BY c.ComponentName, i.InspectionDate;