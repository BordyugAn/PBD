use Football;

create login user1 with password = 'User1user1';
create login user2 with password = 'User2user2';
create user user1 for login user1;
create user user2 for login user2;

grant select, insert, update on players to user1;
grant select on players to user2;

execute as user = 'user2';
select * from Teams;
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Футбольный', 'Боженька', '0000-00-00', (select id from Teams where Teams.name='Челси'), (select id from nationality where nationality.name='Бельгиец'));
revert;