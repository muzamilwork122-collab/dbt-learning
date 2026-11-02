with bike as (

    select 
     distinct START_STATION_NAME,
    START_STATIO_ID,
    START_LAT,
    START_LNG


     from {{ source('demo', 'BIKE') }}
    where RIDE_ID!='ride_id'
)

select * from bike 