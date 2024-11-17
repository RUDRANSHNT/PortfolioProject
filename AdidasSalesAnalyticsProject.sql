/* Adidas Sales Data Exploration and Market Analysis */

--  1. The Dataset
SELECT *
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset

-- 2. Understanding Dataset Columns

-- List of Retailers
SELECT DISTINCT(Retailer)
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset

-- List of Regions
SELECT DISTINCT(Region)
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset

-- List of States
SELECT DISTINCT(State)
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset

-- List of Cities
SELECT DISTINCT(City)
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset

-- Product Categories
SELECT DISTINCT(Product)
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset

-- Sales Method
SELECT DISTINCT(Sales_Method)
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset

-- Count of Cities by State
SELECT DISTINCT(State), COUNT(DISTINCT(City)) NumberOfCities
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY State

-- For the following queries we can do the analysis retailer centric and location centric ie by location as well
-- Operating Profit = Total Sales - (Operating Expenses + Cost of Goods Sold + Depreciation and Amortization)

/*Retailers with Highest Total Sales */
SELECT Retailer,'$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer
ORDER BY SUM(Total_Sales) DESC

-- Retailers with highest total sales by region
SELECT Retailer, Region,'$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Region
ORDER BY SUM(Total_Sales) DESC

-- Retailers with the highest total sales by state
SELECT Retailer, State,'$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, State
ORDER BY SUM(Total_Sales) DESC

-- Retailers with the highest total sales by city
SELECT Retailer, City,'$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, City
ORDER BY SUM(Total_Sales) DESC

/* Retailers with Highest Operating Profit */
SELECT Retailer, '$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer
ORDER BY OperatingProfit DESC

-- Retailers with the highest total operating profit by region 
SELECT Retailer, Region, '$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Region
ORDER BY SUM(Operating_Profit) DESC

-- Retailers with the highest total operating profit by state
SELECT Retailer, State, '$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ '+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, State
ORDER BY SUM(Operating_Profit) DESC

-- Retailers with the highest total operating profit by city
SELECT Retailer, City, '$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, City
ORDER BY SUM(Operating_Profit) DESC

/* Retailers with the Highest Operating Expenses */
SELECT Retailer, '$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer
ORDER BY SUM(Total_Sales) - SUM(Operating_Profit) DESC

-- Retailers with the highest Operating Expenses by region
SELECT Retailer, Region,'$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Region
ORDER BY SUM(Total_Sales) - SUM(Operating_Profit) DESC

-- Retailers with the highest Operating Expenses by State
SELECT Retailer, State,'$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, State
ORDER BY SUM(Total_Sales) - SUM(Operating_Profit) DESC

-- Retailers with the highest Operating Expenses by City
SELECT Retailer, City,'$ ' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, City
ORDER BY SUM(Total_Sales) - SUM(Operating_Profit) DESC

-- Using ORDER BY OperatingExpense will not give an orderly output since the format function works that way.
-- the order is done lexicographically (like text). to aviod that, use the column name before the formatting.

/*Retailers with the highest Operating Margins*/
SELECT Retailer,'$ ' +FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' +FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' +FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer
ORDER BY OperatingMargin DESC

-- Why does sports direct has the highest operating margin? is it the selection of markets? Yes.
SELECT Retailer, Region,'$ ' +FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' +FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' +FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer = 'Sports Direct'
GROUP BY Retailer, Region
ORDER BY SUM(Operating_Profit)/SUM(Total_Sales)*100 DESC

--In both the Midwest and South, the combination of strong sports culture, a broad consumer base with
--disposable income, and growing interest in fitness and outdoor activities makes these regions highly
--profitable for sports retailers like Sports Direct. Additionally, factors such as a large middle-class
--population, a growing retail presence, lower cost of living, and favorable climates for outdoor activities
--all contribute to high sales in these areas. Retailers can further capitalize on local demand by tailoring
--their product offerings and marketing strategies to fit regional preferences.

-- What about amazon? selection of markets?
SELECT Retailer, Region,'$ ' +FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' +FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' +FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer = 'Amazon'
GROUP BY Retailer, Region
ORDER BY SUM(Operating_Profit)/SUM(Total_Sales)*100 DESC

-- from the above query, we see that selection of markets, play a crucial role in having high operating profit.

