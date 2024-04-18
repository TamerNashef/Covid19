use PortfolioProject
go

Select Location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths
order by 1,2

-- Death Percentages

Select Location, date, total_cases, total_deaths, (CONVERT(FLOAT, total_deaths) / CONVERT(FLOAT, total_cases))*100 as DeathPercentage
from CovidDeaths
where  total_cases is not null and total_deaths is not null
order by 1,2
-- Countries with highest Population Percentage Infected
select location,population, max(convert (int, total_cases)) as HighestInfectionCount, max(CONVERT(FLOAT, total_cases) / CONVERT(FLOAT, population))*100 as PopulationPercentageInfected
from CovidDeaths
where continent is not null and total_cases is not null
group by location, population
order by 4 desc
-- Countries with highest death count per population
select location, population, max(convert (int, total_deaths)) as HighestDeathCount, max(CONVERT(float, total_deaths) / CONVERT(float, population))*100 as DeathPopulationPercentage
from CovidDeaths
where continent is not null and total_deaths is not null
group by location, population
order by 4 desc
-- Continents with the highest Deaths
select location as Continents, max(convert(int, total_deaths)) as TotalDeaths
from coviddeaths
where continent is null and location in ('Europe','Asia','North America','South America','European Union','Africa','Oceania')
group by location
order by 2 desc

--Create View (total deaths and total cases ratio in countries each day)
create view DeathsVsCases as
Select Location, date, total_cases, total_deaths, (CONVERT(FLOAT, total_deaths) / CONVERT(FLOAT, total_cases))*100 as DeathPercentage
from CovidDeaths
where  total_cases is not null and total_deaths is not null
--Create View (Countries with highest Population Percentage Infected)
create view PopulationPercentageInfected as
select location,population, max(convert (int, total_cases)) as HighestInfectionCount, max(CONVERT(FLOAT, total_cases) / CONVERT(FLOAT, population))*100 as PopulationPercentageInfected
from CovidDeaths
where continent is not null and total_cases is not null
group by location, population
--Create View (Countries with highest death count per population)
create view HighestDeathCountPerPopulation as
select location, population, max(convert (int, total_deaths)) as HighestDeathCount, max(CONVERT(float, total_deaths) / CONVERT(float, population))*100 as DeathPopulationPercentage
from CovidDeaths
where continent is not null and total_deaths is not null
group by location, population
--Create View (Continents with the highest Deaths)
create view ContinentsWithHighestDeaths as
select location as Continents, max(convert(int, total_deaths)) as TotalDeaths
from coviddeaths
where continent is null and location in ('Europe','Asia','North America','South America','European Union','Africa','Oceania')
group by location










