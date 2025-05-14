select id as customer_id, first_name, last_name
from {{ source('raindrop-op_api', 'jaffle_shop_customers') }}
;
