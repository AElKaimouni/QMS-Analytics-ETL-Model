-- Use the `ref` function to select from other models

select *
from "qms"."qms"."my_first_dbt_model"
where id = 1