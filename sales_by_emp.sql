with customer_totals as (
    select
        customerid
        , sum(total) as CustomerTotal
    from invoices
    group by customerid
),
sales_totals as (
    select
        e.employeeid
        , count(ct.customerid) as CustomersSupported
        , sum(ct.customertotal) as SalesTotal
    from customers c
    left join employees e on e.employeeid = c.supportrepid
    left join customer_totals ct on c.customerid = ct.customerid
    group by e.employeeid
)
select
    e.employeeid
    , e.firstname
    , e.lastname
    , e.title
    , coalesce(st.customerssupported, 0) as CustomersSupported
    , coalesce(st.salestotal, 0) as SalesTotal
from employees e
left join sales_totals st on st.employeeid = e.employeeid
;