-- Operating Margins of Retailers by Region
SELECT Retailer, Region,'$ ' +FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' +FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' +FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Region
ORDER BY OperatingMargin DESC

-- from the above querty, we see that South, Midwest and Southeast regions have higher operating margins on avg.
-- the western region has one of the lowest operating margins for retailers.

-- Operating Margins of Retailers by State
SELECT Retailer, State,'$ ' +FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' +FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' +FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, State
ORDER BY OperatingMargin DESC

-- Operating Margins of Retailers by City
SELECT Retailer, City,'$ ' +FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$ ' +FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$ ' +FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, City
ORDER BY OperatingMargin DESC

-- National average unemployment rate
SELECT AVG(Unemployment_rate) AS UnemploymentRate
FROM AdidasSalesAnalyticsProject.dbo.State_economic_indicators

--The average unemployment rate across the states is around 3.71 percent. The natural unemployment rate, ie,
--the unemployment rate during stable economic growth and low inflation for the united states is around 4.4%.
-- As interest rates decrease, corporate borrowing and hence corporate hiring budget increases, leading to low
-- unemployment rate. The sales dataset is from years 2020-21 a period of record low interest rates. Hence the average
-- is around 3.71%. States having above average rate must have industries that have a higher average hiring time.
-- cities with high cost of living like san francisco and new york have lower average operating margins.
-- (labor cost, warehouse cost, supply chain cost etc)

/*correlation of Total Sales with Key Economic Indicators*/

--1. Total Sales with State Unemployment rate
--Creating a temp table for temprary storage for the sales by state query
DROP TABLE IF EXISTS #temp_SalesByState
CREATE TABLE #temp_SalesByState (
State nvarchar(50),
TotalSales float
)

INSERT INTO #temp_SalesByState
SELECT State, SUM(Total_Sales) AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY State
ORDER BY SUM(Total_Sales) DESC

--Correlation between Total Sales with State Unemployment Rate
SELECT #temp_SalesByState.State, TotalSales, Unemployment_rate
FROM #temp_SalesByState
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_economic_indicators as Indicators
ON #temp_SalesByState.State = Indicators.State
ORDER BY TotalSales DESC

/*the above table doesn't shows any clear colleration between sales and unemployment rate figures.
The Outlier data points in the plot skewed towards the right are the states with the highest population base.

Although it may look like highly populated states will have more unemployed people, but same goes for the 
share of employed individuals,ie, in two states with different populations and same unemployment rate, one 
state will have more number of employed individuals, hence more sales are expected. States like NY, TX, FL 
and CA have the highest populations hence even with comparatively high uneployment rate, they will produce
high sales figures. Moreover, the purchasing power of a consumer varies across states. 

So for simplifying our analysis, we will divide states into population groups for a comparable analysis */

--dividing the above table into population groups
DROP TABLE IF EXISTS #temp_PopulationGroups
CREATE TABLE #temp_PopulationGroups (
State nvarchar(50),
TotalSales float,
Unemployment_rate float,
PopulationGroup nvarchar(50)
)

INSERT INTO #temp_PopulationGroups 
SELECT #temp_SalesByState.State, TotalSales, Unemployment_rate,
CASE
     WHEN Population >= 10000000 THEN 'P1'
     WHEN Population BETWEEN 9000000 AND 10000000 THEN 'P2'
	 WHEN Population BETWEEN 8000000 AND 9000000 THEN 'P3'
	 WHEN Population BETWEEN 7000000 AND 8000000 THEN 'P4'
	 WHEN Population BETWEEN 6000000 AND 7000000 THEN 'P5'
	 WHEN Population BETWEEN 5000000 AND 6000000 THEN 'P6'
	 WHEN Population BETWEEN 4000000 AND 5000000 THEN 'P7'
	 WHEN Population BETWEEN 3000000 AND 4000000 THEN 'P8'
	 WHEN Population BETWEEN 2000000 AND 3000000 THEN 'P9'
	 WHEN Population BETWEEN 1000000 AND 2000000 THEN 'P10'
	 WHEN Population BETWEEN 0 AND 1000000 THEN 'P11'
END AS PopulationGroup
FROM #temp_SalesByState
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_economic_indicators as Indicators
ON #temp_SalesByState.State = Indicators.State
ORDER BY TotalSales DESC

-- the linear regression plot for the above query shows us that states with low population are on the bottom-left
-- meaning low sales even with low unemployment rate. Moreover, states like New York, California and Texas which
-- have the highest population, have high sales figure even with high unemployment rate, thus proving
--discussion.

