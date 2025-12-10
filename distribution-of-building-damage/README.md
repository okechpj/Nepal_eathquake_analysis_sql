# Distribution of Building Damage Across Districts

This analysis identifies which districts suffered the highest percentage of severely damaged (high-severity) buildings based on the building, building_damage, household, and district tables.

## Objective

Determine the proportion of buildings classified as high severity damage within each district and rank districts from most to least affected.

## Method

1. Added district_id to the building and building_damage tables.

2. Populated the new columns by joining:

    building → household (to inherit district)

    building_damage → building (to inherit district)

3. Calculated:

    Number of high-severity buildings per district

    Percentage of high-severity buildings out of all buildings in that district

4. Ordered results in descending order to highlight the most impacted districts.

## Findings

Districts at the top of the output list have the highest percentage of severely damaged buildings.

Districts lower in the ranking experienced comparatively less structural impact.

Percentages reflect relative severity, not total building count, making the comparison consistent across districts.

## Notes

The analysis assumes severity = 'high' represents complete or near-complete structural damage.

Ensure that severity values are consistently recorded to avoid skewed percentages.
