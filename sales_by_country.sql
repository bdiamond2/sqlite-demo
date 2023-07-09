select
    c.country
    , sum(i.total) as InvoiceTotal
    , count(distinct i.customerid) as Customers
from invoices i
left join customers c on i.customerid = c.customerid
group by c.country
order by invoicetotal desc
;