/*
  Airbnb Listings - PostgreSQL Data Load Script
  ---------------------------------------------
  This script loads Airbnb dataset tables using COPY from CSV files.
*/

-- LOAD DATA FROM CSV FILES
-- Load data into the cancelation_policy table from the cancelation.csv file
COPY cancelation_policy(cancelation_policy_id, cancelation_policy)
FROM './data/cancelation.csv'
DELIMITER ','
CSV HEADER;

-- Load data into the host table from the host.csv file
COPY host(host_id, host_identity_verified, host_name, calculated_host_listings_count)
FROM './data/host.csv'
DELIMITER ','
CSV HEADER;

-- Load data into the locations table from the location.csv file
COPY locations(location_id, neighbourhood_group, neighbourhood, country, lat, long)
FROM './data/location.csv'
DELIMITER ','
CSV HEADER;

-- Load data into the listing table from the listing.csv file
COPY listing(id, name, host_id, room_type, location_id, cancelation_policy_id,
construction_year, price, service_fee, minimum_nights,
availability_365, house_rules, license)
FROM './data/listing.csv'
DELIMITER ','
CSV HEADER;


-- Load data into the review table from the review.csv file
COPY review(id, number_of_reviews, last_review, reviews_per_month, review_rate_number)
FROM './data/review.csv'
DELIMITER ','
CSV HEADER;

-- Insert sample listings into the listing table
INSERT INTO listing VALUES
(
  1001254,
  'Clean & quiet apt home by the park',
  80014485718,
  'Private room',
  1,
  1,
  2020,
  966,
  193,
  10,
  286,
  'Clean up and treat the home the way you''d like your home to be treated. No smoking.',
  NULL
),
(
  1002102,
  'Skylit Midtown Castle',
  52335172823,
  'Entire home/apt',
  2,
  2,
  2007,
  142,
  28,
  30,
  228,
  'Pet friendly but please confirm with me if the pet you are planning on bringing with you is OK. I have a cute and quiet mixed chihuahua. I could accept more guests (for an extra fee) but this also needs to be confirmed beforehand. Also friends traveling together could sleep in separate beds for an extra fee (the second bed is either a sofa bed or inflatable bed). Smoking is only allowed on the porch.',
  NULL
);

-- Insert sample data into the locations table
INSERT INTO locations  VALUES
(
  1,
  'Brooklyn',
  'Kensington',
  'United States',
  40.64749,
  -73.97237
),
(
  2,
  'Manhattan',
  'Midtown',
  'United States',
  40.75362,
  -73.98377
);

-- Insert sample data into the host table
INSERT INTO host VALUES
(
  80014485718,
  0, -- unconfirmed (use 0 for BIT in SQL Server)
  'Madaline',
  6
),
(
  52335172823,
  1, -- verified (use 1 for BIT in SQL Server)
  'Jenna',
  2
);

-- Insert sample data into the review table
INSERT INTO review VALUES
(
  1001254,
  9,
  '2021-10-19',
  0.21,
  4
),
(
  1002102,
  45,
  '2022-05-21',
  0.38,
  4
);

-- Insert sample data into the cancelation_policy table
INSERT INTO cancelation_policy (
  cancelation_policy_id, cancelation_policy
) VALUES
(1, 'strict'),
(2, 'moderate'),
(3, 'flexible');