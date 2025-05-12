# Airbnb Listings SQL Analysis

##  Overview

This project contains SQL scripts for exploring and analysing an Airbnb-style listings database. The database captures information about hosts, property listings, locations, cancellation policies, and reviews.

The queries demonstrate filtering, aggregation, subqueries, and joins.

---

## Files

- `schema.sql` – Defines the database structure (tables and relationships).
- `queries.sql` – Contains exploratory and analytical SQL queries.
- `load_data.sql`- contains loading data in SQL.
- data files include cancelation.csv, host.csv, listing.csv, location.csv, review.csv


---

##  Database Structure

The schema consists of the following tables:

- `listing` – Main table with property details.
- `host` – Information about each property host.
- `locations` – Geographic and neighbourhood details.
- `cancelation_policy` – Types of cancellation policies.
- `review` – Aggregated review data for each listing.


Each listing is linked to:
- One host
- One location
- One cancellation policy
- One review record (aggregated)


