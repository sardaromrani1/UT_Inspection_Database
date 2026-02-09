-- Analysis of the impact of repairs

CREATE VIEW vw_RepairImpact AS
SELECT
	c.ComponentID,
	e.EquipmentName,
	r.RepairType,
	r.RepairDate,
	r.PostRepairThickness,
	v.CurrentThickness,
	(r.PostRepairThickness - v.CurrentThickness) AS ThicknessGain
FROM Repair r
JOIN Component c ON r.ComponentID = c.ComponentID
JOIN Equipment e ON c.EquipmentID = e.EquipmentID
JOIN vw_LastUTMeasurement v ON c.ComponentID = v.ComponentID;