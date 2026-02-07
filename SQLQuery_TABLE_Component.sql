-- قطعه / جوش

CREATE TABLE Component(
	ComponentID INT IDENTITY(1, 1) PRIMARY KEY,
	EquipmentID INT NOT NULL,
	ComponentName NVARCHAR(100) NOT NULL,
	ComponentType NVARCHAR(50) NULL,
	NominalThickness DECIMAL(10, 2) NULL,

	CONSTRAINT FK_Component_Equipment FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);