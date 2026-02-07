-- Inspection Event UT

CREATE TABLE UTInspectionEvent(
	InspectionEventID INT IDENTITY(1, 1) PRIMARY KEY,
	ComponentID INT NOT NULL,
	InspectorID INT NOT NULL,
	StandardID INT NOT NULL,
	InspectionDate DATETIME2 NOT NULL,
	Method NVARCHAR(50) NULL, -- Ex. : Pulse-Echo, TOFD

	CONSTRAINT FK_Inspection_Component FOREIGN KEY (ComponentID) REFERENCES Component (ComponentID),

	CONSTRAINT FK_Inspection_Inspector FOREIGN KEY (InspectorID) REFERENCES Inspector (InspectorID),

	CONSTRAINT FK_Inspection_Standard FOREIGN KEY (StandardID) REFERENCES Standard (StandardID)
);