create database lab_Zuieva1;
use lab_Zuieva1;
create table mark (
	id_mark int unsigned auto_increment,
	mark varchar(35) not null unique,
	primary key(id_mark)
) ENGINE=INNODB;

create table model (
	id_model int unsigned auto_increment,
    model varchar(35) not null unique,
    mark_id INT UNSIGNED,
    PRIMARY KEY(id_model),
    FOREIGN KEY (mark_id) REFERENCES mark(id_mark)
)ENGINE=INNODB;

create table color (
	id_color int unsigned auto_increment,
    color varchar(50) not null unique,
    primary key(id_color)
)ENGINE=INNODB;

create table car_number (
	id_car_number int unsigned auto_increment,
    car_number varchar(10) not null unique,
    primary key(id_car_number)
)ENGINE=INNODB;

create table accounting (
	id_accounting int unsigned auto_increment,
    date_start date not null,
    date_end date not null,
    primary key(id_accounting)
)ENGINE=INNODB;

create table categories (
	id_categories int unsigned auto_increment,
    categories varchar(10) not null,
    primary key(id_categories)
)ENGINE=INNODB;

create table ownership_type (
	id_ownership_type int unsigned auto_increment,
    ownership_type varchar(50) not null,
    primary key(id_ownership_type)
)ENGINE=INNODB;

create table car (
	id_car int unsigned auto_increment,
    id_mark int unsigned not null,
    id_model int unsigned not null,
    id_color int unsigned not null,
    id_accounting int unsigned not null,
    id_car_number int unsigned not null,
    id_categories int unsigned not null,
    primary key(id_car),
    foreign key(id_mark) references mark (id_mark) on delete restrict on update cascade,
    foreign key(id_model) references model (id_model) on delete restrict on update cascade,
    foreign key(id_color) references color (id_color) on delete restrict on update cascade,
    foreign key(id_accounting) references accounting (id_accounting) on delete restrict on update cascade,
    foreign key(id_car_number) references car_number (id_car_number) on delete restrict on update cascade,
    foreign key(id_categories) references categories (id_categories) on delete restrict on update cascade,
    sit varchar(50) not null,
	body_type varchar(50) not null,
    engine_type varchar(50) not null
)ENGINE=INNODB;

CREATE TABLE city
(
    id_city INT UNSIGNED AUTO_INCREMENT,
    city_name VARCHAR(60) NOT NULL UNIQUE,
    PRIMARY KEY (id_city)
) ENGINE=INNODB;

CREATE TABLE street
(
    id_street INT UNSIGNED AUTO_INCREMENT,
    street_name VARCHAR(80) NOT NULL UNIQUE,
    city_id INT UNSIGNED,
    PRIMARY KEY (id_street),
    FOREIGN KEY (city_id) REFERENCES city(id_city)
) ENGINE=INNODB;

CREATE TABLE building_number
(
    id_building_number INT UNSIGNED AUTO_INCREMENT,
    building_number VARCHAR(10) NOT NULL,
    flat_number VARCHAR(10) NULL DEFAULT NULL,
    street_id INT UNSIGNED,
    PRIMARY KEY (id_building_number),
    FOREIGN KEY (street_id) REFERENCES street(id_street)
) ENGINE=INNODB;

CREATE TABLE address
(
	id_address int unsigned auto_increment,
	id_street int unsigned not null,
    id_city int unsigned not null,
    id_building_number int unsigned not null,
	primary key(id_address),
	foreign key(id_street) REFERENCES street (id_street) ON delete restrict on update cascade,
    foreign key(id_city) references city (id_city) on delete restrict on update cascade,
    foreign key(id_building_number) references building_number (id_building_number) on delete restrict on update cascade
) ENGINE=INNODB;

