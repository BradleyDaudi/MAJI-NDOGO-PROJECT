/*TURNING SQL SAFE UPADATE OFF */
SET SQL_SAFE_UPDATES = 0;

UPDATE 
well_pollution
SET
description = 'Bacteria: E. coli'
WHERE
description = 'Clean Bacteria: E. coli';

UPDATE
well_pollution
SET
description ='Bacteria: Giardia Lamblia'
WHERE
description = 'Clean Bacteria: Giardia Lamblia';

UPDATE
well_pollution
SET
results = 'Contaminated: Biological'
WHERE
biological > 0.01 AND results = 'Clean';

/*creating a copy to play with*/
CREATE TABLE
md_water_services.well_pollution_copy
AS (
SELECT
*
FROM
md_water_services.well_pollution
);

UPDATE 
well_pollution_copy
SET
description = 'Bacteria: E. coli'
WHERE
description = 'Clean Bacteria: E. coli';

UPDATE
well_pollution_copy
SET
description ='Bacteria: Giardia Lamblia'
WHERE
description = 'Clean Bacteria: Giardia Lamblia';

UPDATE
well_pollution_copy
SET
results = 'Contaminated: Biological'
WHERE
biological > 0.01 AND results = 'Clean';

/*testing to see if erros still exist*/
SELECT *
FROM md_water_services.well_pollution
WHERE
biological > 0.01
AND description LIKE 'Cl%'
/*AND results NOT LIKE 'Clean%'*/
;

/*ANOTHER ERRONEOUS ERROR CHECK*/
SELECT
*
FROM
well_pollution_copy
WHERE
description LIKE "Clean_%"
OR (results = "Clean" AND biological > 0.01);

DROP TABLE
md_water_services.well_pollution_copy;


