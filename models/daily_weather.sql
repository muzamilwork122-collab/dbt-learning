WITH first_cte AS (

    SELECT
        DATE(TIME) AS daily_weather,
        weather,
        temp,
        pressure,
        humidity,
        clouds

    FROM {{ source('demo', 'WEATHER') }}

),

weather_agg AS (

    SELECT
        daily_weather,
        weather,
        round(avg(temp),2) as avg_temp,
        round(avg(pressure),2)as avg_pressure,
        round(avg(humidity),2)as avg_humidity,
        round(avg(clouds),2) as avg_clouds

        from first_cte
        
        group by daily_weather,weather

)

SELECT *
FROM weather_agg 