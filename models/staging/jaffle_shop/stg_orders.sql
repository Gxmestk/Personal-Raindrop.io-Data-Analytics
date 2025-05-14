select id as order_id, user_id as customer_id, order_date, status
from {{ source('raindrop-io_api', 'jaffle_shop_orders') }}
;
