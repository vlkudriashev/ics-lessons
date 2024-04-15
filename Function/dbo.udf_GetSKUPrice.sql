create or alter function dbo.udf_GetSKUPrice(@ID_SKU int)
returns decimal(18,2)
as
begin
    declare 
        @ValueSum decimal(18,2)
        ,@QuantitySum decimal(18,2)
        ,@Result decimal(18,2);

    select 
        @ValueSum = sum(Value)
        ,@QuantitySum = sum(Quantity)
    from dbo.Basket
    where ID_SKU = @ID_SKU;

    set @Result = @ValueSum / @QuantitySum;

    return @Result;
end;