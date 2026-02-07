-- Reinspection

CREATE TABLE Reinspection(
	ReinspectionID INT IDENTITY(1,1) PRIMARY KEY,
	RepairID INT NOT NULL,
	InspectionEventID INT NOT NULL,
	ReinspectionDate DATETIME2 NOT NULL,

	CONSTRAINT FK_Reinspection_Repair FOREIGN KEY (RepairID) REFERENCES Repair(RepairID),

	CONSTRAINT FK_Reinspection_Inspection FOREIGN KEY (InspectionEventID) REFERENCES UTInspectionEvent(InspectionEventID)

);