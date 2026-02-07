-- Calculation of corrosion rate

-- Corrosion Rate = (Thickness_old - Thickness_new) / time

WITH ThicknessHistory AS (
	SELECT
		c.ComponentID,
		c.ComponentName,
		i.InspectionDate,
		m.Thickness,
		LAG (m.Thickness) OVER(
			PARTITION BY c.ComponentID
			ORDER BY i.InspectionDate
		) AS PrevDate
	FROM UTMeasurement m 
	JOIN UTInspectionEvent i ON m.InspectionEventID = i.InspectionEventID
	JOIN Component c ON i.ComponentID = c.ComponentID
)

SELECT 
	ComponentName,
	InspectionDate,
	ROUND (
		( PrevThickness - Thickness ) /
		(DATEDIFF (DAY, PrevDate, InspectionDate)/ 365.0),
		3
	) AS CorrosionRate_mm_per_year
FROM ThicknessHistory
WHERE PrevThickness IS NOT NULL;