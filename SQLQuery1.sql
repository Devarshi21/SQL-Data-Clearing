select date, total_cases, new_cases,total_deaths,population
from CovidDeaths
where continent is not null
order by 1,2


--looking at total cases vs total deaths

select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths
where location like 'India'
where continent is not null
order by 1,2


--Looking at total cases vs population(shows what % got covid)

select location,date, total_cases, population, (total_cases/population)*100 as CasePercentage
from CovidDeaths
--where location like 'India'
where continent is not null
order by 1,2


--looking at COuntries with highest infection rate compared to population

select location, MAX(total_cases) as HighestCaseCount, population, MAX(total_cases/population)*100 as CasePercentage
from CovidDeaths
--where location like 'India'
where continent is not null
Group By location, population
order by CasePercentage desc


--showing Countries with Highest Death Count


select location, population,MAX(cast(total_deaths as int)) as TotalDeath 
from CovidDeaths
--where location like 'India'
where continent is not null
Group By location, population
order by TotalDeath desc


--BREAKING THINGS DOWN BY CONTINENT

select location,MAX(cast(total_deaths as int)) as TotalDeath 
from CovidDeaths
--where location like 'India'
where continent is null
Group By location
order by TotalDeath desc



--GLOBAL NUMBERS

select  SUM(new_cases) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, SUM(cast(new_deaths as int))/SUM(new_cases) as DeathPercentage
from CovidDeaths
where continent is not null
--Group by date
order by 1,2



select *
from Portfolio..CovidDeaths dea
Join Portfolio..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
