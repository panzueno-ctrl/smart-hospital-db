# Smart Hospital Management System - Database Architecture

## 📌 Overview
This project presents the complete database architecture for a modern, AI-integrated Hospital Information System (HIS). Developed as part of the Database and Information Systems coursework at Università degli Studi del Piemonte Orientale, it models the entire clinical workflow: from patient registration and appointment scheduling to examinations, reporting, and final diagnosis validation. 

The architecture is designed to be highly normalized, robust, and capable of handling complex business rules, including AI-assisted diagnostic tracking and strict data privacy consents.

## ⚙️ Core Features & Business Logic
- **End-to-End Clinical Pathway:** Models the complete patient journey (Booking → Visit → Exam → Report → Diagnosis) with historical clinical case tracking.
- **AI-Assisted Diagnostics Module:** Features a dedicated schema to track AI-generated diagnostic suggestions, including confidence levels, model versions, and the attending physician's final decision (Accept/Reject/Modify).
- **Advanced Scheduling & Resource Management:** Implements strict constraint-based logic to manage medical staff and ambulatory slots, preventing double-booking and handling waiting lists.
- **Security & Audit Logging:** Incorporates role-based access control (Admin, Technician, Doctor, Auditor) and a comprehensive audit trail (Log table) recording all CRUD operations for compliance.
- **Consent Management:** Granular tracking of patient consents regarding standard privacy and the explicit use of Artificial Intelligence on medical data.

## 🛠️ Technical Highlights & Database Design
- **Entity-Relationship Modeling:** Transitioned from a complex conceptual ER schema to a fully normalized logical relational model, resolving N:M relationships and cyclical dependencies.
- **Advanced SQL Implementation:** 
  - Utilized **Surrogate Keys** across all tables for absolute stability and performance.
  - Implemented **Composite CHECK Constraints** to enforce strict business rules directly at the database level (e.g., ensuring role-based referential integrity without generalisation tables).
  - Resolved **Circular Dependencies** (e.g., Department vs. Head Physician) using deferred constraint additions via `ALTER TABLE`.
- **Comprehensive DDL & DML:** Includes complete deployment scripts (`DDL`), representative data population (`DMLPOP`), and real-world operational update simulations (`DMLUPD`).

## 📂 Project Structure
- `Assandri_Mfumu_Rabichi_DDL.sql`: Database schema creation, tables, primary/foreign keys, and complex constraints.
- `Assandri_Mfumu_Rabichi_DMLPOP.sql`: Insertion scripts to populate the database with realistic, interconnected sample data testing edge cases.
- `Assandri_Mfumu_Rabichi_DMLUPD.sql`: Update scripts simulating daily hospital operations (confirming appointments, closing visits, validating diagnoses).
- `Assandri_Mfumu_Rabichi_Relazione.pdf`: Complete technical documentation including Conceptual ER Diagrams, Logical Design, and Data Dictionaries (in Italian).

## 👨‍💻 Contributors
- **Enoch Panzu Mfumu** 
- **Andrea Assandri**
- **Fouad Rabichi**