create table passport (
	id_passport int unsigned auto_increment,
	first_name varchar(50) not null,
	middle_name varchar(50) null,
	last_name varchar(50) not null,
	birth_date date null,
    sex varchar(50) not null,
    passport_number varchar(50) not null,
    id_address int unsigned not null,
    primary key(id_passport),    
    foreign key(id_address) references address (id_address) on delete restrict on update cascade
)ENGINE=INNODB;

create table driver_license (
    license_number varchar(10) not null,
    department_name varchar(50) not null,
    date_of_receiving date not null,
	id_driver_license int unsigned auto_increment,
    id_categories int unsigned not null,
    id_driver_license_data int unsigned not null,
    primary key(id_driver_license),
    foreign key(id_categories) references categories (id_categories) on delete restrict on update cascade
)ENGINE=INNODB;

create table driver (
	id_driver int unsigned auto_increment,
    id_passport int unsigned not null,
    id_driver_license int unsigned not null,
    id_car int unsigned not null,
    primary key(id_driver),    
	foreign key(id_car) references car (id_car) on delete restrict on update cascade,
    foreign key(id_passport) references passport (id_passport) on delete restrict on update cascade,
    foreign key(id_driver_license) references driver_license (id_driver_license) on delete restrict on update cascade
)ENGINE=INNODB;

create table car_by_driver (
	id_driver int unsigned not null,
    id_car int unsigned not null,
    foreign key(id_driver) references driver (id_driver) on delete restrict on update cascade,
    foreign key(id_car) references car (id_car) on delete restrict on update cascade
)ENGINE=INNODB;

create table accident (
	id_accident int unsigned auto_increment,
    description_a varchar(50) not null,
    date_time_accident datetime not null,     
    id_address int unsigned not null,
    id_driver int unsigned not null,
	id_car int unsigned not null,
    foreign key(id_car) references car (id_car) on delete restrict on update cascade,
    foreign key(id_driver) references driver (id_driver) on delete restrict on update cascade,
	foreign key(id_address) REFERENCES address (id_address) ON delete restrict on update cascade,
    primary key(id_accident)
)ENGINE=INNODB;

create table employer_rank (
	id_employer_rank int unsigned auto_increment,
	rank_a varchar(15) not null,
    primary key(id_employer_rank)
)ENGINE=INNODB;

create table employer_position (
	id_employer_position int unsigned auto_increment,
    position_a varchar(15) not null,
    primary key(id_employer_position)
)ENGINE=INNODB;

create table employer (
	id_employer int unsigned auto_increment,
    id_employer_rank int unsigned not null,
    id_employer_position int unsigned not null,
    primary key(id_employer),
    foreign key(id_employer_rank) references employer_rank (id_employer_rank) on delete restrict on update cascade,
    foreign key(id_employer_position) references employer_position (id_employer_position) on delete restrict on update cascade
)ENGINE=INNODB;









INSERT INTO mark (mark) VALUES
('Шкода'),
('Мерседес'),
('БМВ'),
('Лексус'),
('Вольво');

INSERT INTO model (model, mark_id) VALUES
('Октавія', 1),
('170', 2),
('М5', 3),
('570', 4),
('В50', 5);

INSERT INTO color (color) VALUES
('Чорний'),
('Сріблястий'),
('Червоний'),
('Білий'),
('Синій');

INSERT INTO car_number (car_number) VALUES
('АВ1524КК'),
('АВ3698АА'),
('АВ2154ОА'),
('AB9763КВ'),
('АВ1245ВС');

INSERT INTO accounting (date_start, date_end) VALUES
('2023-01-01', '2023-02-01'),
('2023-02-01', '2023-03-01'),
('2023-03-01', '2023-04-01'),
('2023-04-01', '2023-05-01'),
('2023-05-01', '2023-06-01');

INSERT INTO categories (categories) VALUES
('В'),
('В'),
('В'),
('В'),
('В');

INSERT INTO ownership_type (ownership_type) VALUES
('Фізична особа'),
('Юридична особа'),
('Юридична особа'),
('Фізична особа'),
('Фізична особа');

