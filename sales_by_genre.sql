select
    g.name as Genre
    , sum(ii.quantity) Quantity
    , sum(ii.quantity) * ii.unitprice Revenue
from invoice_items ii
left join tracks trk on ii.trackid = trk.trackid
left join genres g on g.genreid = trk.genreid
group by g.name
order by Quantity desc
;