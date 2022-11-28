create database controller;
create database staging;
create database data_warehouse;

use controller;
CREATE TABLE config (
    id_config INT PRIMARY KEY AUTO_INCREMENT,
    source_http_url VARCHAR(1000),
    file_name VARCHAR(1000),
    author VARCHAR(500),
    mail VARCHAR(500)
);

-- _________________________________________________________draft all
-- create  column contain  variable hardcode from class.java  in  eclipse into config  
-- create  column contain add variable hardcode in eclipse  into config  
--  this is variable  contain  hardcode in class MailService.java
-- alter table config 
-- add column usernameEmail varchar(500) after passwordMySQL ,
-- add column passwordEmail varchar(500) after usernameEmail ;//
alter table config 
add  column dateTimeNow varchar(500) after mail ;

alter table config 
add column PathFileError varchar(500) after dateTimeNow ;
-- this is variable  contain  hardcode in class JsupRun3.java

-- this is paths save  file excel
alter table config 
add column PathFileExcel  varchar(500) after PathFileError ;

-- this is column path save  file csv
alter table config 
add column pathFileCsv  varchar(500) after PathFileExcel ;
-- column status 1,2,3,4 is status at column log_status in file_log table 

-- this is column status when run file not succesfuly
alter table config 
add column status1  varchar(500) after pathFileCsv ;

-- this is column status when load data from wesite to local successfuly 
alter table config 
add column status2  varchar(500) after status1 ;
 
-- this is column status when load file from local to table staging in mysql workbench successfuly 
alter table config 
add column status3  varchar(500) after status2 ;

-- this is status when load file from table staging  to data warehouse  successfuly 
alter table config 
add column status4  varchar(500) after status3 ;

alter table config 
add column status5  varchar(500) after status4 ;

--  //__________________________________hardcode in class ConnectionToFilelog.java
-- to connection to database we have address driver database  , path to database , user năme and  password of  dababase 
-- create column user name , password mysql
-- alter table config 
-- add column usernameMySQL varchar(500) after mail  ,
-- add column passwordMySQL   varchar(500) after usernameMySQL ;//

-- -- this is column address  driver to  connection to database after column passwordMySQL
-- alter table config 
-- add column addressDriver  varchar(500) after passwordMySQL ;// 

-- -- this is column  path connection to database 
-- alter table config 
-- add column url  varchar(500) after addressDriver ;// 

-- -- this is path connection to database 
-- alter table config 
-- add column url  varchar(500) after passwordMySQL ;// 

-- query  drop column 
-- alter table config 
-- drop column username ,
-- drop column passwordEmail ;
-- alter table config 
-- add  column passwordEmail  varchar(500) after usernameEmail ;

CREATE TABLE file_log (
    id_file INT PRIMARY KEY AUTO_INCREMENT,
    id_config INT,
    date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    log_status VARCHAR(20),
    author VARCHAR(500),
    paths VARCHAR(500)
);

use staging;
CREATE TABLE staging (
    id INT PRIMARY KEY AUTO_INCREMENT,
    khuvuc_hethong VARCHAR(500) NOT NULL,
    khuvuc VARCHAR(500),
    hethong VARCHAR(500),
    giamua DOUBLE,
    giaban DOUBLE,
    chenhlech DOUBLE,
    ngaycapnhat VARCHAR(500)
);
CREATE TABLE date_dim (
    date_sk INT ,
    full_date VARCHAR(500),
    day_since_2005 VARCHAR(500),
    month_since_2005 VARCHAR(500),
    day_of_week VARCHAR(500),
    calendar_month VARCHAR(500),
    calendar_year VARCHAR(500),
    calendar_year_month VARCHAR(500),
    day_of_month VARCHAR(500),
    day_of_year VARCHAR(500),
    week_of_year_sunday VARCHAR(500),
    year_week_sunday VARCHAR(500),
    week_sunday_start VARCHAR(500),
    week_of_year_monday VARCHAR(500),
    year_week_monday VARCHAR(500),
    week_monday_start VARCHAR(500),
    holiday VARCHAR(500),
    day_type VARCHAR(500)
);

