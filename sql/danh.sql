
create table config(
	id_config int primary key auto_increment,
    source_http_url varchar(1000),
    file_name varchar(1000),
    author varchar(500),
    mail varchar(500)
);
drop table file_log;
create table file_log(
	id_file INT PRIMARY KEY AUTO_INCREMENT,
    id_config int,
    date_create	timestamp default current_timestamp,
    log_status varchar(20),
    author varchar(500),
    paths varchar(500)
);
create table staging(
	khuvuc_hethong varchar(300) not null,
    khuvuc varchar(200),
    hethong varchar(50),
    giamua double,
    giaban double,
    ngaycapnhat timestamp
);
drop table data_warehouse;
create table data_warehouse(
	id int auto_increment primary key,
    khuvuc_hethong varchar(500) not null,
    khuvuc varchar(500),
    hethong varchar(500),
    giamua double,
    giaban double,
    ngaycapnhat varchar(500),
    isdelete bool,
    expiredate varchar(500),
    ischoose bool
);
create table insert_temp_sv(
	count int auto_increment primary key,
	mssv int primary key not null,
    hoten varchar(50),
    gioitinh bool,
    ischoose bool
);
alter table insert_temp_sv drop primary key;
alter table insert_temp_sv add count int auto_increment primary key;
alter table insert_temp_sv add ischoose bool;
insert into insert_temp_sv(mssv,hoten,gioitinh) values (19130222,"pham sĩ thuận",false);
select * from insert_temp_sv;
insert into file_log(id_config,log_status,author) values (1,"ER","thuan");
select * from file_log;
insert into config(source_http_url,file_name,author,mail) values("https://giavang.org/","thuanScriptToGiaVang","thuan","thuan0373535207@gmail.com");
select * from config;
-- local ???? - tại sao chỉ cần đặt local vào là xong?
-- cái binary trong value là gì?
-- load file csv -> 
-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/temp_sv.csv' 
-- INTO TABLE insert_temp_sv 
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';
-- -- IGNORE 1 ROWS;
-- SHOW VARIABLES LIKE "secure_file_priv";

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/07-10-22_14-22-48.csv' 
-- INTO TABLE staging 
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';
-- select * from staging;

-- convert from staging to data_warehouse - max 38 - 39 -> FAILED
-- -- hope
-- line 1 staging -> set old data 'ischoose' = false -> insert -> data_warehouse
-- line 2 staging -> set old data 'ischoose' = false -> isnert -> data_warehouse
-- -- problem 
-- line 1 staging ->CANNOT UPDATE set old data 'ischoose' = false -> insert -> data_warehouse
-- -- problem SOLVED if TRIGGER
INSERT INTO data_warehouse (khuvuc_hethong,khuvuc,hethong,giamua,giaban,ngaycapnhat,isdelete,expiredate,ischoose)
SELECT khuvuc_hethong,khuvuc,hethong,giamua,giaban,ngaycapnhat,0,'2039-01-01',1
FROM staging;
select * from data_warehouse;
select * from insert_temp_sv;
update insert_temp_sv set ischoose = true;
-- trigger
-- drop trigger first_trigger;
DELIMITER $$
create trigger first_trigger
 before insert on insert_temp_sv for each row 
 begin
	
 if exists (select mssv as ms from insert_temp_sv where mssv = new.mssv)  then 
	update insert_temp_sv set ischoose = 0 where mssv = new.mssv;
    
end if;

end$$
DELIMITER ;
select * from config;
select * from file_log;
SHOW TRIGGERS ;
drop trigger first_trigger;
select * from insert_temp_sv;
insert into insert_temp_sv(mssv,hoten,gioitinh,ischoose) values (19130222,"pham sĩ aha",true,true);

	--  DECLARE done INT DEFAULT FALSE;
