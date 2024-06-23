drop database if exists dragons_dogma;
create database dragons_dogma;

create table categoria(
    id int primary key auto_increment,
    nombre varchar(10),
    habilidad varchar(20),
    elemento varchar(20)
);

create table vocacion(
    id int primary key auto_increment,
    nombre varchar(30),
    armamento varchar(50),
    armadura varchar(50)
);

create table tipo_item(
    id int primary key auto_increment,
    nombre varchar(10)
);

create table item(
    id int primary key auto_increment,
    nombre varchar(50),
    id_tipo int,
    foreign key (id_tipo) references tipo_item(id)
);

create table personaje(
    id int primary key auto_increment,
    nombre varchar(30),
    nivel int default 1,
    id_categoria int,
    id_vocacion int,
    foreign key (id_categoria) references categoria(id),
    foreign key (id_vocacion) references vocacion(id)
);

create table inventario(
    id int primary key auto_increment,
    id_personaje int,
    id_item int,
    foreign key (id_personaje) references personaje(id),
    foreign key (id_item) references item(id),
);



insert into categoria(nombre, habilidad, elemento) values
    ('Humano', null, 'Eléctrico'),
    ('Bestia', 'resistencia', 'Fuego'),
    ('Elfo', 'inteligencia', 'Dendro'),
    ('Orco', 'fuerza', 'Piedra');

insert into vocacion(nombre, armamento, armadura) values
    ('Arquero', 'Arco y flecha', 'Peto ligero'),
    ('Guerrero', 'Espadón', 'Fuego'),
    ('Hechicero', 'Archibastón', 'Cota de malla'),
    ('Lacero', 'Lanza', 'Peto'),
    ('Mago', 'Bastón', 'Bata');

insert into tipo_item(nombre) values 
    ('Poción'),
    ('Potenciador'),
    ('Transacción'),
    ('Skin');

insert into item(nombre, tipo) values
    ('Poción de vida', 1),
    ('Piedra teletransportadora', 2),
    ('Cabeza de medusa', 2),
    ('Moneda de oro', 3),
    ('Capa verde', 4),
    ('Corazón de dragón', 3);

