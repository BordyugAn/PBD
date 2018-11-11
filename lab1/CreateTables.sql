use football;

create type YearFoundation from nvarchar(4) not null;

create table Ligue(
    id Numeric not null primary key identity(1, 1),
    name NVARCHAR(20) not null
);

create TABLE nationality(
    id NUMERIC not null primary key identity(1, 1),
    name NVARCHAR(20) not null
);


create table Teams(
    id numeric not null PRIMARY KEY identity(1, 1),
    name NVARCHAR(20) not null,
    stadium NVARCHAR(20) not null,
    yearFoundation YearFoundation not null,
);

create TABLE players(
    id NUMERIC not null primary key identity(1, 1),
    name NVARCHAR(20) not null,
    surname NVARCHAR(20) not null,
    dateofbirth DATE,
    team NUMERIC,
    nationality NUMERIC,
    CONSTRAINT FK_TEAM
        FOREIGN KEY(team)
        REFERENCES TEAMS(ID),
    CONSTRAINT FK_NATIONALITY
        FOREIGN KEY(nationality)
        REFERENCES NATIONALITY(ID)
);

create table TeamsLigues(
    team NUMERIC not null,
    ligue NUMERIC not null,
    CONSTRAINT FK_LIGUE2
        FOREIGN KEY(ligue)
        REFERENCES LIGUE(id),
    CONSTRAINT FK_TEAM2
        FOREIGN KEY(team)
        REFERENCES Teams(id),
    PRIMARY KEY (team, ligue)
);

create index idx_players on players (name, surname);

create index idx_teams on Teams (name);

go;