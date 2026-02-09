USE UT_DATABASE;
GO

CREATE OR ALTER VIEW dbo.vw_CurrentThickness AS
SELECT
    u.UnitName,
    l.LineName,
    e.EquipmentName,
    c.ComponentID,
    c.ComponentType,
    v.CurrentThickness_mm AS CurrentThickness,
    c.AllowableThickness,
    v.LastUTDate
FROM dbo.vw_LastUTMeasurement v
JOIN Component c ON v.ComponentID = c.ComponentID
JOIN Equipment e ON c.EquipmentID = e.EquipmentID
JOIN Line l ON e.LineID = l.LineID
JOIN Unit u ON l.UnitID = u.UnitID;
GO