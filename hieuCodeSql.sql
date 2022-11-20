create database controller;
use controller;
create table config(
	id_config int primary key auto_increment,
    source_http_url varchar(1000),
    file_name varchar(1000),
    author varchar(500),
    mail varchar(500)
);
create table file_log(
	id_file INT PRIMARY KEY AUTO_INCREMENT,
    id_config int,
    date_create	timestamp default current_timestamp,
    log_status varchar(20),
    author varchar(500),
    paths varchar(500)
);

create table origin(
	id int auto_increment primary key,
    khuvuc_hethong varchar(500) not null,
    khuvuc varchar(500),
    hethong varchar(500),
    giamua double,
    giaban double,
    ngaycapnhat varchar(500),
    isdelete bool,
    expiredate timestamp,
    ischoose bool
);


-- _______________________________________________của Hieu 
-- drop  table staging;
-- // create table staging
create table staging(
    id int primary key auto_increment,
	khuvuc_hethong varchar(500)not null ,
    khuvuc varchar(500),
    hethong varchar(500),
    giamua double,
   giaban double,
--   giamua varchar(50),
--     giaban varchar(50),
    chenhLech double ,
    ngaycapnhat varchar(500)
--  dateCreate timestamp default current_timestamp
-- ngaycapnhat timestamp
);



-- //________________________create procedure load file to load file from local to table staging 
DELIMITER &&
create procedure load_file_to_staging (paths varchar (2000))
begin 

declare lv_data varchar(4000);
declare lv_line  varchar(4000);
declare lv_temp_p int ;

-- find paths whose today and status is ER
-- SELECT  paths
-- FROM file_log 
-- WHERE date_create >= CURDATE() and log_status="ER"
-- into temp_path;

select convert (load_file(paths) 
using utf8mb4 
)


into lv_data
 ;
