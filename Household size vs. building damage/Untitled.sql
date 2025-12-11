
-- Household size vs. building damage

select avg(members) from household;

ALTER TABLE building_damage
ADD COLUMN household_id int;

UPDATE building_damage bd
INNER JOIN household h 
    ON bd.district_id = h.district_id
SET bd.household_id = h.household_id;

select * from building_damage;



WITH severity_avg AS (
    SELECT 
        bd.severity,
        AVG(h.members) AS avg_members
    FROM building_damage bd
    JOIN household h USING (household_id)
    GROUP BY bd.severity
)
SELECT 
    bd.severity,
    SUM(
        CASE 
            WHEN h.members >= sa.avg_members THEN 1 
            ELSE 0 
        END
    ) AS population_above_avg,
    SUM(
		CASE
			WHEN h.members <= sa.avg_members THEN 1
            ELSE 0
		END
	) AS population_below_avg
FROM building_damage bd
JOIN household h USING (household_id)
JOIN severity_avg sa USING (severity)
GROUP BY bd.severity;


