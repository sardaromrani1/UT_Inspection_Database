-- Inspection UT

CREATE TABLE Inspector(
	InspectorID INT IDENTITY(1, 1) PRIMARY KEY,
	InspectorName NVARCHAR(100) NOT NULL,
	Certification NVARCHAR(50) NULL
);