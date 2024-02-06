select 
    customers.customer_name AS Customer,
    printf('$%.2f', sum(subscriptions.price_per_month * subscriptions.subscription_length)) AS "Amount Due"
from orders
join customers on orders.customer_id = customers.customer_id
join subscriptions on orders.subscription_id = subscriptions.subscription_id
where orders.order_status = 'unpaid'
and subscriptions.description like '%Fashion Magazine%'

group by customers.customer_name
order by customers.customer_name