-- load file date_min from local to table date_dim
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/date_dim_without_quarter.csv' INTO TABLE staging.date_dim FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( 
date_sk , 
full_date , 
day_since_2005 , 
month_since_2005 , 
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

create table dim_khuvuc(
id_khuvuc int primary key auto_increment,
tenkhuvuc varchar(500)
);
create table dim_heThong(
id_heThong int primary key auto_increment,
tenHeThong varchar(500)
);

create table dim_khuvuc_hethong(
id_khuvuc_hethong int primary key auto_increment,
tenKhuVuc_HeThong varchar(500)
);

use data_warehouse;
CREATE TABLE data_warehouse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    khuvuc_hethong VARCHAR(500) NOT NULL,
    khuvuc VARCHAR(500),
    hethong VARCHAR(500),
    giamua DOUBLE,
    giaban DOUBLE,
    ngaycapnhat INT,
    isdelete VARCHAR(5),
    expiredate INT
);
CREATE TABLE data_warehouse_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    khuvuc_hethong VARCHAR(500) NOT NULL,
    khuvuc VARCHAR(500),
    hethong VARCHAR(500),
    giamua DOUBLE,
    giaban DOUBLE,
    ngaycapnhat INT,
    isdelete VARCHAR(5),
    expiredate INT
);

-- Create data for `data_warehouse` and `file_log`
insert into controller.file_log (id_config,log_status,author) values (1,"ER","thuan");
insert into controller.config(source_http_url,file_name,author,mail) values("https://giavang.org/","thuanScriptToGiaVang","thuan","thuan0373535207@gmail.com");

-- ________________________________________________________________CỦA HIẾU________________________________________________________________
-- Create procedure load file to load file from local to table staging 
DELIMITER //
create procedure load_file_to_staging (paths varchar (2000))
begin 
declare lv_data varchar(4000);
declare lv_line  varchar(4000);
declare lv_temp_p int ;
truncate staging.staging;
-- find paths whose today and status is ER
-- SELECT  paths
-- FROM file_log 
-- WHERE date_create >= CURDATE() and log_status="ER"
-- into temp_path;
SELECT CONVERT(LOAD_FILE(paths) USING UTF8MB4) INTO lv_data;
update controller.file_log set file_log.paths=paths WHERE id_file = 1;
loop_label: loop 
SELECT instr(lv_data,'\n') INTO lv_temp_p;
SELECT SUBSTR(lv_data, 1, lv_temp_p - 1) INTO lv_line;
if (length(SUBSTRING_INDEX(SUBSTRING_INDEX(lv_line, ',',1),',',-1)) >0) then 
insert into staging.staging(khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,chenhlech ,ngaycapnhat)
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
SELECT SUBSTR(lv_data, lv_temp_p + 1) INTO lv_data;
if lv_temp_p <=0  then 
leave loop_label ;
end if ;
iterate loop_label ;
-- // không được 
end loop;
end //
call load_file_to_staging ("C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\25-11-22_19-30-25.csv");// -- //Cập nhật lại đường link

-- // create  procedure find day which is today
-- // create procedure find lines at columns "dateCreate" which hava date today and column "status" is " ER " in table file_log
-- // procedures today is find lines is today at columns dateCreate  and  status =ER at columns log_status in table file_log 
create procedure today(statuss varchar(500)) 
begin
SELECT paths ,log_status
FROM controller.file_log 
WHERE date_create >= CURDATE() and log_status=statuss;
end //
call today();//


-- //