-- 	 declare mssv1,hoten1 varchar(500);
--      declare gioitinh1,ischoose1 bool;
--      declare count1 int;
--      declare cur1 cursor for select mssv,hoten,gioitinh,ischoose,count from insert_temp_sv;
--      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
--      open cur1;
--      read_loop: LOOP
--      fetch cur1 into mssv1,hoten1,gioitinh1,ischoose1,count1;
--      IF done THEN
--       LEAVE read_loop;
--     END IF;
--     if mssv1=new.mssv then
--     select mssv1,hoten1,gioitinh1,count1;
--     end if;
--      end loop;
--      close cur1;
select * from staging;
select * from data_warehouse;
insert into config(source_http_url,file_name,author,mail) values("https://giavang.org/","hieuScriptToGiaVang","hieu","lechihieubl2020@gmail.com");
drop table config;
create table config(
	id_config int primary key auto_increment,
    source_http_url varchar(1000),
    file_name varchar(1000),
    author varchar(500),
    mail varchar(500)
);

-- của híu_______________________________________________
drop  table staging;
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
    ngaycapnhat varchar(500),
 dateCreate timestamp default current_timestamp
);
select * from staging;
truncate staging;
select * from config;
-- //ex
-- select( convert (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/04-10-22_16-22-06.csv")
-- using utf8mb4));


-- select @@GLOBAL.secure_file_priv;


-- // create procedure load file__________________________________________________________________________________________
DELIMITER &&
-- create procedure load_file_to_staging (mypath varchar(1000))
create procedure load_file_to_staging (paths varchar (2000))
begin 

declare lv_data varchar(4000);
declare lv_line  varchar(4000);
declare lv_temp_p int ;
-- declare temp_path  varchar(4000);
-- declare fileName varchar(4000);
-- declare paths varchar(4000);
-- set paths ="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/";
-- set m_paths = paths +fileName;

-- declare c varchar(4000);
-- set c = "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/";

-- C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/04-10-22_16-22-06.csv
-- select* from staging;
-- find paths whose today and status is ER______________________________________________________________________________________
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
 call load_file_to_staging ("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/13-11_19-45-03.csv");
-- call load_file_to_staging ();
-- //______________________________________________________

declare khuvuc_hethong1 ,khuvuc1,hethong1 , ngaycapnhat1 varchar (500);
  declare  giamua1 ,giaban1 double;
    declare  cur1  Cursor for
      SELECT  
      khuvuc_hethong ,
    khuvuc,
    hethong ,
    giamua ,
   giaban ,
 ngaycapnhat 
--  dateCreate
      FROM   staging
     where dateCreate >= CURDATE()  ;
BEGIN
    OPEN cur1; 
    LOOP
        FETCH cur1 INTO 	khuvuc_hethong1 ,khuvuc1,hethong1 , ngaycapnhat1,  giamua1 ,giaban1;
--         EXIT WHEN cur1 %NOTFOUND;
        INSERT INTO data_warehouse( 
    khuvuc_hethong ,khuvuc,hethong ,giamua ,giaban  ,ngaycapnhat
    ) 
        VALUES (khuvuc_hethong1 ,khuvuc1,hethong1 , ngaycapnhat1,  giamua1 ,giaban1);

    END LOOP;
    CLOSE cur1;
--     COMMIT; 
END; 
select * from staging;

truncate staging;

   INSERT INTO data_warehouse( 
    khuvuc_hethong ,khuvuc,hethong ,giamua ,giaban  ,ngaycapnhat
    ) SELECT khuvuc_hethong ,khuvuc,hethong ,giamua ,giaban  ,ngaycapnhat
FROM staging
WHERE dateCreate >= curdate();
select * from data_warehouse;
-- // clean data staging ___________________________________
-- xác định (declare) con trỏ
-- DECLARE @mycur CURSOR
-- DECLARE @test VARCHAR(500) -- biến để chứa dữ liệu con trỏ đưa ra

-- SET @mycur = CURSOR
-- FOR
-- SELECT number FROM staging