INSERT INTO car (id_mark, id_model, id_color, id_accounting, id_car_number, id_categories, body_type, engine_type, sit) VALUES
(1, 1, 1, 1, 1, 1, 'Седан', 'Газ', '4'),
(2, 2, 2, 2, 2, 2, 'Мінівен', 'Дизель', '6'),
(3, 3, 3, 3, 3, 3, 'Хетчбек', 'Електро', '3'),
(4, 4, 4, 4, 4, 4, 'Мінівен', 'Гібрид', '5'),
(5, 5, 5, 5, 5, 5, 'Седан', 'Бензин', '8');

INSERT INTO city (city_name) VALUES
('Вінниця'),
('Київ'),
('Рівне');

INSERT INTO street (street_name, city_id) VALUES
('Петра Могили', 1),
('Павла Корнелюка', 1),
('Київська', 2),
('Маріупольська', 2),
('Якова шепеля', 3);

INSERT INTO building_number (building_number, flat_number, street_id) VALUES
('177', '23', 1),
('8', '56', 2),
('72', '6', 3),
('11', '7', 4),
('3', '77', 5);

INSERT INTO address (id_street, id_city, id_building_number) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 2, 4),
(5, 1, 5);

INSERT INTO passport (first_name, middle_name, last_name, birth_date, sex, passport_number, id_address) VALUES
('Джон', 'Доу', 'Сміт', '1990-01-15', 'Чоловік', '1234567890', 2),
('Джейн', 'Шу', 'Джонсон', '1988-04-20', 'Жінка', '9876543210', 3),
('Майкл', 'Браун', 'Вілсон', '1995-11-10', 'Чоловік', '5678901234', 5),
('Емілі', 'Девіс', 'Міллер', '1992-07-30', 'Жінка', '4321098765', 1),
('Вільям', 'Джонс', 'Тейлор', '1985-12-05', 'Чоловік', '2345678901', 4);

INSERT INTO driver_license (license_number, department_name, date_of_receiving, id_categories, id_driver_license_data) VALUES
('DL12345', 'D1', '2022-02-10', 1, 1),
('DL67890', 'D2', '2022-03-20', 2, 2),
('DL54321', 'D3', '2022-04-15', 3, 3),
('DL98765', 'D4', '2022-05-05', 4, 4),
('DL23456', 'D5', '2022-06-30', 5, 5);

INSERT INTO driver (id_passport, id_driver_license, id_car) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO accident (description_a, date_time_accident, id_address, id_driver, id_car) VALUES
('ДТП', '2023-03-15 08:30:00', 1, 1, 1),
('ДТП', '2023-04-20 14:45:00', 2, 2, 2),
('ДТП', '2023-05-10 17:20:00', 2, 3, 3),
('ДТП', '2023-06-05 11:10:00', 5, 4, 4),
('ДТП', '2023-06-25 09:00:00', 5, 5, 5);

INSERT INTO car_by_driver (id_driver, id_car) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO employer_rank (rank_a) VALUES
('Майор'),
('Генерал'),
('Інспектор'),
('Лейтенант'),
('Сержант');

INSERT INTO employer_position (position_a) VALUES
('Кабінет 32'),
('Кабінет 12'),
('Кабінет 23'),
('Кабінет 22'),
('Кабінет 21');

INSERT INTO employer (id_employer_rank, id_employer_position) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);






SELECT * FROM accident;
SELECT * FROM accounting;
SELECT * FROM address;
SELECT * FROM building_number;
SELECT * FROM car;
SELECT * FROM car_by_driver;
SELECT * FROM car_number;
SELECT * FROM categories;
SELECT * FROM city;
SELECT * FROM color;
SELECT * FROM driver;
SELECT * FROM driver_data;
SELECT * FROM employer;
SELECT * FROM employer_rank;
SELECT * FROM employer_position;
SELECT * FROM mark;
SELECT * FROM model;
SELECT * FROM ownership_type;
SELECT * FROM passport;
SELECT * FROM street;