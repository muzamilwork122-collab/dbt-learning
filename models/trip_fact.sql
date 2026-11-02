with fact as (

    select 
    RIDE_ID,
    RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS STARTDATE,
    START_STATIO_ID,
    END_STATION_ID,
    MEMBER_CSUAL,
    TIMESTAMPDIFF(SECONDS,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS DURATION
    from {{ source('demo', 'BIKE') }}
    where RIDE_ID!='ride_id'
    
)

select * from fact