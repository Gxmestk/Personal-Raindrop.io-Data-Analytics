select id as order_id, user_id as customer_id, order_date, status
from {{ source('raindrop-op_api', 'jaffle_shop_orders') }}
;
