create database primeiroBanco;

use primeiroBanco; -- habilita o uso do DB

-- exercicio 1
create table Paises(
	country_id    varchar(2), -- variavel de caracteres com limite de digitos
    country_name  varchar(40),
    region_id     decimal(10,0)
);

-- exercicio 2
-- cria a tabela se não existir outra com o mesmo nome
create table IF NOT EXISTS Paises(
	country_id    varchar(2), 
    country_name  varchar(40),
    region_id     decimal(10,0)
);

-- exercicio 3
-- cria uma tabela identica com base em outra
create table if not exists dup_countries like paises;

-- exercicio 5
-- NOT NULL sinaliza que o valor é obrigatório, não pode ficar vazio
create table if not exists countries(
	countryID varchar(2) NOT NULL,
    countryName varchar(40) not null,
    regionID decimal(10,0) not null
);

-- exercicio 6
-- CHECK > verifica uma condição
create table jobs(
	jobID varchar(10) not null,
    jobTitle varchar(35) not null,
    minSalary decimal(6,0),
    maxSalary decimal(6,0),
    CHECK(maxSalary <= 25000)
);

-- exercicio 7
create table paises2(
	countryID varchar(2) not null,
    countryName varchar(40) not null,
    -- IN > vai verificar se um item está dentro de uma lista
    check(countryName in('Italy', 'India', 'China')),
    regionID decimal(10,0) not null
);

-- exercicio 8
create table jobHistory(
	employeeID decimal(6,0),
    startDate date not null,
    endDate date not null
    -- define um formato especifico para DATE
    check (endDate like '--/--/----'),
    jobID varchar(10) not null,
    departamentID decimal(4, 0) not null
);

-- exercicio 9
create table if not exists countries3(
	countryID varchar(2) not null,
    countryName varchar(40) not null,
    regionId decimal(6,0) not null,
    -- não permite dados duplicados no campo
    UNIQUE(CountryID)
);

-- exercicio 10
create table jobs2(
	jobID varchar(10) not null unique,
    -- DEFAULT > define um valor padrão para um campo caso não seja inserido um valor especifico
    jobTitle varchar(40) DEFAULT '',
    check(jobTitle like ' '),
    minSalary decimal(6,0) DEFAULT 8000,
    maxSalary decimal(6,0) DEFAULT NULL
);

-- exercicio 11 
create table if not exists countries4(
	countryID varchar(2) not null unique primary key,
    countryName varchar(40) not null,
    regionId decimal(6,0) not null
);
