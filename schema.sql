/*
  Airbnb Listings Database Schema
  --------------------------------
  This schema defines the structure for an Airbnb-style listings database.
  It includes tables for hosts, locations, listings, cancellation policies, and reviews.*/

-- Drop existing tables if needed (run with caution)
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS listing;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS host;
DROP TABLE IF EXISTS cancellation_policy;

---Table to store different cancelation policy types
CREATE TABLE cancelation_policy (
  cancelation_policy_id INT PRIMARY KEY,
  cancelation_policy TEXT
);

--- Table to store host-related information.
CREATE TABLE host (
  host_id INT PRIMARY KEY,
  host_identity_verified BOOLEAN,
  host_name TEXT,
  calculated_host_listings_count INT CHECK (calculated_host_listings_count >= 0)
);

--- Table to store geographical details of listings.
CREATE TABLE locations (
  location_id INT PRIMARY KEY,
  neighbourhood_group TEXT,
  neighbourhood TEXT,
  country TEXT,
  lat DECIMAL(9, 6),
  long DECIMAL(9, 6)
);

--- Main table for Airbnb listings.
CREATE TABLE listing (
  id INT PRIMARY KEY,
  name TEXT,
  host_id INT,
  room_type TEXT,
  location_id INT,
  cancellation_policy_id INT,
  construction_year INT,
  price DECIMAL(10, 2),
  service_fee DECIMAL(10, 2),
  minimum_nights INT,
  availability_365 INT CHECK (availability_365 BETWEEN 0 AND 365),
  house_rules TEXT,
  license TEXT,
  FOREIGN KEY (host_id) REFERENCES host(host_id),
  FOREIGN KEY (location_id) REFERENCES locations(location_id),
  FOREIGN KEY (cancelation_policy_id) REFERENCES cancelation_policy(cancellation_policy_id)
);

-- Table to store review information for each listing.
CREATE TABLE review (
  id INT PRIMARY KEY,
  number_of_reviews INT,
  last_review DATE,
  reviews_per_month DECIMAL(4, 2),
  review_rate_number INT CHECK (review_rate_number BETWEEN 1 AND 5),
  FOREIGN KEY (id) REFERENCES listing(id)
);
