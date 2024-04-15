if object_id('dbo.SKU') is null
begin
    create table dbo.SKU
    (
      ID int not null identity,
      Code as 's' + cast(ID as nvarchar(10)),
      Name nvarchar(30),
      constraint PK_SKU primary key (ID)
    );
    alter table dbo.SKU add constraint UK_SKU_Name unique (Code);
end;

if object_id('dbo.Family') is null
begin
    create table dbo.Family
    (
      ID int not null identity,
      SurName nvarchar(20),
      BudgetValue decimal(18, 2),
      constraint PK_Family primary key (ID)
    );
end;

if object_id('dbo.Basket') is null
begin
    create table dbo.Basket
    (
      ID int not null identity
      ID_SKU int not null,
      ID_FAMILY int not null,
      Quantity int,
      Value decimal(18, 2),
      PurchaseDate date, 
      DiscountValue decimal(18, 2),
      constraint PK_Basket primary key (ID)
    );
    alter table dbo.Basket add constraint FK_Basket_ID_SKU_SKU foreign key(ID_SKU) references dbo.SKU (ID);
    alter table dbo.Basket add constraint FK_Basket_ID_Family_Family foreign key (ID_FAMILY) references dbo.Family (ID);
    alter table dbo.Basket add constraint CK_Basket_Quantity check (Quantity > 0);
    alter table dbo.Basket add constraint CK_Basket_Value check (Value > 0);
    alter table dbo.Basket add constraint DF_Basket_PurchaseDate default getdate() for PurchaseDate;
end;