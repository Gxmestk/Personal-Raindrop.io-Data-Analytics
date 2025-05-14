with
    orders as (select * from {{ ref("stg_orders") }}),

    payments as (select * from {{ ref("stg_stripe") }}),

    sum_payments as (

        select order_id, sum(case when status = 'success' then amount end) as amount
        from payments

        group by order_id

    ),

    final as (

        select
            orders.order_id,
            orders.customer_id,
            coalesce(sum_payments.amount, 0) as amount,
            orders.order_date

        from orders
        left join sum_payments using (order_id)
    )

select *
from final
;
