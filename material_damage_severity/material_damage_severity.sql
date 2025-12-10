

SELECT 
    b.material,
    bd.severity,
    COUNT(b.building_id) AS building_count
FROM building b   
JOIN building_damage bd 
    USING (building_id)
GROUP BY 
    b.material,
    bd.severity
ORDER BY material, severity, building_count desc;
