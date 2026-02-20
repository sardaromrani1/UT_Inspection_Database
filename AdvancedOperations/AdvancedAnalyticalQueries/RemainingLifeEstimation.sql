-- 1. Advanced Analytical Queries (Engineering-Grade)

-- B. Remaining Life Estimation

-- Deetect input to inspection planning

SELECT
	c.ComponentID,
	c.CurrentThickness_mm,
	c.AllowableThickness,
	cr.CorrosionRate_mm_per_year,
	( c.CurrentThickness_mm - c.AllowableThickness ) / NULLIF (cr.CorrosionRate_mm_per_year, 0) AS RemainingLife_Years
FROM Component c
JOIN vw_CorrosionRate cr ON c.ComponentID = cr.ComponentID;