use football;

create view PlayersTeams as
select players.name as name,
       players.surname as surname,
       Teams.name as team
from players inner join Teams on players.team = Teams.id;

select * from PlayersTeams;

update PlayersTeams set team = 'Ювентус' where name = 'Криштиану';

drop view PlayersTeams;

create view viewNationality as
select nationality.name as nationality
from nationality;

select * from viewNationality;

insert into viewNationality (nationality) values ('kazah');
select * from viewNationality;
select * from nationality;

update viewNationality set nationality = 'megaKazah' where nationality = 'kazah';
select * from viewNationality;
select * from nationality;

delete from viewNationality where viewNationality.nationality = 'megakazah';
select * from viewNationality;
select * from nationality;

-- запрещение измения данных, которые не отображаются

create view view1 as
select Teams.name, Teams.stadium, Teams.yearFoundation
from Teams
where yearFoundation < '1905'
with check option;

select * from view1;

update view1 set yearFoundation = '2018' where yearFoundation < '1900';

drop view view1;

-- Шифрование

create view view2 with encryption as
select Teams.name, Teams.stadium, Teams.yearFoundation
from Teams;

select * from view2;

sp_helptext view2;

drop view view2;

-- Составить запросы на выборку данных с помощью представлений с ограничением числа выходных столбцов и строк.

create view view3 as
select top 3 Teams.name, Teams.stadium, Teams.yearFoundation
from Teams
where yearFoundation < '1905';

select * from view3;

drop view view3;