-- OPEN @mycur
-- -- bây giờ con trỏ @mycur đang nằm trên một nhóm hàng dữ liệu trích ra từ bảng mytable

-- FETCH NEXT FROM @mycur INTO @test
-- -- đọc hàng đầu tiên, lấy dữ liệu con trỏ (number của mytable) cho vào biến @test

-- -- vong lặp để đi dọc theo nhóm
-- WHILE @@FETCH_STATUS = 0 -- nếu khác 0: con trỏ đã quá hàng cuối nhóm
-- BEGIN
-- PRINT @test -- in kq ra
-- FETCH NEXT FROM @mycur INTO @test -- đọc hàng kế
-- END

-- DEALLOCATE @mycur
-- -- nhả con trỏ ra (để giải thoát bộ nhớ đang giữ nhóm dữ liệu)


-- //solution 2 ___________________________________
-- DELIMITER $$
-- create trigger first_trigger
--  before insert on staging for each row 
--  begin
-- 	
--  if exists (select id as ms from staging where id = new.id)  then 
-- 	update staging set ischoose = 0 where id = new.id;
--     
-- end if;

-- end$$
-- DELIMITER ;_______________________________
-- select * from config;
-- select * from file_log;
-- SHOW TRIGGERS ;
-- drop trigger first_trigger;
select * from staging;
-- // insert ______________________
-- insert into staging(  id,
--      khuvuc_hethong ,
--     khuvuc,
--     hethong ,
--     giamua ,
--    giaban ,
--     chenhLech  ,
--  ngaycapnhat, 
--  ischoose) 
--  values (19130222,"pham sĩ aha",true,true);

-- //
select * from staging 
where dataCreate >= CURDATE();

-- declare done INT DEFAULT FALSE;
declare khuvuc_hethong1 ,khuvuc1, hethong1 , ngaycapnhat1 varchar(5000);
declare giamua1 ,giaban1  double;
-- declare ischoose1 bool;
-- declare id1 ,count1 int;
declare cur1 cursor for select
--      id,
     khuvuc_hethong ,khuvuc,hethong ,giamua ,giaban ,ngaycapnhat
--  ischoose,
 -- count
from staging;
--  where dateCreate >= CURDATE()  ;

begin
--      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
     open cur1;
     read_loop: LOOP
     fetch cur1 into 
--      id1,
     khuvuc_hethong1 ,
    khuvuc1,
    hethong1 ,
    giamua1 ,
	giaban1 ,
--     chenhLech1 ,
    ngaycapnhat1 ;

   --  ischoose1,
--      count1;
      IF done THEN
      LEAVE read_loop;
     END IF;
--  if id1=new.id then
 -- check colomn dateCreate is today then load data ino table data_warehouse
 if   dateCreate >= CURDATE()  then

--  query example, insert into grade(`stud_id`,`stud_staus`)values(s_stud_id,s_stud_mark);
    insert into data_warehouse( 
    khuvuc_hethong ,khuvuc,hethong ,giamua ,giaban ,  ,ngaycapnhat
    ) 
    values ( 
    khuvuc_hethong1 ,khuvuc1,hethong1 ,giamua1 ,giaban1   ,ngaycapnhat1
    );
--     mssv1,hoten1,gioitinh1,count1;
  -- id1,
--      khuvuc_hethong1 ,
--     khuvuc1,
--     hethong1 ,
--     giamua1 ,
-- 	giaban1 ,
--     chenhLech1  ,
--     ngaycapnhat1 ,
--      count1;
--     end if;
      END LOOP;
    CLOSE cur1;
END; 
-- //___________________________