-- procedure cleankhuvuc() ,Cursor browse line by line (learn about cursor in MySQL Workbench)
--  cleankhuvuc() is convert  values at columns khuvuc from table staging to number
create procedure cleanKhuVuc()
begin
	DECLARE done INT DEFAULT FALSE;
	declare kv1 varchar(500);
    declare id_kv1  int default -1;
	declare cur2 cursor for select khuvuc from staging.staging;
    declare continue handler for not found set done = true;
    open cur2;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur2 into kv1;
    -- khu vuc deal
    set id_kv1 = (select id_khuvuc from staging.dim_khuvuc where tenkhuvuc = kv1);
    if id_kv1 then
		update staging.staging set khuvuc = id_kv1 where khuvuc=kv1;
	else
		insert into staging.dim_khuvuc(tenkhuvuc) values(kv1);
    set id_kv1 = (select id_khuvuc from staging.dim_khuvuc where tenkhuvuc = kv1);
UPDATE staging.staging 
SET 
    khuvuc = id_kv1
WHERE
    khuvuc = kv1;
	end if;
   end loop;
    close cur2;
end //
call cleanKhuVuc()//

-- procedure he thong ,Cursor browse line by line (learn about cursor in MySQL Workbench)
--  is convert  values at columns hethong from table staging to number
create procedure cleanHeThong()
begin
	DECLARE done INT DEFAULT FALSE;
	declare ht1 varchar(500);
    declare id_hethong1  int default -1;
	declare cur2 cursor for select hethong from staging.staging;
    declare continue handler for not found set done = true;
    open cur2;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur2 into ht1;
    -- khu vuc deal
    set id_hethong1 = (select id_heThong from staging.dim_hethong where tenHeThong = ht1);
    if id_hethong1 then
		update staging.staging set hethong = id_hethong1 where hethong=ht1;
	else
		insert into staging.dim_hethong(tenHeThong) values(ht1);
        set id_hethong1 = (select id_heThong from staging.dim_hethong where tenHeThong = ht1);
UPDATE staging.staging SET hethong = id_hethong1 WHERE hethong = ht1;
	end if;
   end loop;
    close cur2;
end //
call cleanHeThong();//

-- create procedure  khuvuc_hethong to convert values at columns "khuvuc_hethong" to id of dim_khuvuc_hehthong when 
-- when the value makes each line the same 
create procedure cleanKhuVucHeThong()
begin
	DECLARE done INT DEFAULT FALSE;
	declare kvht varchar(500);
    declare  id_kvht1  int default -1;
	declare cur2 cursor for select khuvuc_hethong from staging.staging;
    declare continue handler for not found set done = true;
    open cur2;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur2 into kvht;
    -- khu vuc deal
    set id_kvht1 = (select id_khuvuc_hethong from staging.dim_khuvuc_hethong where tenKhuVuc_HeThong = kvht);
    if id_kvht1 then
		update staging.staging set khuvuc_hethong = id_kvht1 where khuvuc_hethong=kvht;
	else
		insert into staging.dim_khuvuc_hethong(tenKhuVuc_HeThong) values(kvht);
        set id_kvht1 = (select id_khuvuc_hethong from staging.dim_khuvuc_hethong where tenKhuVuc_HeThong = kvht);
UPDATE staging.staging 
SET 
    khuvuc_hethong = id_kvht1
WHERE
    khuvuc_hethong = kvht;
	end if;
   end loop;
    close cur2;
end //
call cleanKhuVucHeThong();//

-- ________________________clean ngay cap nhat _________________________draft
--  is convert  values at columns hethong from table staging to number
-- the procedere is go through each line (using cursor ), compare the updated date value in
--  the   column ngaycapnhat  is equal to the values at columns full_date in table date_dim
--  if so, set values  date create at "dateCreate" column at dim_dateCreate table  aquals "ngaycapnhat" column at table staging
--   then set the values of fulldate for ngaycapnhat at  table staging ,
create procedure cleanDateCreate()
begin
	DECLARE done INT DEFAULT FALSE;
	declare ncn varchar(500);
	declare id_ngaycapnhat1 varchar(500);
	declare cur3 cursor for select ngaycapnhat from staging.staging;
    declare continue handler for not found set done = true;
    open cur3;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur3 into ncn ;
        set id_ngaycapnhat1 = (select date_sk from staging.date_dim 
        where date(full_date)= date(ncn) limit 1);
   if  id_ngaycapnhat1  then
       		update staging.staging set ngaycapnhat = id_ngaycapnhat1
            where ngaycapnhat=ncn;
  end if;
   end loop;
    close cur3;
