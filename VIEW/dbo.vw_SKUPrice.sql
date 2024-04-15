create or alter view dbo.vw_SKUPrice 
as
select
    s.ID,
    s.Code,
    s.Name,
    dbo.udf_GetSKUPrice(ID) as price
from dbo.SKU s