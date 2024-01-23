select 
    notation as station_code
    ,lat as latitude
    ,long as Longitude
    ,town
    ,label as station_name
from {{ ref('stg_station_list')}}