--  Population Groups with almost similar poulations like  P10 show the expected inverse relation between
-- the total sales and unemployment rate
SELECT State, TotalSales, Unemployment_rate
FROM #temp_PopulationGroups
WHERE PopulationGroup = 'P10'
ORDER BY Unemployment_rate

--2. Total Sales with Average Household Income
SELECT #temp_SalesByState.State, TotalSales, Avg_household_income
FROM #temp_SalesByState
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_economic_indicators AS Indicators
ON #temp_SalesByState.State = Indicators.State
ORDER BY Avg_household_income DESC

-- for every $1 increase in household income, the sales figure increase by $77.4.

--3. Total Sales with Population
SELECT #temp_SalesByState.State, TotalSales, Population
FROM #temp_SalesByState
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_economic_indicators AS Indicators
ON #temp_SalesByState.State = Indicators.State
ORDER BY Population DESC

-- for every unit increase in population, the sales rises by $1.33.

/*correlation of Operating Profit with Key Economic Indicators */
-- creating a temp table for temporarily storing the Operating Profit by state
DROP TABLE IF EXISTS #temp_OpProfitByState
CREATE TABLE #temp_OpProfitByState (
State nvarchar(50),
TotalSales float,
OperatingExpenses float,
OperatingProfit float
)

INSERT INTO #temp_OpProfitByState
SELECT State,SUM(Total_Sales) AS TotalSales ,
(SUM(Total_Sales)-SUM(Operating_Profit)) AS OperatingExpenses,
SUM(Operating_Profit) AS OperatingProfit
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY State

SELECT *
FROM #temp_OpProfitByState
ORDER BY OperatingProfit DESC

-- 1. correlation between Operating profit and unemployment rate
SELECT Indicators.State, TotalSales, OperatingExpenses, OperatingProfit, Unemployment_rate
FROM #temp_OpProfitByState
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_economic_indicators AS Indicators
ON #temp_OpProfitByState.State = Indicators.State
ORDER BY Unemployment_rate

--dividing the states into population groups of similar sizes (as we did it in the total sales analysis),
-- we will see an inverse relation between unemployment rate and operating profits for states with similar populations,

--2. correlation between operating profit and anerage household income
SELECT Indicators.State, TotalSales, OperatingExpenses, OperatingProfit, Avg_household_income
FROM #temp_OpProfitByState
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_economic_indicators AS Indicators
ON #temp_OpProfitByState.State = Indicators.State
ORDER BY Avg_household_income

--3. correlation between operating profit and population
SELECT Indicators.State, TotalSales, OperatingExpenses, OperatingProfit, Population
FROM #temp_OpProfitByState
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_economic_indicators AS Indicators
ON #temp_OpProfitByState.State = Indicators.State
ORDER BY Population

-- for every 1.24 unit increase in population, the operating profits increase by $1.

/* correlation of operating profit with State minimum wage */
-- storing the query as a temp_table
DROP TABLE IF EXISTS #temp_state_margins
CREATE TABLE #temp_state_margins (
State varchar(50),
TotalSales int,
OperatingProfit int,
OperatingExpenses int,
OperatingMargin float
)
INSERT INTO #temp_state_margins
--Operating Margins by state
SELECT TOP 1000 State, SUM(Total_Sales) AS TotalSales,
SUM(Operating_Profit) AS OperatingProfit,
SUM(Total_Sales) - SUM(Operating_Profit) AS OperatingExpenses,
(SUM(Operating_Profit)/SUM(Total_Sales))*100 AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY State
ORDER BY OperatingMargin DESC

--Temp Table
SELECT * 
FROM #temp_state_margins

-- Table showing the relation between operating margin and minimum wage
SELECT #temp_state_margins.State, OperatingMargin, Minimum_Wage_Per_Hour
FROM #temp_state_margins
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.StateMinWages
ON #temp_state_margins.State = StateMinWages.State
WHERE OperatingMargin IS NOT NULL
ORDER BY OperatingMargin DESC

-- a linear regression plot of the above table would show a correlation between minimum wages and operating margin.
-- from the above query we can see that there is a slight correlation between the minimum wages and the
-- operating margin as employee salary is one of the biggest expenses.

