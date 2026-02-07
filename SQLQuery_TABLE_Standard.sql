-- Standards

CREATE TABLE Standard(
	StandardID INT IDENTITY(1, 1) PRIMARY KEY,
	StandardCode NVARCHAR(50) NOT NULL,
	Description NVARCHAR(255) NULL
);