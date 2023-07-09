select
    c.country
    , sum(i.total) as Revenue
    , count(distinct i.customerid) as Customers
from invoices i
left join customers c on i.customerid = c.customerid
group by c.country
order by Revenue desc
;