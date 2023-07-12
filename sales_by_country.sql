select
    c.country
    , sum(ii.quantity) as Quantity
    , sum(ii.unitprice * ii.quantity) as Revenue
    , count(distinct i.customerid) as UniqueCustomers
from invoices i
left join customers c on i.customerid = c.customerid
left join invoice_items ii on i.invoiceid = ii.invoiceid
group by c.country
order by Revenue desc
;