/* correlation of operating profit with average rent per sq feet for warehouses */
--creating a Common table Expression (CTE) for the query showing operating margins by state
WITH Avg_Rent AS (
SELECT TOP 1000 State, SUM(Total_Sales) AS TotalSales,
SUM(Operating_Profit) AS OperatingProfit,
SUM(Total_Sales) - SUM(Operating_Profit) AS OperatingExpenses,
(SUM(Operating_Profit)/SUM(Total_Sales))*100 AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY State
ORDER BY OperatingMargin DESC
)
--Table showing the correlation between the operating margin and average rent per sq feet
SELECT Avg_Rent.State, OperatingMargin, Avg_annual_rent_sqft
FROM Avg_Rent
FULL OUTER JOIN AdidasSalesAnalyticsProject.dbo.State_avg_rent AS state_avg
ON Avg_Rent.State = state_avg.State

-- from the above query, we see that as the average rent per square feet decreases, the operating margin
-- increases. Hence, we can say that commercial real estate leasing costs influence the profitablity for these retailers.

/*Products with the highest Operating Margins*/
SELECT Product, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product
ORDER BY OperatingMargin DESC

--from the above query, we see that on a national average, the Men's Street Footwear is the most profitable
--product while Men's Athletic Footwear is the least profitable product. Interestingly, we see that women's
-- atheletic footware sells more than womens street footware.

-- products with the highest operating margins by region
SELECT Product, Region, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, Region
ORDER BY OperatingMargin DESC

--women's apparel in the southern region has the highest overall operating margin. whereas, the same product
-- in the western region has the lowest operating margin. This query tells us the demand of specific products vis-a-vis their regional clothing culture.

--products with the highest operating margins by state
SELECT Product, State, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, State
ORDER BY OperatingMargin DESC

--products with the highest operating margins by city
SELECT Product, City, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, City
ORDER BY OperatingMargin DESC

-- figure out ways how to influence your competition by this information by researching on each of the
--retailers, their business models and which vairables equate into the operating expenses side.

/*TotalSales, Operating proft, operating expenses and Operating Margin by Sales Method*/
SELECT Sales_Method, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Sales_Method
ORDER BY OperatingMargin DESC

--preferred sales method by retailer
SELECT Retailer, Sales_Method, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Sales_Method
ORDER BY OperatingMargin DESC


--operating margin for sales method by region for each retailer
SELECT Retailer, Sales_Method, Region, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Sales_Method, Region
ORDER BY OperatingMargin DESC

--operating margin for sales method by state for each retailer
SELECT Retailer, Sales_Method, State, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Sales_Method, State
ORDER BY OperatingMargin DESC

--operating margin for sales method by city for each retailer
SELECT Retailer, Sales_Method, City, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Sales_Method, City
ORDER BY OperatingMargin DESC

-- Operating margin for sales method by region
SELECT Sales_Method, Region, '$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
'$' + FORMAT(SUM(Total_Sales) - SUM(Operating_Profit), 'N2') AS OperatingExpenses,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Sales_Method, Region
ORDER BY OperatingMargin DESC

-- Market Share Analysis
/*
Northeast region contains 3 out of top 6 highest population density urban sproul, namely new york city, boston and Philidelphia.
Such densely populated urban centers are ideal locations for e commerce retail business. Factors like highly concentrated demand, robust
supply chain and dilevery infrastructure, high internet penetration and limited and expensive retail physical locations make the e commerce
model highly efficient.

We also see each retailer's lowest sales generating markets:
Amazon and Foot Locker and Kohl's: South, Sports Direct and Walmart: West, West Gear : Southeast

An interesting observation is that the retailers who are the most popular in the west are the least popular in the south and vice versa.
*/

-- compare the locations with highest units sold with the population, average household income, unemployment rate etc.
DROP TABLE IF EXISTS #temp_KEIs
CREATE TABLE #temp_KEIs (
State nvarchar(50),
Unemployment_rate float,
Avg_household_income float,
Population float
)

INSERT INTO #temp_KEIs
SELECT *
FROM AdidasSalesAnalyticsProject.dbo.State_economic_indicators

SELECT *
FROM #temp_KEIs

/*	Units Sold by Location*/
--Regions with the highest Units Sold
SELECT Region, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Region
ORDER BY UnitsSold DESC

--States with the highest Units Sold
SELECT State,'$' + FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY State
ORDER BY UnitsSold DESC

