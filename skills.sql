-- Note: Please consult the directions for this assignment 
-- for the most explanatory version of each question.

-- 1. Select all columns for all brands in the Brands table.

SELECT *
FROM Brands;

-- 2. Select all columns for all car models made by Pontiac in the Models table.

SELECT * 
FROM Models 
WHERE brand_name = 'Pontiac';

-- 3. Select the brand name and model 
--    name for all models made in 1964 from the Models table.

SELECT brand_name, name
FROM Models
WHERE year = 1964;

-- 4. Select the model name, brand name, and headquarters for the Ford Mustang 
--    from the Models and Brands tables.

SELECT Models.brand_name, Models.name, Brands.headquarters 
FROM Models join Brands 
ON (Models.brand_name = Brands.name) 
WHERE Models.name = 'Mustang';

-- 5. Select all rows for the three oldest brands 
--    from the Brands table (Hint: you can use LIMIT and ORDER BY).

SELECT * 
FROM Models 
ORDER BY year 
LIMIT 3;

-- 6. Count the Ford models in the database (output should be a number).

SELECT COUNT(*)
FROM Models
WHERE brand_name = 'Ford';

-- 7. Select the name of any and all car brands that are not discontinued.

SELECT * 
FROM Brands 
WHERE discontinued is NULL;

-- 8. Select rows 15-25 of the DB in alphabetical order by model name.

SELECT * 
FROM Models 
ORDER BY name 
LIMIT 10 OFFSET 15;

-- 9. Select the brand, name, and year the model's brand was 
--    founded for all of the models from 1960. Include row(s)
--    for model(s) even if its brand is not in the Brands table.
--    (The year the brand was founded should be NULL if 
--    the brand is not in the Brands table.)

SELECT Models.brand_name, Models.name, Brands.founded
FROM Models LEFT JOIN Brands ON (Models.brand_name = Brands.name)
WHERE Models.year = 1960;


-- Part 2: Change the following queries according to the specifications. 
-- Include the answers to the follow up questions in a comment below your
-- query.

-- 1. Modify this query so it shows all brands that are not discontinued
-- regardless of whether they have any models in the models table.
-- before:
    SELECT b.name,
           b.founded,
           m.name
    FROM Brands AS b
      LEFT JOIN Models AS m
        ON b.name = m.brand_name
    WHERE b.discontinued IS NULL;

-- 2. Modify this left join so it only selects models that have brands in the Brands table.
-- before: 
    SELECT m.name,
           m.brand_name,
           b.founded
    FROM Models AS m
      INNER JOIN Brands AS b
        ON b.name = m.brand_name;

-- followup question: In your own words, describe the difference between 
-- left joins and inner joins.

-- Inner joins: join two tables along some attribute, ignoring
-- the records that are in one table but not another (intersection)
-- Left join: include the records that have a value in the left
-- table, but no value in the right table 


-- 3. Modify the query so that it only selects brands that don't have any models in the models table. 
-- (Hint: it should only show Tesla's row.)
-- before: 

    SELECT Brands.name
    FROM Brands
      LEFT JOIN Models
        ON brands.name = Models.brand_name
    WHERE Models.name is NULL;

-- 4. Modify the query to add another column to the results to show 
-- the number of years from the year of the model until the brand becomes discontinued
-- Display this column with the name years_until_brand_discontinued.
-- before: 

    SELECT b.name,
           m.name,
           m.year,
           b.discontinued,
           b.discontinued-m.year AS years_until_brand_discontinued
    FROM Models AS m
      LEFT JOIN brands AS b
        ON m.brand_name = b.name
    WHERE b.discontinued NOT NULL;



-- Part 3: Further Study

-- 1. Select the name of any brand with more than 5 models in the database.

-- 2. Add the following rows to the Models table.

-- year    name       brand_name
-- ----    ----       ----------
-- 2015    Chevrolet  Malibu
-- 2015    Subaru     Outback

-- 3. Write a SQL statement to crate a table called `Awards`
--    with columns `name`, `year`, and `winner`. Choose
--    an appropriate datatype and nullability for each column
--   (no need to do subqueries here).

-- 4. Write a SQL statement that adds the following rows to the Awards table:

--   name                 year      winner_model_id
--   ----                 ----      ---------------
--   IIHS Safety Award    2015      the id for the 2015 Chevrolet Malibu
--   IIHS Safety Award    2015      the id for the 2015 Subaru Outback

-- 5. Using a subquery, select only the *name* of any model whose 
-- year is the same year that *any* brand was founded.





