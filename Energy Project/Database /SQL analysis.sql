--What is the total global energy volume grouped by activity Production, Consumption?
SELECT  A.activity_name,SUM(ER.energy_value) AS Total_Energy_Volume
FROM ENERGY_RECORD ER
JOIN ACTIVITY A ON ER.activity_id = A.activity_id
GROUP BY A.activity_name;

-- Which are the Top 5 countries with the highest overall energy production?
select top 5 c.country_name, sum(er.energy_value) as total_production
from energy_record er
join country c on er.country_id = c.country_id
join activity a on er.activity_id = a.activity_id
where a.activity_name = 'production'
group by c.country_name
order by total_production desc;

--How is energy consumption distributed across different continents?
select co.continent_name, sum(er.energy_value) as total_consumption
from energy_record er
join country c on er.country_id = c.country_id
join continent co on c.continent_id = co.continent_id
join activity a on er.activity_id = a.activity_id
where a.activity_name = 'consumption'
group by co.continent_name
order by total_consumption desc;

-- What is the historical trend of global energy usage over the years?
select record_year, sum(energy_value) as global_energy_volume
from energy_record
group by record_year
order by record_year asc;

--What is the total global energy consumption in the most recent year recorded?
select sum(er.energy_value) as latest_year_consumption
from energy_record er
join activity a on er.activity_id = a.activity_id
where a.activity_name = 'consumption'
and er.record_year = (select max(record_year) from energy_record);

--Which energy category  is the most dominant overall?
select ec.category_name, sum(er.energy_value) as total_energy_value
from energy_record er
join energy_category ec on er.category_id = ec.category_id
group by ec.category_name
order by total_energy_value desc;