-- // create table date_min___________________________________________________________
create table date_dim ( 
date_sk  varchar(500), 
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

select * from date_min;
drop table date_min;

-- // load file date_min 

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/date_dim_without_quarter.csv' 
INTO TABLE date_min 
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
SHOW VARIABLES LIKE "secure_file_privfile_log"
select*from file_log;
-- // create  procedure find day which is today example
DELIMITER &&
create procedure find_today() 
begin
select CURDATE() FROM file_log
WHERE date_create = today;
end&&
call find_today();
-- // function today 
 --    DELIMITER $$
--      CREATE FUNCTION today()
--      RETURNS DATE
--      BEGIN
--     RETURN CURDATE();
--    END$$
--    DELIMITER ;
alter table config drop column listofFields ;
alter table config drop column configcol ;
alter table file_log drop column paths ;

-- select * from file_log
-- where
--  date_create = CURDATE()   and log_status ='ER';

-- // example
-- SELECT count(distinct id_file) AS today 
-- FROM file_log 
-- WHERE date_create >= CURDATE() and log_status="ER";

-- // create procedure find lines whose hava date today and column stutus is ER in table file_log _____________________________________________________

-- paths varchar (4000)
DELIMITER &&
create procedure today() 
begin
SELECT   paths ,log_status
FROM file_log 
WHERE date_create >= CURDATE() and log_status="ER";
end&&
call today();
-- // function to get file name 
-- create function fn_getFileName( @fullFilePath varchar (4000))
-- begin 
-- declare @reverseString varchar (4000)
-- declare @Psposition int 
-- declare @lenofrevString int 
-- declare @result varchar(4000)

-- set @reverseString =REVERSE(@fullFilePath)
-- set @Psposition =charindex("\",@reverseString)
-- set @lenofrevString =len(@reverseString)
-- set result =LEFT(@reverseString,@Psposition)
-- return @result
-- END
-- // create tables dim ________________________________________________
create table dim_khuVuc(
id_khuVuc int primary key auto_increment,
tenkhuVuc varchar(500)
);

create table dim_heThong(
id_heThong int primary key auto_increment,
tenHeThong varchar(500)
);


create table dim_ngayCapNhat(
id_ngaycapnhat int primary key auto_increment,
ngayCapNhat varchar(500)
);
drop table dim_ngayCapNhat;
create table dim_dateCreate(
id_heThong int primary key auto_increment,
 dateCreate timestamp default current_timestamp
);
-- //create procedure clean data column khuvuc _______________________________________________________________
delimiter $$
create procedure cleanStagingKhuVuc()
begin
	DECLARE done INT DEFAULT FALSE;
	declare kv,ht varchar(500);
    declare id_khuvuc  int default -1;
	declare cur1 cursor for select khuvuc,hethong from staging;
    declare continue handler for not found set done = true;
    open cur1;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur1 into kv,ht;
    -- khu vuc deal
    set id_khuvuc = (select id from khuvuc_dim where khuvuc = kv);
    if id_khuvuc then
		update staging set khuvuc = id_khuvuc where khuvuc=kv;
	else
		insert into khuvuc_dim(khuvuc) values(kv);
        set id_khuvuc = (select id from khuvuc_dim where khuvuc = kv);
        update staging set khuvuc = id_khuvuc where khuvuc=kv;
	end if;
   end loop;
    close cur1;
end $$
delimiter ;
-- //create  procedure data clean he thong _________________________________________________
delimiter $$
create procedure cleanStagingHeThong()
begin
	DECLARE done INT DEFAULT FALSE;
	declare kv,ht varchar(500);
    declare id_heThong  int default -1;
	declare curHeThong cursor for select khuvuc,hethong from staging;
    declare continue handler for not found set done = true;
    open curHeThong;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch curHeThong into kv,ht;
    -- khu vuc deal
    set id_heThong = (select id_heThong from dim_hethong where hethong = ht);
    if id_heThong then
		update staging set hethong = id_heThong where hethong = ht;
	else
		insert into dim_hethong(hethong) values(ht);
        set id_heThong = (select id from dim_hethong where hethong = ht);
        update staging set hethong = id_hethong where hethong =ht;
	end if;
   end loop;
    close curHeThong;
end $$
delimiter ;
-- // create procedure clean data column ngayCapNhat____________________________________________________________________
delimiter $$
create procedure cleanStagingNgayCapNhat()
begin
	DECLARE done INT DEFAULT FALSE;
	declare dateUpdate varchar(500);
    declare id_dataUpdate int default -1;
	declare curNgayCapNhat cursor for select ngaycapnat from staging;
    declare continue handler for not found set done = true;
    open curNgayCapNhat;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch curNgayCapNhat into dateUpdate,id_dateUpdate;
    -- khu vuc deal
    set ngaycapnhat = (select id_dataUpdate from khuvuc_dim where ngaycapnhat = dateUpdate);
    if id_khuvuc then
		update staging set khuvuc = id_khuvuc where khuvuc=kv;
	else
		insert into khuvuc_dim(khuvuc) values(kv);
        set id_khuvuc = (select id from khuvuc_dim where khuvuc = kv);
        update staging set khuvuc = id_khuvuc where khuvuc=kv;
	end if;
   end loop;
    close cur1;
end $$
delimiter ;
-- //_______________________________clean khu vuc__________________________
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
    set id_khuvuc1 = (select id_khuVuc from dim_khuvuc where tenkhuVuc = kv1);
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
-- ________________________________cursor he thong _______________________
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

-- ________________________clean ngay cap nhat _________________________
delimiter $$
create procedure cleanNgayCapNhat()
begin
	DECLARE done INT DEFAULT FALSE;
	declare ncn varchar(500);
    declare id_ngaycapnhat1 int default -1;
	declare cur3 cursor for select ngaycapnhat from staging;
    declare continue handler for not found set done = true;
    open cur3;
    myloop: loop
    if done then
		leave myloop;
	end if;
    fetch cur3 into ncn;
    -- khu vuc deal
    set id_ngaycapnhat1 = (select id_ngaycapnhat from dim_ngaycapnhat where ngayCapNhat = ncn);
    if id_ngaycapnhat1 then
		update staging set ngaycapnhat = id_ngaycapnhat1 where ngaycapnhat=ncn;
	else
		insert into dim_ngaycapnhat(ngayCapNhat) values(ncn);
        set id_ngaycapnhat1 = (select id_ngaycapnhat from dim_ngaycapnhat where ngayCapNhat = ncn);
        update staging set ngaycapnhat = id_ngaycapnhat1 where ngaycapnhat=ncn;
	end if;
   end loop;
    close cur3;
end $$
delimiter ;
call cleanNgayCapNhat();
truncate staging;
select *from staging;
alter table staging drop column dateCreate ;

select count(*) FROM STAGING;
-- // so sánh 
select   staging.ngaycapnhat , date_min.full_date 
from staging,date_min 
where staging.ngaycapnhat=date_min.full_date;
-- // get day , month , year
select  month("2022-09-30 15:43:44") as month;
SELECT CONVERT(ngaycapnhat, DATE);
ALTER TABLE staging    
MODIFY COLUMN ngaycapnhat date;
ALTER TABLE date_min    
MODIFY COLUMN full_date date;
-- ________________________________________________________________CỦA DANH________________________________________________________________
update file_log set log_status = "TR" where id_file=1 ;
select * from file_log ;
select * from staging;
select * from data_warehouse;
truncate table data_warehouse;
Delimiter //
Create procedure load_Staging_to_Datawarehouse()
begin
declare done int default 0;
declare checking varchar(5);
declare khuvuc_hethong_temp ,khuvuc_temp,hethong_temp ,currentdate ,ngaycapnhat_temp varchar (500);
declare khu_vuc1 ,he_thong1 varchar (500);
declare isdelete_temp varchar(5) default "false";
declare expiredate_temp ,expiredate1 ,id_temp int;
declare giamua_temp ,giaban_temp double;
declare staging_cursor Cursor for select khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat FROM staging;
declare continue handler for not found set done = 1;
set checking = (select log_status from file_log where id_config = 1 order by log_status desc limit 1);
set expiredate_temp = (select date_sk from date_dim order by date_sk desc limit 1) ;
set currentdate=(select date_sk from date_dim where full_date=current_date() limit 1);

Set isdelete_temp = "true";
-- Set id_temp=(Select id from data_warehouse where khuvuc=1 and hethong =1 order by khuvuc_hethong desc limit 1);

if (checking = "TR") then 
OPEN staging_cursor;
my_cur_loop: LOOP
FETCH staging_cursor INTO khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp;
IF done = 1 THEN
LEAVE my_cur_loop;
END IF;
INSERT INTO data_warehouse(khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat ,isdelete ,expiredate)
VALUES (khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp ,isdelete_temp ,expiredate_temp);
Set khu_vuc1 = (Select khuvuc from data_warehouse where khuvuc=1 and hethong =1 order by khuvuc_hethong limit 1);
Set he_thong1 = (Select hethong from data_warehouse where khuvuc=1 and hethong =1 order by khuvuc_hethong limit 1);
IF (khu_vuc = data_warehouse.khuvuc and he_thong = data_warehouse.hethong and expiredate_check=data_warehouse.expiredate
-- khu_vuc= (Select khuvuc from data_warehouse where khuvuc=1 and hethong =1 order by khuvuc_hethong limit 1)
-- and he_thong= (Select hethong from data_warehouse where khuvuc=1 and hethong =1 order by khuvuc_hethong limit 1)
-- and expiredate_check = (Select expiredate from data_warehouse where khuvuc=1 and hethong =1 order by khuvuc_hethong desc limit 1)
) THEN
FETCH staging_cursor INTO khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp;
IF done = 1 THEN
LEAVE my_cur_loop;
END IF;
INSERT INTO data_warehouse(khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat ,isdelete ,expiredate)
VALUES (khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp ,isdelete_temp ,currentdate);
END IF;
-- //////////////////
END LOOP my_cur_loop ;
CLOSE staging_cursor;
UPDATE file_log SET log_status = 'OK' WHERE id_config = 1;
end if;

end //

call load_Staging_to_Datawarehouse();//
Select * from data_warehouse where khuvuc=1 and hethong =1 order by khuvuc_hethong desc limit 1;//
Delimiter //
Create procedure load_Staging_to_Datawarehouse_begin()
begin
declare done int default 0;
declare checking varchar(5);
declare khuvuc_hethong_temp ,khuvuc_temp,hethong_temp ,currentdate ,ngaycapnhat_temp varchar (500);
declare isdelete_temp varchar(5) default "false";
declare expiredate_temp ,expiredate_check int;
declare giamua_temp ,giaban_temp double;
declare staging_cursor Cursor for select khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat FROM staging;
declare continue handler for not found set done = 1;
set checking = (select log_status from file_log where id_config = 1 order by log_status desc limit 1);
set expiredate_temp = (select date_sk from date_dim order by date_sk desc limit 1) ;
set currentdate=(select date_sk from date_dim where full_date=current_date() limit 1);
if (checking = "TR") then 
OPEN staging_cursor;
my_cur_loop: LOOP
FETCH staging_cursor INTO khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp;
IF done = 1 THEN
LEAVE my_cur_loop;
END IF;
INSERT INTO data_warehouse(khuvuc_hethong ,khuvuc ,hethong ,giamua ,giaban ,ngaycapnhat ,isdelete ,expiredate)
VALUES (khuvuc_hethong_temp ,khuvuc_temp ,hethong_temp ,giamua_temp ,giaban_temp ,ngaycapnhat_temp ,isdelete_temp ,expiredate_temp);
END LOOP my_cur_loop ;
CLOSE staging_cursor;
-- UPDATE file_log SET log_status = 'OK' WHERE id_config = 1;
END IF;

end //
call load_Staging_to_Datawarehouse_begin();//


