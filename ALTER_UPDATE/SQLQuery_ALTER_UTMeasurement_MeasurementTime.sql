ALTER TABLE UTMeasurement
ADD MeasurementTime DATETIME2 NOT NULL
    CONSTRAINT DF_UTMeasurement_MeasurementTime
    DEFAULT SYSDATETIME();