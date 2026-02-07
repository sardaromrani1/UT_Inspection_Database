-- 2021 Measurements

INSERT INTO UTMeasurement (InspectionEventID, MeasurementLocation, Thickness, Status)
VALUES
(1, 'Top', 12.5, 'OK'),
(2, 'Top', 12.4, 'OK'),
(3, 'Top', 12.6, 'OK');


-- 2023 Measurements

INSERT INTO UTMeasurement (InspectionEventID, MeasurementLocation, Thickness, Status)
VALUES
(4, 'Top', 12.1, 'Monitor'),
(5, 'Top', 11.9, 'Monitor'),
(6, 'Top', 12.0, 'OK');


-- 2025 Measurements

INSERT INTO UTMeasurement (InspectionEventID, MeasurementLocation, Thickness, Status)
VALUES
(7, 'Top', 11.3, 'Repair'),
(8, 'Top', 11.2, 'Repair'),
(9, 'Top', 11.4, 'Repair');