--Cities with the highest Units Sold
SELECT City,'$'+ FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY City
ORDER BY UnitsSold DESC

/* Retailers with the highest total units sold */
SELECT Retailer, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer
ORDER BY SUM(Units_Sold) DESC

-- Retailers with the highest total units sold by region
SELECT Retailer, Region, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, Region
ORDER BY SUM(Units_Sold) DESC

-- Retailers with the highest total units sold by state
SELECT Retailer, State, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, State
ORDER BY SUM(Units_Sold) DESC

-- Retailers with the highest total units sold by city
SELECT Retailer, City, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Retailer, City
ORDER BY SUM(Units_Sold) DESC

/*Seasonality factor analysis*/

-- Seasonality in Sales figures for the year 2020
SELECT MONTH(Invoice_Date) AS Month,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE YEAR(Invoice_Date) = 2020
GROUP BY MONTH(Invoice_Date)
ORDER BY MONTH(Invoice_Date)

-- the increae in sales during april and october can be understood as pre summer and pre holiday season
-- shopping behaviors. people often refresh their wardrobes before the summer season. nsumers start to
-- prepare for holiday season activities, including Black Friday and gift-giving, although it could also
-- reflect back-to-school shopping, especially for Adidas. A similar purchasing pattern is observed across 
-- numerous industries.

-- Seasonality in Sales figures for the year 2021
SELECT MONTH(Invoice_Date) AS Month,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE YEAR(Invoice_Date) = 2021
GROUP BY MONTH(Invoice_Date)
ORDER BY MONTH(Invoice_Date)

--Sales spikes in summer (May-July) and the holiday season (November-December) were significant, reflecting
-- traditional retail behaviors. Adidas also benefitted from back-to-school and holiday shopping, which 
-- boosted sales in Q3 and Q4. The strong performance in 2021 could also reflect a recovery from the global 
-- pandemic. Many customers, especially in Q2 and Q3, may have been more inclined to spend on fitness-related
-- products and leisurewear as they adapted to post-pandemic life.


-- which regions have a seasonality factor?
--1. South
SELECT MONTH(Invoice_Date) AS Month, Region,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Region = 'South'
GROUP BY MONTH(Invoice_Date), Region
ORDER BY MONTH(Invoice_Date)

-- The sales figures for the South peak around both april and september with the september's profits much larger
-- tha nthat of april indicating that the back to school/black friday/holiday season shopping behavior is much
--more prominent in the southern consumer base than the pre summer shopping behavior.

--2. Southeast
SELECT MONTH(Invoice_Date) AS Month, Region,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Region = 'Southeast'
GROUP BY MONTH(Invoice_Date), Region
ORDER BY MONTH(Invoice_Date)

--Strong demand for sportswear and athleisure in the warmer months, with peaks in summer and back-to-school periods.
--Slightly lower sales in the early year, with consistent profitability due to strong margins in the post-holiday months.
--Sports-driven sales are particularly significant in August and September, linked to the start of football and basketball seasons.
--Promotions during key seasonal events (e.g., holidays, back-to-school) may slightly reduce margins, but they still generate strong sales figures.
--The warm climate and active lifestyle in the Southeast drive a consistent demand for comfortable, functional athletic wear, especially running shoes,
-- sneakers, and casual apparel.

--3. Northeast
SELECT MONTH(Invoice_Date) AS Month, Region,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Region = 'Northeast'
GROUP BY MONTH(Invoice_Date), Region
ORDER BY MONTH(Invoice_Date)

-- A spike in sales is observered during march and december. The pre summer behavior is mildly observed along
-- with post holiday shopping behavior. The northeastern consumers have this peculiar behavior of post holiday
--season shopping which shows that back to school/black friday/pre holiday sales aren't that relevant in northeast.
-- Although there is a small peak for the month of september which mainly be beacuse of the back to school shopping.

-- 4. Midwest
SELECT MONTH(Invoice_Date) AS Month, Region,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Region = 'Midwest'
GROUP BY MONTH(Invoice_Date), Region
ORDER BY MONTH(Invoice_Date)

--The Midwest market for Adidas shows seasonal fluctuations in consumer spending, with clear peaks
-- in June and July, followed by holiday-related shopping in December.

--5. West
SELECT MONTH(Invoice_Date) AS Month, Region,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Region = 'West'
GROUP BY MONTH(Invoice_Date), Region
ORDER BY MONTH(Invoice_Date)

