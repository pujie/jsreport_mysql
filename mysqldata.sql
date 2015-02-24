--sample database
create table users(id int primary key auto_increment,username varchar(50));
create table clients(id int primary key auto_increment,name varchar(50),address varchar(100));
create table survey_sites(id int primary key auto_increment,survey_request_id int,pic_name varchar(50),pic_position varchar(10),pic_phone_area varchar(5),pic_phone varchar(10),address varchar(100));
insert into users(username) values ('puji');
insert into clients(name,address) values ('Wadimor, PT','Sukorejo-Semarang');
insert into clients(name,address) values ('Insan Mulia, PT','Surabaya');
insert into clients(name,address) values ('Zahira, PT','Jakarta');

insert into survey_sites(survey_request_id,pic_name,pic_position,pic_phone_area,pic_phone,address) values (1,'Widada','HRD Manager','025','88799xxx','Semarang');
insert into survey_sites(survey_request_id,pic_name,pic_position,pic_phone_area,pic_phone,address) values (1,'Sumanto','HRD Manager','025','82599xxx','Semarang');
insert into survey_sites(survey_request_id,pic_name,pic_position,pic_phone_area,pic_phone,address) values (1,'Wanda','HRD Manager','025','88799xxx','Semarang');
insert into survey_sites(survey_request_id,pic_name,pic_position,pic_phone_area,pic_phone,address) values (2,'Junaidi','HRD Manager','031','32499xxx','Surabaya');
insert into survey_sites(survey_request_id,pic_name,pic_position,pic_phone_area,pic_phone,address) values (2,'Ponijan','HRD Manager','031','43799xxx','Surabaya');
insert into survey_sites(survey_request_id,pic_name,pic_position,pic_phone_area,pic_phone,address) values (3,'Tukimin','HRD Manager','021','21799xxx','Surabaya');
