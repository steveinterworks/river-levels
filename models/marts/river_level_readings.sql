with measure as (
    select * from {{ref('measures_clean')}}
),

stations as (
    select * from {{ref('stations_clean')}}
),

readings as (
select 
    SUBSTRING(readings."@ID", 63, 6) as station_code
    ,readings.DATETIME 
    ,readings.VALUE
from {{ref('stg_station_readings')}} readings 
)

select  readings.*
        ,stations.latitude
        ,stations.Longitude
        ,stations.town
        ,stations.station_name
        ,measure.parametername
        ,measure.unit
from    readings
left join stations 
    on stations.station_code = readings.station_code
left join measure
    on measure.station_code = readings.station_code
