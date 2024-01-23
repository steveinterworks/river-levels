select  
    stationreference as station_code
    ,parametername
    ,unitname as unit 
    ,latestreading:dateTime as latestreading_date
    ,latestreading:"value" as latestreading_value
from {{ ref('stg_measures_list')}}
where latestreading IS NOT NULL