loop_label: loop 
select instr(lv_data,'\n')
into lv_temp_p;
select substr(lv_data,1, lv_temp_p-1)
into lv_line ;
-- if( length(SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',1),',',-1))>0)then 
if (length(SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',1),',',-1)) >0) then 
insert into staging(
	khuvuc_hethong ,
    khuvuc,
    hethong ,
    giamua ,
   giaban ,
    chenhLech  ,
 ngaycapnhat 
)
values (
SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',1),',',-1),
SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',2),',',-1),
SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',3),',',-1),
SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',4),',',-1),
SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',5),',',-1),
SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',6),',',-1),
SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',7),',',-1)

);
end if ;

select substr(lv_data, lv_temp_p+1)
into lv_data ;

if lv_temp_p <=0  then 
leave loop_label ;
end if ;

 iterate loop_label ;
-- // không được 

-- set log_status ="TR";
end loop;
end&&

-- call load_file_to_staging ("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/04-10-22_16-22-06.csv");
call load_file_to_staging ("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/27-10-22_15-45-48.csv");






-- // ___________________________create table date_min
drop table date_dim;

create table date_dim ( 
date_sk   varchar(500),
-- date_sk  varchar(500), 
full_date varchar(500), 
day_since_2005 varchar(500), 
month_since_2005  varchar(500), 
day_of_week varchar(500), 
calendar_month varchar(500), 
calendar_year varchar(500), 
calendar_year_month varchar(500), 
day_of_month varchar(500), 
day_of_year varchar(500), 
week_of_year_sunday varchar(500), 
year_week_sunday varchar(500), 
week_sunday_start varchar(500), 
week_of_year_monday varchar(500), 
year_week_monday varchar(500), 
week_monday_start varchar(500), 
holiday varchar(500), 
day_type varchar(500)
);



-- // __________________load file date_min from local to table date_dim
declare paths 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/date_dim_without_quarter.csv';
LOAD DATA INFILE  paths
INTO TABLE date_dim 
FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( 

date_sk , 
full_date , 
day_since_2005 , 
month_since_2005  , 
day_of_week , 
calendar_month , 
calendar_year , 
calendar_year_month , 
day_of_month , 
day_of_year , 
week_of_year_sunday , 
year_week_sunday , 
week_sunday_start , 
week_of_year_monday , 
year_week_monday , 
week_monday_start , 
holiday , 
day_type 
);
SHOW VARIABLES LIKE "secure_file_privfile_log";
select*from file_log;
select*from date_dim;


-- // create  procedure find day which is today

-- // create procedure find lines at columns "dateCreate" which hava date today and column "stutus" is " ER " in table file_log _____________________________________________________

--  // procedures today is find lines is today at columns dateCreate  and  status =ER at columns log_status in table file_log 
DELIMITER &&
create procedure today() 
begin
SELECT   paths ,log_status
FROM file_log 
WHERE date_create >= CURDATE() and log_status="ER";
end&&
call today();


-- //  ________________________________create tables dim khuvuc , hethong , dateCreate khuvuc_hethong 
create table dim_area(
id_khuVuc int primary key auto_increment,
tenkhuVuc varchar(500)
);

create table dim_heThong(
id_heThong int primary key auto_increment,
tenHeThong varchar(500)
);
-- ________________________________ create table dim_khuvuc_hethong  
create table dim_khuvuc_hethong(
id_khuvuc_hethong int primary key auto_increment,
tenKhuVuc_HeThong varchar(500)
);
--  _____________________________ create table dim_dateCreate 
create table dim_dateCreate(
id_dateCreate varchar(500),
 dateCreate varchar(500) primary key 

);










-- // create procedure clean data column ngayCapNhat_______________________________

-- procedure cleankhuvuc() ,Cursor browse line by line (learn about cursor in MySQL Workbench)
--  cleankhuvuc() is convert  values at columns khuvuc from table staging to number

delimiter $$
create procedure cleanKhuVuc()
begin
	DECLARE done INT DEFAULT FALSE;
	declare kv1 varchar(500);
    declare id_khuvuc1 int default -1;
	declare cur1 cursor for select khuvuc from staging;
    declare continue handler for not found set done = true;
    open cur1;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur1 into kv1;
    -- khu vuc deal

    set id_khuvuc1 = (select id_khuVuc from dim_khuVuc where  tenKhuVuc = kv1);

    if id_khuvuc1 then

		update staging set khuvuc = id_khuvuc1 where khuvuc=kv1;
	else
		insert into dim_khuvuc(tenKhuVuc) values(kv1);
        set id_khuvuc1 = (select id_khuVuc from dim_khuvuc where tenkhuVuc = kv1);
        update staging set khuvuc = id_khuvuc1 where khuvuc=kv1;
	end if;
   end loop;
    close cur1;
end $$
delimiter ;
call cleanKhuVuc();
-- procedure he thong ,Cursor browse line by line (learn about cursor in MySQL Workbench)

--  is convert  values at columns hethong from table staging to number

delimiter $$
create procedure cleanHeThong()
begin
	DECLARE done INT DEFAULT FALSE;
	declare ht1 varchar(500);
    declare id_hethong1  int default -1;
	declare cur2 cursor for select hethong from staging;
    declare continue handler for not found set done = true;
    open cur2;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur2 into ht1;
    -- khu vuc deal
    set id_hethong1 = (select id_heThong from dim_hethong where tenHeThong = ht1);
    if id_hethong1 then
		update staging set hethong = id_hethong1 where hethong=ht1;
	else
		insert into dim_hethong(tenHeThong) values(ht1);
        set id_hethong1 = (select id_heThong from dim_hethong where tenHeThong = ht1);
        update staging set hethong = id_hethong1 where hethong=ht1;
	end if;
   end loop;
    close cur2;
end $$
delimiter ;
call   cleanHeThong();


-- create procedure  khuvuc_hethong to convert values at columns "khuvuc_hethong" to id of dim_khuvuc_hehthong when 
-- when the value makes each line the same 
delimiter $$
create procedure cleanKhuVucHeThong()
begin
	DECLARE done INT DEFAULT FALSE;
	declare kvht varchar(500);
    declare  id_kvht1  int default -1;
	declare cur2 cursor for select khuvuc_hethong from staging;
    declare continue handler for not found set done = true;
    open cur2;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur2 into kvht;
    -- khu vuc deal
    set id_kvht1 = (select id_khuvuc_hethong from dim_khuvuc_hethong where tenKhuVuc_HeThong = kvht);
    if id_kvht1 then
		update staging set khuvuc_hethong = id_kvht1 where khuvuc_hethong=kvht;
	else
		insert into dim_khuvuc_hethong(tenKhuVuc_HeThong) values(kvht);
        set id_kvht1 = (select id_khuvuc_hethong from dim_khuvuc_hethong where tenKhuVuc_HeThong = kvht);
        update staging set khuvuc_hethong = id_kvht1 where khuvuc_hethong=kvht;
	end if;
   end loop;
    close cur2;
end $$
delimiter ;
call cleanKhuVucHeThong();

-- ________________________clean ngay cap nhat _________________________draft
--  is convert  values at columns hethong from table staging to number

-- the procedere is go through each line (using cursor ), compare the updated date value in
--  the   column ngaycapnhat  is equal to the values at columns full_date in table date_dim
--  if so, set values  date create at "dateCreate" column at dim_dateCreate table  aquals "ngaycapnhat " column at table staging
--   then set the values of fulldate for ngaycapnhat at  table staging ,

delimiter $$
create procedure  cleanDateCreate()
begin
	DECLARE done INT DEFAULT FALSE;
	declare ncn varchar(500);
        declare id_ngaycapnhat1 varchar(500);
	declare cur3 cursor for 
    select ngaycapnhat from staging;
    declare continue handler for not found set done = true;
    open cur3;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur3 into ncn ;
        set id_ngaycapnhat1 = (select date_sk from date_dim 
        where date(full_date)= date(ncn));
        
   if  id_ngaycapnhat1  then
       		update staging set ngaycapnhat = id_ngaycapnhat1
            where ngaycapnhat=ncn;
            
   insert into dim_datecreate(id_dateCreate,dateCreate)
   values(id_ngaycapnhat1,ncn);

  else
     	insert into dim_datecreate(dateCreate)
        values(ncn);

    		update staging set ngaycapnhat = id_ngaycapnhat1
            where ngaycapnhat=ncn;

        set id_ngaycapnhat1 = (select date_sk from date_dim 
        where date(full_date)= date(ncn));
 end if;
   end loop;
    close cur3;
end $$
delimiter ;
call cleanDateCreate();

-- _________________________________________________________draft all 

-- create  column contain  variable hardcode in java  eclipse  into config  
alter table config 
add  column usernameMySQL varchar(500) after mail  ,
add  column passwordMySQL   varchar(500) after usernameMySQL ;
alter table config 
add  column usernameEmail  varchar(500) after passwordMySQL ,
add  column passwordEmail  varchar(500) after usernameEmail  ;
 ;
-- ______________________________________
 alter table config 
add  column dateTimeNow  varchar(500) after passwordEmail ;
alter table config 
add  column nameFileError  varchar(500) after dateTimeNow ;








