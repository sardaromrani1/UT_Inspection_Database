-- Inspection Management Dashboard Core

CREATE OR ALTER VIEW dbo.vw_InspectionPlanning
AS
SELECT
    rl.UnitName,
    rl.LineName,
    rl.EquipmentName,
    rl.ComponentID,
    rl.ComponentType,
    rl.RemainingLife_Years,
    r.ReinspectionDate        AS NextInspectionDate,
    CASE
        WHEN r.ReinspectionDate < GETDATE() THEN 'OVERDUE'
        WHEN DATEDIFF(DAY, GETDATE(), r.ReinspectionDate) <= 90 THEN 'DUE_SOON'
        ELSE 'OK'
    END AS InspectionStatus
FROM dbo.vw_RemainingLife rl
INNER JOIN dbo.UTInspectionEvent ie
    ON rl.ComponentID = ie.ComponentID
INNER JOIN dbo.Reinspection r
    ON ie.InspectionEventID = r.InspectionEventID;