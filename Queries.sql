/*
  Airbnb Listings Query Set
  --------------------------
  This script contains SQL queries for exploring and analyzing an Airbnb-style listings database.*/

-- Retrieve listing ID, name, host name, cancellation policy, and price for all listings
SELECT 
  l.id AS listing_id,
  l.name AS listing_name,
  h.host_name,
  c.cancelation_policy,
  l.price
FROM listing l
JOIN host h ON l.host_id = h.host_id
JOIN cancelation_policy c ON l.cancelation_policy_id = c.cancelation_policy_id;

-- Find all listings located specifically in the 'Midtown' neighbourhood
SELECT 
  l.id, l.name, loc.neighbourhood, loc.neighbourhood_group
FROM listing l
JOIN locations loc ON l.location_id = loc.location_id
WHERE loc.neighbourhood = 'Midtown';

-- Get the top 5 listings with the highest review rate number
SELECT 
  l.id, l.name, r.review_rate_number
FROM listing l
JOIN review r ON l.id = r.id
ORDER BY r.review_rate_number DESC
LIMIT 5;

-- Calculate the average listing price grouped by neighbourhood group
SELECT 
  loc.neighbourhood_group,
  ROUND(AVG(l.price), 2) AS avg_price
FROM listing l
JOIN locations loc ON l.location_id = loc.location_id
GROUP BY loc.neighbourhood_group;

-- Display listings that have availability of fewer than 100 days per year
SELECT 
  l.id, l.name, l.availability_365
FROM listing l
WHERE l.availability_365 < 100;


-- Count the total number of listings for each room type
SELECT 
  room_type,
  COUNT(*) AS total_listings
FROM listing
GROUP BY room_type;

--  Find listings priced above the overall average price
SELECT 
  l.id,
  l.name,
  l.price
FROM listing l
WHERE l.price > (
  SELECT AVG(price) FROM listing
);


-- Find hosts who have more listings than the average number of listings per host
SELECT 
  host_id,
  host_name,
  calculated_host_listings_count
FROM host
WHERE calculated_host_listings_count > (
  SELECT AVG(calculated_host_listings_count) FROM host
);
