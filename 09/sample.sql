drop table if exists xmas_data;

create table xmas_data (id serial primary key, value int not null);

insert into xmas_data (value) values
(35),
(20),
(15),
(25),
(47),
(40),
(62),
(55),
(65),
(95),
(102),
(117),
(150),
(182),
(127),
(219),
(299),
(277),
(309),
(576);
