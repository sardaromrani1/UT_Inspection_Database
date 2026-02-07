-- Repair

CREATE TABLE Repair(
	RepairID INT IDENTITY(1, 1) PRIMARY KEY,
	ComponentID INT NOT NULL,
	RepairDate DATETIME2 NOT NULL,
	Description NVARCHAR(255) NULL,

	CONSTRAINT FK_Repair_Component FOREIGN KEY (ComponentID) REFERENCES Component (ComponentID)
);