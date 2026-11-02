WITH cte AS (
    SELECT
        
      TO_TIMESTAMP(STARTED_AT) as Started_at,
      DATE(TO_TIMESTAMP(STARTED_AT)) as Start_Date,
      HOUR(TO_TIMESTAMP(STARTED_AT)) as Hour_start_date,
      DAYNAME(TO_TIMESTAMP(STARTED_AT)) as day_name,
      {{function_days}},
      {{function_season('started_at')}},
      {{function1('Started_at')}}



    FROM {{ source('demo', 'BIKE') }}
    where STARTED_AT!='started_at'
)

SELECT *
FROM cte