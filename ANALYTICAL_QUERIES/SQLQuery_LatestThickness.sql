-- Latest Thickness

WITH LatestThickness AS (
	SELECT
		ComponentID,
		Thickness_mm AS CurrentThickness,
		MeasurementDate,
		ROW_NUMBER() OVER(
			PARTITION BY ComponentID
			ORDER BY MeasurementDate DESC
		) AS rn
	FROM UTMeasurement
)
SELECT 
	ComponentID,
	CurrentThickness, 
	MeasurementDate AS LastUTDate
FROM LatestThickness
WHERE rn = 1;