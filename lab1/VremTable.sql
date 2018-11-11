create table #VrNationality(
  id numeric identity(1,1),
  name nvarchar(30)
);


insert into #VrNationality (name) values ('titikaka');
insert into #VrNationality (name) values ('polyak');

select * from #VrNationality;

update #VrNationality set name = 'kazah' where name = 'titikaka';

delete from #VrNationality where name = 'kazah';

insert into #VrNationality select name from nationality;