--The consistent patterns suggest that Adidas experiences typical seasonal fluctuations in the Western
-- U.S., with peaks in January, April-May, July, and the holiday months of November-December. The lower
-- sales months—August and September—are likely driven by the transition between seasons.

/* Year over Year Sales Growth */
SELECT YEAR(Invoice_Date) AS Year,'$'+ FORMAT(SUM(Total_Sales), 'N2') AS TotalSales,
'$' + FORMAT((SUM(Total_Sales) - SUM(Operating_Profit)), 'N2') AS OperatingExpenses,
'$'+ FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY YEAR(Invoice_Date)

--identify: which product types bring in the the most sales/operating profit and have the highest margins for each retailer?
-- 1. Amazon
SELECT Product,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales, 
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer = 'Amazon'
GROUP BY Product
ORDER BY SUM(Operating_Profit) DESC

-- 2. Walmart
SELECT Product,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales, 
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer = 'Walmart'
GROUP BY Product
ORDER BY SUM(Operating_Profit) DESC

-- 3. West Gear
SELECT Product,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales, 
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer = 'West Gear'
GROUP BY Product
ORDER BY SUM(Operating_Profit) DESC

-- 4. Sports Direct
SELECT Product,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales, 
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer = 'Sports Direct'
GROUP BY Product
ORDER BY SUM(Operating_Profit) DESC

--5. Kohl's
SELECT Product,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales, 
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer LIKE 'Kohl%'
GROUP BY Product
ORDER BY SUM(Operating_Profit) DESC

--6. Foot Locker
SELECT Product,'$' + FORMAT(SUM(Total_Sales), 'N2') AS TotalSales, 
'$' + FORMAT(SUM(Operating_Profit), 'N2') AS OperatingProfit,
FORMAT((SUM(Operating_Profit)/SUM(Total_Sales))*100, 'N2') + '%' AS OperatingMargin
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
WHERE Retailer = 'Foot Locker'
GROUP BY Product
ORDER BY SUM(Operating_Profit) DESC

/* Product types with their average price */
SELECT Product,'$'+ FORMAT(AVG(Price_per_Unit), 'N2') AS AvgPrice
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product
ORDER BY AVG(Price_per_Unit) DESC

-- in the following queries describing the price variation as a function of location,
-- we can perform a comp analysis if we have a dataset ontaining the market value of each product type
-- to know if we are under/over selling.

-- variation in the avg price by region
SELECT Product, Region, AVG(Price_per_Unit) AS RegionAvgPrice
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, Region
ORDER BY AVG(Price_per_Unit) DESC

-- variation in the avg price by state
SELECT Product, State, AVG(Price_per_Unit) AS StateAvgPrice
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, State
ORDER BY AVG(Price_per_Unit) DESC

-- variation in the avg price by city
SELECT Product, City,'$' + FORMAT(AVG(Price_per_Unit), 'N2') AS CityAvgPrice
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, City
ORDER BY AVG(Price_per_Unit) DESC

-- Sales by product Type
SELECT Product,'$'+ FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product
ORDER BY SUM(Total_Sales) DESC

--Sales by product by region, state, city
SELECT Product, Region, '$'+ FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, Region
ORDER BY SUM(Total_Sales) DESC

--Sales by product by state
SELECT Product, State,'$'+ FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, State
ORDER BY SUM(Total_Sales) DESC

--Sales by product by city
SELECT Product, City,'$'+ FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, City
ORDER BY SUM(Total_Sales) DESC

-- Products with the highest total units sold
SELECT Product, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product
ORDER BY UnitsSold DESC

-- Products with the highest total units sold by region, state and city
SELECT Product, Region, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, Region
ORDER BY UnitsSold DESC

SELECT Product, State, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, State
ORDER BY UnitsSold DESC

SELECT Product, City, FORMAT(SUM(Units_Sold), 'N2') AS UnitsSold
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Product, City
ORDER BY UnitsSold DESC

/* Total Sales Performance by Sales Method */
SELECT Sales_Method, FORMAT(SUM(Total_Sales), 'N2') AS TotalSales
FROM AdidasSalesAnalyticsProject.dbo.AdidasSalesDataset
GROUP BY Sales_Method
ORDER BY SUM(Total_Sales) DESC