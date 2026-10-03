use agribusiness_week2;

select
    c.crop_name,
    sum(p.production_quantity) as total_production,
    sum(p.cultivated_area) as total_area,
    round(sum(p.production_quantity) / sum(p.cultivated_area), 2) as yield_per_acre
from production p
join crop c
    on p.crop_id = c.crop_id
group by c.crop_name
order by yield_per_acre desc;


select
    f.farm_name,
    sum(p.production_quantity) as total_production,
    round(avg(p.yield_quantity), 2) as average_yield
from production p
join farm f
    on p.farm_id = f.farm_id
group by f.farm_name
order by total_production desc;



select
    s.season_name,
    sum(p.production_quantity) as total_production,
    round(avg(p.yield_quantity), 2) as average_yield
from production p
join season s
    on p.season_id = s.season_id
group by s.season_name
order by total_production desc;

select
    cost_type,
    sum(amount) as total_cost
from cost
group by cost_type
order by total_cost desc;


select
    p.production_id,
    c.crop_name,
    p.production_quantity,
    sum(co.amount) as total_cost,
    round(sum(co.amount) / p.production_quantity, 2) as cost_per_unit
from production p
join crop c
    on p.crop_id = c.crop_id
join cost co
    on p.production_id = co.production_id
group by
    p.production_id,
    c.crop_name,
    p.production_quantity
order by cost_per_unit desc;

select
    c.crop_name,
    sum(p.production_quantity) as total_production,
    round(avg(p.yield_quantity), 2) as average_yield,
    sum(co.amount) as total_cost,
    round(sum(co.amount) / sum(p.production_quantity), 2) as cost_per_unit
from production p
join crop c
    on p.crop_id = c.crop_id
join cost co
    on p.production_id = co.production_id
group by c.crop_name
order by cost_per_unit;


