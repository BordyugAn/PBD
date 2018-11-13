create procedure getPauyers
  as
  select players.name, players.surname, Teams.name, Teams.stadium, Teams.yearFoundation
  from players, Teams
  where Teams.id=players.team;

  getPauyers;

  sp_help players;

  sp_help Teams;

  sp_helptext PlayersTeams;

