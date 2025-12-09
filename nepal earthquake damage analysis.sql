
-- DISTRIBUTION OF BUILDING DAMAGE ACROSS DISTRICTS 


-- add a district_id column on the building table
ALTER TABLE building
ADD COLUMN district_id int;

-- add a district_id column on the building_damage table
ALTER TABLE building_damage
ADD COLUMN district_id int;

-- disabled safe mode 
set sql_safe_updates = 0;

-- populate the new district_id column on building table with district_id column data from household table
UPDATE building b
INNER JOIN household h 
    ON b.household_id = h.household_id
SET b.district_id = h.district_id;

-- populate the new district_id column on building_damage table with district_id column data from district table
UPDATE building_damage bd
INNER JOIN building b
	on b.building_id = bd.building_id
SET bd.district_id = b.district_id;


-- query the names of district and get the percentage damage with high severity in the district and order in descending order to get the districts that suffered highest percentage of damaged buildings
SELECT 
	d.name,
    COUNT(CASE WHEN bd.severity = 'high' THEN 1 END) * 100.0 / COUNT(*) AS percent_completely_damaged
from building_damage bd
inner join district d
using(district_id)
GROUP BY d.name
ORDER BY percent_completely_damaged DESC;
    
-- -------------------------------------------------------------------------------------------------------------- --




















