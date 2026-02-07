-- Main Equipments

CREATE TABLE Equipment(
	EquipmentID INT IDENTITY(1,1) PRIMARY KEY,
	LineID INT NOT NULL,
	EquipmentName NVARCHAR(100) NOT NULL,
	EquipmentType NVARCHAR(50) NULL,
	CONSTRAINT FK_Equipment_Line FOREIGN KEY (LineID) REFERENCES Line(LineID)
);

