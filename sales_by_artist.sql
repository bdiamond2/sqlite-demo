with artist_purchases as (
    select
        art.artistid
        , sum(ii.quantity) as Quantity
        , sum(ii.quantity * ii.unitprice) as Revenue
    from invoice_items ii
    left join tracks trk on ii.trackid = trk.trackid
    left join albums alb on trk.albumid = alb.albumid
    left join artists art on alb.artistid = art.artistid
    group by art.artistid
)
select
    a.name as Artist
    , coalesce(ap.Quantity, 0) as Quantity
    , coalesce(ap.Revenue, 0) as Revenue
from artists a
left join artist_purchases ap on a.artistid = ap.artistid
order by ap.Quantity desc;