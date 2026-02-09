-- Calculating corrosion rate from the last two UTs
-- If CR becomes negative, corrosion is active
-- If the data is less than two UTs , there is no record

CREATE VIEW vw_CorrosionRate AS
WITH cte AS(
	SELECT 
		ComponentID, 
		Thickness_mm,
		MeasurementTime,
		ROW_NUMBER() OVER(
			PARTITION BY ComponentID
			ORDER BY MeasurementTime DESC
		) AS rn
	FROM UTMeasurement
), 
pair AS(
	SELECT
		c1.ComponentID,
		c1.Thickness_mm AS T1,
		c1.MeasurementTime AS Date1,
		c2.Thickness_mm AS T2,
		c2.MeasurementTime AS Date2
	FROM cte c1
	JOIN cte c2
		ON c1.ComponentID = c2.ComponentID
		AND c1.rn = 1
		AND c2.rn = 2
)
SELECT
	ComponentID,
	(T2 - T1)/
	(DATEDIFF( DAY, Date2, Date1)/ 365.0) AS CorrosionRate_mm_per_year
FROM pair;