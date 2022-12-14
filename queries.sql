--Simple Queries
select * from donor where donor_bg='B+';
select * from Blood_Components where component_type='RBC';
select * from receives where req_status='completed' order by req_id;
update donor set donor_phone='9341598098' where donor_id='DON72BP95';
delete from donor where donor_id='DON12ON55';

--Nested Queries
select staff_name from staff where staff_id in (select staff_id from tested_by where sample_id ='SPL5760'); -- to check which staff tested the given blood sample
select * from donor where donor_id in(select donor_id from+ donates where don_occasion='Emergency');-- to list the donor who donated during an emergency
select * from donor where donor_id in (select donor_id from blood where sample_id in (select sample_id from tested_by where result = 'POSITIVE')); --all the donors 
who were positive i.e. who had infectious components in their blood are displayed.
select hospital_name from hospital where hospital_id in(select hospital _id from admits where patient_case='Surgery');--list all the hospital in which
patients have been admitted for surgery
select * from hospital where hospital_id in(select hospital_id from request where req_id in(select req_id from receives where req_status='pending'));-- lsit of hospitals 
whose requests are pending
select * from donor where donor_bg in(select req_bg from request where req_id in(select req_id from receives where req_status='denied')); -- providing donor details for
a rare blood request that has been denied
select * from donor where donor_bg in(select req_bg from request where req_id in(select req_id from receives where req_status='pending' )) and donor_address like "%Tilaknagar%";
--Contacting donors in tilaknagar before allocating a rarer blood group from cross match as the required blood group is out of stock 

--Order by
select * from receives where req_status='completed'  order by req_id; --requests that have been satisfied
select * from tested_by where result='Positive' order by sample_id; -- Listing donors who are positive for infections

--Group by
select count(req_id),req_type from request group by req_type;  -- grouping 
select count(donor_id),donor_bg from donor group by donor_bg;

--Having
select count(donor_id),donor_bg from donor group by donor_bg having count(donor_id)>=2;
select hospital_id,req_bg,qty from request group by qty having qty>350;

--Like
select * from donor where donor_address like "%Kuvempunagar%";
select * from hospital where hospital_address like "%Mohalla%";

--Between
select * from repository where RBC between 5 and 10;

--Set Operations
select donor_name,donor_phone from donor except select patient_name,patient_phone from patient; // donors who are not pateints
select donor_name,donor_phone from donor intersect select patient_name,patient_phone from patient; // donors who are pateints

