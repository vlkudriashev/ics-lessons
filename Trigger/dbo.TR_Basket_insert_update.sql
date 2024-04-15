create	or alter trigger dbo.TR_Basket_insert_update 
on dbo.Basket
after insert
as
begin
	update b
	set DiscountValue = 
        case 
			when i.counter > 1
				then Value * 0.05
			else 0
		end
	from dbo.Basket b
	inner join (
		select
            ID_SKU
			,count(ID_SKU) as counter
		from inserted
		group by ID_SKU
	) as i on i.ID_SKU = b.ID_SKU
end;