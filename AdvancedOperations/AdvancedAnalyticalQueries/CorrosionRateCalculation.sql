-- 1. Advanced Analytical Queries (Engineering-Grade)

-- A. Corrosion Rate Calculation (Window Functions)

-- Practical for remaining life and fitness_for_service
WITH UT_History AS (
	SELECT
		ComponentID,
		MeasurementTime,
		Thickness_mm,
		LAG (Thickness_mm) OVER (
			PARTITION BY ComponentID
			ORDER BY MeasurementTime
		) AS PrevDate
	FROM UTMeasurement
)

SELECT 
	ComponentID,
	MeasurementTime,
	( PrevThickness - Thickness_mm ) / NULLIF (DATEDIFF (DAY, PrevDate, MeasurementTime) / 365.25, 0) AS CorrosionRate_mm_per_year
FROM UT_History
WHERE PrevThickness IS NOT NULL;