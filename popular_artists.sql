with artist_purchases as (
    select
        art.artistid
        , count(ii.invoicelineid) TrackPurchases
    from invoice_items ii
    left join tracks trk on ii.trackid = trk.trackid
    left join albums alb on trk.albumid = alb.albumid
    left join artists art on alb.artistid = art.artistid
    group by art.artistid
)
select
    a.name
    , coalesce(ap.trackpurchases, 0) as TrackPurchases
from artists a
left join artist_purchases ap on a.artistid = ap.artistid
order by ap.trackpurchases desc;