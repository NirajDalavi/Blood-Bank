create database if not exists bloodbank;
use bloodbank;

create table if not exists donor(
    donor_id varchar(10) not null primary key,
    donor_name varchar(30) not null,
    donor_gender char(1) not null,
    donor_dob DATE not null,
    donor_bg varchar(3) not null,
    donor_phone varchar(15) not null,
    donor_address text not null
);

create table if not exists staff(
    staff_id varchar(10) not null primary key,
    staff_name varchar(30) not null,
    staff_role varchar(15) not null,
    staff_gender char(1) not null,
    staff_dob date not null,
    staff_bg varchar(3) not null,
    staff_phone varchar(15) not null,
    staff_address text not null
);

create table if not exists hospital(
    hospital_id varchar(12) not null primary key,
    hospital_name text not null,
    hospital_phone varchar(10) not null,
    hospital_address text not null
);

create table if not exists patient(
    patient_id varchar(10) not null primary key,
    patient_name varchar(30) not null,
    patient_gender varchar(1) not null,
    patient_dob date not null,
    patient_bg varchar(3) not null,
    patient_phone varchar(15) not null,
    patient_address text not null
);

create table if not exists donationcamp(
    camp_id varchar(10) not null primary key,
    camp_date date not null,
    camp_location text not null,
    camp_organizers text not null
);

create table if not exists registration(
    camp_id varchar(10) not null,
    donor_id varchar(10) not null,
    date_of_reg date not null,
    foreign key(donor_id) references donor(donor_id) on delete cascade,
    foreign key(camp_id) references donationcamp(camp_id) on delete cascade
);

create table if not exists repository(
    blood_id varchar(10) not null primary key,
    blood_group varchar(3) not null,
    RBC integer not null,
    Platelets integer not null,
    PLasma integer not null
);

create table if not exists Blood_Components(
    component_type varchar(3) not null;
    blood_id varchar(10) not null,
    packet_id varchar(10) not null primary key,
    ext_date date not null,
    exp_date date not null,
    foreign key(blood_id) references repository(blood_id) on delete cascade
);


create table if not exists donates(
    donor_id varchar(10) not null,
    staff_id varchar(10) not null, 
    don_type char(15) not null,
    don_occasion char(10) not null,
    don_date date not null,
    next_date date not null,
    foreign key(donor_id) references donor(donor_id) on delete cascade,
    foreign key(staff_id) references staff(staff_id) on delete cascade
    
);

create table if not exists admits(
    hospital_id varchar(10) not null,
    patient_id varchar(10) not null,
    patient_case varchar(30) not null,
    date_of_admission date not null,
    foreign key(hospital_id) references hospital(hospital_id) on delete cascade,
    foreign key(patient_id) references patient(patient_id) on delete cascade
);

create table if not exists blood(
    donor_id varchar(10) not null,
    sample_id varchar(10) not null primary key,
    foreign key(donor_id) references donor(donor_id) on delete cascade
);

create table if not exists tested_by(
    sample_id varchar(10) not null,
    staff_id varchar(10) not null ,
    result varchar(8) not null,
    foreign key(staff_id) references staff(staff_id) on delete cascade,
    foreign key(sample_id) references blood(sample_id) on delete cascade
);

create table if not exists req_rec(
    hospital_id varchar(10) not null,
    patient_id varchar(10) not null,
    patient_case varchar(30) not null,
    req_bg varchar(3) not null,
    req_type varchar(10) not null,
    qty integer not null,
    foreign key(hospital_id) references hospital(hospital_id) on delete cascade,
    foreign key(patient_id) references patient(patient_id) on delete cascade
);

show tables;


insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('07-1388053', 'Car Barnwell', 'Landscaper', 'F', 'Male', 'AB-', '1434520581', '028 Buell Circle');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('97-5745426', 'Galen Errichelli', 'Carpenter', 'F', 'Male', 'B+', '5649631213', '3980 Mallard Park');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('57-6117875', 'Sella Humbell', 'Cement Mason', 'F', 'Female', 'O+', '1352377028', '6238 Meadow Ridge Center');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('89-8871035', 'Beilul di Rocca', 'Plasterers', 'F', 'Female', 'B+', '9361083378', '8 Reinke Terrace');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('25-8346204', 'Aileen Beadell', 'Waterproofer', 'M', 'Female', 'AB-', '4908385029', '662 Morning Place');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('41-9018217', 'Tabbatha Ropkes', 'Glazier', 'M', 'Female', 'AB-', '6051801939', '7 Sunnyside Park');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('43-1237946', 'Denis Milson', 'Electrician', 'M', 'Male', 'B+', '9783904360', '79 Leroy Lane');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('95-5297699', 'Jesse Garey', 'Tile Setter', 'F', 'Female', 'O+', '1587373587', '54249 New Castle Place');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('45-0743893', 'Daphne Rickword', 'Pipefitter', 'M', 'Female', 'AB+', '2319723173', '85 Buena Vista Alley');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('90-0175079', 'Bonnie Watford', 'Equipment Operator', 'F', 'Female', 'AB+', '1567985206', '68 Spaight Street');

insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('142020DE', '2019/12/18', 'Reforma', 'McCullough Inc');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('222022DE', '2019/02/10', 'Issoire', 'Koch-O''Kon');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('752021NO', '2021/10/10', 'Sandaogou', 'Friesen Group');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('492021DE', '2019/05/12', 'Qiakeri', 'Armstrong, Friesen and Lynch');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('542021OC', '2021/11/03', 'Kujang-ŭp', 'Schuppe LLC');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('842022NO', '2020/02/09', 'Vyatskiye Polyany', 'Wehner-Ebert');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('092021DE', '2022/09/12', 'Macha', 'Olson-Nader');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('172022SE', '2021/09/26', 'Shaydon', 'White, West and Lind');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('512020DE', '2019/02/14', 'Padang', 'Upton Inc');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('902021NO', '2019/05/17', 'Uinskoye', 'Deckow Inc');


insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('ON0001', 'O-', '4.7', '4.0', '0.4');
insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('ABP002', 'AB+', '4.8', '0.9', '5.2');
insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('OP0003', 'O+', '5.6', '8.3', '1.6');
insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('AP0004', 'A+', '5.9', '7.6', '9.0');
insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('BN0005', 'B-', '9.1', '8.6', '8.2');
insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('ABN006', 'AB-', '9.3', '7.2', '3.4');
insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('BP0007', 'B+', '5.2', '1.4', '7.2');
insert into repository (blood_id, blood_group, RBC, Platelets, PLasma) values ('AN0008', 'A-', '2.4', '4.9', '3.0');
