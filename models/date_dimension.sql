WITH cte AS (
    SELECT
        
      TO_TIMESTAMP(STARTED_AT) as Started_at,
      DATE(TO_TIMESTAMP(STARTED_AT)) as Start_Date,
      HOUR(TO_TIMESTAMP(STARTED_AT)) as Hour_start_date,
      DAYNAME(TO_TIMESTAMP(STARTED_AT)) as day_name,
      case when day_name in ('sat','sun') then 'Weekend' else 'Business_day' end as day_type,
      MONTH(TO_TIMESTAMP(STARTED_AT)) as startat_Month,
      case when  MONTH(TO_TIMESTAMP(STARTED_AT)) in (11,12,1,2) then 'winter' when MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5,6,7) then 'Summer' else 
      'Spring' end as seasons
    FROM {{ source('demo', 'BIKE') }}
    where STARTED_AT!='started_at'
)

SELECT *
FROM cte