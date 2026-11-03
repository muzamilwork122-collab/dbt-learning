{% macro function1(x) %}

    CASE
        WHEN TO_TIMESTAMP({{ x }}) < CURRENT_DATE()
            THEN 'PAST'
        ELSE 'CURRENT'
    END

{% endmacro %}


{% macro function_season(x) %}

    CASE
        WHEN MONTH(TO_TIMESTAMP({{ x }})) IN (11, 12, 1, 2)
            THEN 'Winter'

        WHEN MONTH(TO_TIMESTAMP({{ x }})) IN (3, 4, 5, 6, 7, 8)
            THEN 'Summer'

        ELSE 'Spring'
    END

{% endmacro %}

{% macro function_days(x) %}

case when DAYNAME(TO_TIMESTAMP({{ x }})) in ('sat','sun') then 'weekend' else 'busines day' end 

{% endmacro %}