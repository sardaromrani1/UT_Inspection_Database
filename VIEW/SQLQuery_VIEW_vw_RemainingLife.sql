-- Calculating Remaining Life

CREATE VIEW vw_RemainingLife AS
SELECT
	ct.UnitName,
	ct.LineName,
	ct.EquipmentName,
	ct.ComponentID,
	ct.ComponentType,
	ct.CurrentThickness,
	ct.AllowableThickness,
	cr.CorrosionRate_mm_per_year,
	CASE
		WHEN cr.CorrosionRate_mm_per_year <= 0 THEN NULL
		ELSE (ct.CurrentThickness - ct.AllowableThickness) / cr.CorrosionRate_mm_per_year
	END AS RemainingLife_Years

FROM vw_CurrentThickness ct
LEFT JOIN vw_CorrosionRate cr
	ON ct.ComponentID = cr.ComponentID;