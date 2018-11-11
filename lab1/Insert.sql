use football;

insert into Ligue (name) values ('АПЛ');
insert into Ligue (name) values ('РПЛ');
insert into Ligue (name) values ('Бундеслига');
insert into Ligue (name) values ('Итальянская серия А');
insert into Ligue (name) values ('Лига чемпионов');
insert into Ligue (name) values ('Лига европы');
insert into Ligue (name) values ('Франц первая лига');
insert into Ligue (name) values ('Испанская лига');
insert into Ligue (name) values ('Турецкая суперлига');

insert into nationality (name) values ('Русский');
insert into nationality (name) values ('Англичанин');
insert into nationality (name) values ('Француз');
insert into nationality (name) values ('Турок');
insert into nationality (name) values ('Испанец');
insert into nationality (name) values ('Итальянец');
insert into nationality (name) values ('Немец');
insert into nationality (name) values ('Украинец');
insert into nationality (name) values ('Бельгиец');
insert into nationality (name) values ('Аргентинец');
insert into nationality (name) values ('Португалец');
insert into nationality (name) values ('Бразилец');

insert into Teams (name, stadium, yearFoundation) values ('Челси', 'Стэмфорд бридж', '1905');
insert into Teams (name, stadium, yearFoundation) values ('Арсенал', 'Эмирейтс', '1886');
insert into Teams (name, stadium, yearFoundation) values ('ЦСКА', 'ВЭБ Арена', '1911');
insert into Teams (name, stadium, yearFoundation) values ('Локомотив', 'РЖД Арена', '1922');
insert into Teams (name, stadium, yearFoundation) values ('Зенит', 'Зенит арена', '1925');
insert into Teams (name, stadium, yearFoundation) values ('Бавария', 'Альянц арена', '1900');
insert into Teams (name, stadium, yearFoundation) values ('Реал Мадрид', 'Сантьяго Бернабеу', '1902');
insert into Teams (name, stadium, yearFoundation) values ('Барселона', 'Камп Ноу', '1899');
insert into Teams (name, stadium, yearFoundation) values ('ПСЖ', 'Парк Де Пренс', '1970');
insert into Teams (name, stadium, yearFoundation) values ('Марсель', 'Велодром', '1899');
insert into Teams (name, stadium, yearFoundation) values ('Милан', 'Сан Сиро', '1899');
insert into Teams (name, stadium, yearFoundation) values ('Ювентус', 'Альянц Стадиум', '1897');
insert into Teams (name, stadium, yearFoundation) values ('Галатасарай', 'Тюрк Телеком Арена', '1905');
insert into Teams (name, stadium, yearFoundation) values ('Фенербахче', 'Шюкрю Сараджоглу', '1907');

insert into players (name, surname, dateofbirth, team, nationality)
  values ('Эден', 'Азар', '1991-01-07', (select id from Teams where Teams.name='Челси'), (select id from nationality where nationality.name='Бельгиец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Леонель', 'Месси', '1987-06-24', (select id from Teams where Teams.name='Барселона'), (select id from nationality where nationality.name='Аргентинец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Криштиану', 'Роналду', '1985-02-05', (select id from Teams where Teams.name='Реал Мадрид'), (select id from nationality where nationality.name='Португалец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Месут', 'Озил', '1988-10-15', (select id from Teams where Teams.name='Арсенал'), (select id from nationality where nationality.name='Немец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Марио', 'Фернандес', '1990-09-19', (select id from Teams where Teams.name='ЦСКА'), (select id from nationality where nationality.name='Бразилец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Маринато', 'Гильерме', '1985-12-12', (select id from Teams where Teams.name='Локомотив'), (select id from nationality where nationality.name='Бразилец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Александр', 'Кокорин', '1991-03-19', (select id from Teams where Teams.name='Зенит'), (select id from nationality where nationality.name='Русский'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Мануэль', 'Нойер', '1986-03-26', (select id from Teams where Teams.name='Бавария'), (select id from nationality where nationality.name='Немец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Килиан', 'Мбаппе', '1998-12-20', (select id from Teams where Teams.name='ПСЖ'), (select id from nationality where nationality.name='Француз'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Флорьян', 'Товен', '1993-01-26', (select id from Teams where Teams.name='Марсель'), (select id from nationality where nationality.name='Француз'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Гонсало', 'Игуаин', '1987-12-10', (select id from Teams where Teams.name='Милан'), (select id from nationality where nationality.name='Аргентинец'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Карим', 'Бензема', '1987-12-19', (select id from Teams where Teams.name='Реал Мадрид'), (select id from nationality where nationality.name='Француз'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Эмре', 'Акбаба', '1992-09-04', (select id from Teams where Teams.name='Галатасарай'), (select id from nationality where nationality.name='Турок'));
insert into players (name, surname, dateofbirth, team, nationality)
  values ('Харун', 'Текин', '1989-07-17', (select id from Teams where Teams.name='Фенербахче'), (select id from nationality where nationality.name='Турок'));

insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Челси'), (select id from Ligue where ligue.name='АПЛ'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Челси'), (select id from Ligue where ligue.name='Лига европы'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Арсенал'), (select id from Ligue where ligue.name='АПЛ'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Арсенал'), (select id from Ligue where ligue.name='Лига европы'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='ЦСКА'), (select id from Ligue where ligue.name='РПЛ'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='ЦСКА'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Локомотив'), (select id from Ligue where ligue.name='РПЛ'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Локомотив'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Зенит'), (select id from Ligue where ligue.name='РПЛ'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Зенит'), (select id from Ligue where ligue.name='Лига европы'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Бавария'), (select id from Ligue where ligue.name='Бундеслига'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Бавария'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Реал Мадрид'), (select id from Ligue where ligue.name='Испанская лига'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Реал Мадрид'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Барселона'), (select id from Ligue where ligue.name='Испанская лига'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Барселона'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='ПСЖ'), (select id from Ligue where ligue.name='Франц первая лига'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='ПСЖ'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Марсель'), (select id from Ligue where ligue.name='Франц первая лига'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Марсель'), (select id from Ligue where ligue.name='Лига европы'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Милан'), (select id from Ligue where ligue.name='Итальянская серия А'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Милан'), (select id from Ligue where ligue.name='Лига европы'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Ювентус'), (select id from Ligue where ligue.name='Итальянская серия А'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Ювентус'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Галатасарай'), (select id from Ligue where ligue.name='Турецкая суперлига'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Галатасарай'), (select id from Ligue where ligue.name='Лига чемпионов'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Фенербахче'), (select id from Ligue where ligue.name='Турецкая суперлига'));
insert into TeamsLigues (team, ligue) values ((select id from Teams where Teams.name='Фенербахче'), (select id from Ligue where ligue.name='Лига европы'));