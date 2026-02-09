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
