# Vehicle Rental Management System - SQL Project

## 📌 Project Overview
This project manages a vehicle rental system's database, focusing on user bookings, vehicle availability, and performance tracking. It uses relational database principles to ensure data integrity and efficient querying.

## 🛠️ Database Queries Explained

### 1. Comprehensive Booking Details (JOIN)
**Purpose:** Combines data from Users, Vehicles, and Bookings to provide a readable report.
- Uses `INNER JOIN` to link tables via `user_id` and `vehicle_id`.
- Provides a clear view of who rented which vehicle and for how long.

### 2. Identification of Unused Assets (EXISTS)
**Purpose:** Finds vehicles that have never been booked.
- Uses the `NOT EXISTS` operator with a correlated subquery.
- This is more efficient than a `LEFT JOIN` for checking existence in large datasets.

### 3. Inventory Filtering (WHERE)
**Purpose:** Lists all cars that are currently available for immediate rent.
- Filters by multiple conditions: `status = 'available'` and `type = 'car'`.

### 4. Popular Vehicle Analysis (GROUP BY & HAVING)
**Purpose:** Identifies "High-Demand" vehicles that have been booked more than twice.
- Uses `GROUP BY` to aggregate booking counts per vehicle.
- Uses `HAVING` to filter results after the aggregation is calculated.