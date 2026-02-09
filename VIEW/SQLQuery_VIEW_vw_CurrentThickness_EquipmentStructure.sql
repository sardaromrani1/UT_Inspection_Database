-- Connecting the current thickness to the equipment structure
USE UT_DATABASE;
GO

CREATE VIEW vw_CurrentThickness AS
SELECT
    u.UnitName,
    l.LineName,
    e.EquipmentName,
    c.ComponentID,
    c.ComponentType,
    v.CurrentThickness,
    c.AllowableThickness,
    v.LastUTDate
FROM vw_LastUTMeasurement v  -- <- add dbo schema
JOIN Component c ON v.ComponentID = c.ComponentID
JOIN Equipment e ON c.EquipmentID = e.EquipmentID
JOIN Line l ON e.LineID = l.LineID
JOIN Unit u ON l.UnitID = u.UnitID;