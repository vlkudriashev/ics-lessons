create or alter trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert, update
as
begin
    update dbo.Basket
    set DiscountValue = case when count(*) > 1 then Value * 0.05 else 0 end
    from inserted i
    where dbo.Basket.ID = i.ID;
end;