end //
call cleanDateCreate();//
-- INSERT INTO config VALUES (1,"https://giavang.org/" ,"hieu" , "hieu","lechihieubl2020@gmail/com" ,"yyyy-MM-dd_HH-mm-ss" ,"C:\Users\lechi\OneDrive\Máy tính\hieu3\MyDataWarehouse\error_file" ,"C:\Users\lechi\OneDrive\Máy tính\hieu3\MyDataWarehouse\excelFiles","C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\" , "ERR","ER","TR" , "OK","trr");//

-- ________________________________________________________________CỦA DANH________________________________________________________________
Delimiter //
Create procedure load_Staging_to_Datawarehouse_initialization(statuss varchar(500))
begin
declare done int default 0;
declare checking varchar(5);
declare khuvuc_hethong_temp ,khuvuc_temp,hethong_temp ,ngaycapnhat_temp varchar(500);
declare isdelete_temp varchar(5) default "false";
declare expiredate_temp int;
declare giamua_temp ,giaban_temp double;
declare staging_cursor Cursor for select khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat FROM staging.staging;
declare continue handler for not found set done = 1;
set checking = (select log_status from controller.file_log where id_config = 1 order by log_status desc limit 1);
set expiredate_temp = (select date_sk from staging.date_dim order by date_sk desc limit 1);
if (checking = statuss) then
OPEN staging_cursor;
my_cur_loop: LOOP
FETCH staging_cursor INTO khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp;
IF done = 1 THEN
LEAVE my_cur_loop;
END IF;
INSERT INTO data_warehouse.data_warehouse(khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat ,isdelete ,expiredate)
VALUES (khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp ,isdelete_temp ,expiredate_temp);
END LOOP my_cur_loop;
CLOSE staging_cursor;
END IF;
select * from data_warehouse.data_warehouse;
end //
call load_Staging_to_Datawarehouse_initialization();//

Delimiter //
Create procedure load_Staging_to_Datawarehouse(statuss varchar(500))
begin
declare done INT DEFAULT FALSE;
declare checking varchar(5);
declare khuvuc_hethong_temp ,khuvuc_temp,hethong_temp ,currentdate ,ngaycapnhat_temp varchar (500);
declare isdelete_temp varchar(5) default "false";
declare expiredate_temp ,expiredate1 ,id_temp int;
declare giamua_temp ,giaban_temp double;
declare staging_cursor Cursor for select khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat FROM staging.staging;
declare continue handler for not found set done = true;
set checking = (select log_status from controller.file_log where log_status =statuss order by log_status limit 1);
set expiredate_temp = (select date_sk from staging.date_dim order by date_sk desc limit 1) ;
set currentdate = (select date_sk from staging.date_dim where full_date=current_date() limit 1);
if (checking = statuss) then 
OPEN staging_cursor;
my_cur_loop: LOOP
FETCH staging_cursor INTO khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp;
IF done THEN
LEAVE my_cur_loop;
END IF;
IF((SELECT CASE WHEN EXISTS (SELECT * FROM data_warehouse.data_warehouse WHERE khuvuc=khuvuc_temp and hethong=hethong_temp and expiredate=expiredate_temp)
THEN 1
ELSE 0
END)=1) THEN
-- set isdelete_temp ="true";
set id_temp= (Select id from data_warehouse.data_warehouse where khuvuc=khuvuc_temp and hethong=hethong_temp and expiredate=expiredate_temp
order by khuvuc_hethong desc limit 1);
UPDATE data_warehouse.data_warehouse set expiredate=currentdate where id = id_temp;
END IF;
INSERT INTO data_warehouse.data_warehouse(khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat ,isdelete ,expiredate)
VALUES (khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp ,isdelete_temp ,expiredate_temp);
END LOOP my_cur_loop ;
CLOSE staging_cursor;
END IF;
END //
call load_Staging_to_Datawarehouse();//