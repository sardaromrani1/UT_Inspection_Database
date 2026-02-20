## UT Inspection Database ( SQL Server )

## Project Overview
This repository contains a SQL Server-based relational database designed for managing Ultrasonic Thickness (UT) Inspection data in industrial environments such as gas refineries, petrochemical 
plants, and process facilities.
The database models real inspection workflows, including:
* Plant hierarchy (Unit > Line > Equipment > Component)
* UT inspection events and measurements
* Inspectors and applicable standards
* Repairs, re-inspections, and historical thickness data
* Engineering calculations such as current thickness, remaining life, and inspection planning

The repository is intended for:
* Inspection engineers
* Integrity management teams
* Data analysts
* SQL learners working with real-world engineering data


## Database Purpose
The main goals of this database are:
* Centralized storage of UT inspection data
* Traceability of thickness measurements over time
* Support of corrosion monitoring and RBI-style analysis
* Enabling analyical queries and dashboards
* Serving as a learning / reference project for SQL Server database design in inspection engineering


## Repository Structure
UT_Inspection_Database/
|
|--SQLQueery_TABLE_*.sql        # Core table creation scripts
|
|--INSERT/                      # Sample / initial data insert scripts
|
|--ALTER_UPDATE/                # Schema updates and alterations
|
|--VIEW/                        # SQL Server views (business & analytical logic)
|
|--ANALYTICAL_QUERIES/          # Reporting and analysis queries
|
-- README.md


## Key Folders Explained
* TABLE scripts: Define the core relational schema
* INSERT: Populate lookup tables or sample inspection data
* VIEW: Encapsulate engineering logic (e.g. current thickness, remaining life, overdue inspections)
* ANALYTICAL_QUERIES: Example queries for trend analysis and inspection planning


## Core Database Tables
Plant and Asset Hierarchy
* Unit
* Line
* Equipment
* Component

Inspection & Measurement
* UTInspectionEvent
* UTMeasurement
* Inspector
* Standard

Integrity Actions
* Repair
* Reinspection

Each table is designed with primary keys, foreign keys, and engineering-oriented attributes (thickness, dates, standards, etc.).


## SQL Views (VIEW Folder)
The VIEW folder contains derived logic and calculations implemented as SQL Server views.
Typical views include:
* Current thickness per component
* Last UT measurement date
* Reaining life estimation
* Inspection planning (overdue / due soon)

These views are designed to:
* Simplify reporting
* Encapsulate complex joins
* Act as data sources for dashboards (Power BI, Excel, etc.)


## Engineering Concepts Used
* t_current: Latest measured thickness from UT data
* t_min / allowable thickness: Minimum acceptable thickness
* Remaining Life:
  Remaining Life (years) = (t_current - t_min) / Corrosion Rate
* Inspection Status
  * OVERDUE
  * DUE SOON
  * OK


## How to Run the Project
Prerequisites
  * Microsoft SQL Server 2019 or later (Express is sufficient)
  * SQL Server Management Stuio (SSMS)

Setup Steps
1. Clone the repository:
   git clone https://github.com/sardaromrani1/UT_Inspection_Database.git
2. Open SSMS and create an empty database:
   CREATE DATABASE UT_DATABASE;
3. Run scripts in the following order:
4. SQLQuery_TBLE_*.sql (tables)
5. INSERT/*.sql (Initial data)
6. ALTER_UPDATE/*.sql (schema changes, if any)
7. VIEW/*.sql (views)
8. ANALYTICAL_QUERIES/*.sql (optional)


## Example Usage

-- Get the current thickness and remaining life
SELECT *
FROM VW_CurrentThickness;

-- Find overdue inspections
SELECT *
FROM VW_InspectionPlanning
WHERE InspectionStatus = 'OVERDUE';

These queries can be directly consumed by:
* Power BI
* Excel
* Custom dashboards



## Extensibility

This project can be extended with:
* Stored procedures for inspection entry
* Triggers for audit logging
* NoSQL integration (e.g., Neo4j for asset relationships)
* REST APIs (Django / .NET)
* RBI-based risk scoring


## Learning Value
This repository demonstrates
* Real-world SQL Server schema design
* Engineering data modeling
* Use of views for analytical abstraction
* Inspection & asset integrity workflows



## Author
Sardar Omrani
Maintenance & Inspection Data Specialist
Background: UT Inspection, Asset Integrity, SQL, Data Analysis


## License
This project is provided for educational and professional demonstration purposes.
You are free to use and adapt it with attribution.


## Contributions
Contributions, suggestions, and improvements are welcome. Feel free to open an issue or submit a pull request.
