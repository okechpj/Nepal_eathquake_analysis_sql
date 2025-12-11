
-- Population displacement 
select 
	bd.severity,
    sum(h.members) as total_population_displaced
from building_damage bd
join household h using(household_id)
group by bd.severity;

