create or alter procedure dbo.usp_MakeFamilyPurchase (
    @FamilySurName nvarchar(20)
)
as
begin
    if not exists (select 1 from dbo.Family where SurName = @FamilySurName)
    begin
        print 'Такая семья не найдена';
        return;
    end;
    
    declare 
        @FamilyID int
        ,@BasketSum dec(18, 2)
        
    set @FamilyID = (select ID from dbo.Family where SurName = @FamilySurName)
    set @BasketSum = (select sum(Value) from dbo.Basket where ID_Family = @FamilyID)
    
    update dbo.Family
    set BudgetValue = BudgetValue - BasketSum where SurName = @FamilySurName;
end;