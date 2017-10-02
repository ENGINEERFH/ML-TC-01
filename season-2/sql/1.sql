-- 关于日均的money费用sum, avg, std, max
drop table if exists day_money;
drop table if exists feature_money_sum;
drop table if exists feature_money_avg;
drop table if exists feature_money_std;
drop table if exists feature_money_max;


create table if not exists day_money as
select pid, to_date(trans_time,'yyyy-mm-dd') as date_time, sum(gzyp_occur) as day_gzyp_occur, sum(gcy_occur) as day_gcy_occur, sum(zcy_occur) as day_zcy_occur, sum(yp_self) as day_yp_self, sum(jc_declare) as day_jc_declare,
sum(zl_declare) as day_zl_declare, sum(yycl_self) as day_yycl_self, sum(qt_occure) as day_qt_occure, sum(ycx_declare) as day_ycx_declare, sum(self_over_std) as day_self_over_std,
sum(med_insurance) as day_med_insurance, sum(rural_assist) as day_rural_assist, sum(available) as day_available, sum(non_account) as day_non_account, sum(personal_med_insurance) as day_personal_med_insurance,
sum(approve) as day_approve
from not_null_test group by pid, trans_time;

create table if not exists feature_money_sum as
select pid, sum(day_gzyp_occur) as sum_gzyp_occur, sum(day_gcy_occur) as sum_gcy_occur, sum(day_zcy_occur) as sum_zcy_occur, sum(day_yp_self) as sum_yp_self, sum(day_jc_declare) as sum_jc_declare,
sum(day_zl_declare) as sum_zl_declare, sum(day_yycl_self) as sum_yycl_self, sum(day_qt_occure) as sum_qt_occure, sum(day_ycx_declare) as sum_ycx_declare, sum(day_self_over_std) as sum_self_over_std,
sum(day_med_insurance) as sum_med_insurance, sum(day_rural_assist) as sum_rural_assist, sum(day_available) as sum_available, sum(day_non_account) as sum_non_account, sum(day_personal_med_insurance) as sum_personal_med_insurance,
sum(day_approve) as sum_approve
from day_money group by pid;

create table if not exists feature_money_avg as
select pid, avg(day_gzyp_occur) as avg_gzyp_occur, avg(day_gcy_occur) as avg_gcy_occur, avg(day_zcy_occur) as avg_zcy_occur, avg(day_yp_self) as avg_yp_self, avg(day_jc_declare) as avg_jc_declare,
avg(day_zl_declare) as avg_zl_declare, avg(day_yycl_self) as avg_yycl_self, avg(day_qt_occure) as avg_qt_occure, avg(day_ycx_declare) as avg_ycx_declare, avg(day_self_over_std) as avg_self_over_std,
avg(day_med_insurance) as avg_med_insurance, avg(day_rural_assist) as avg_rural_assist, avg(day_available) as avg_available, avg(day_non_account) as avg_non_account, avg(day_personal_med_insurance) as avg_personal_med_insurance,
avg(day_approve) as avg_approve
from day_money group by pid;

create table if not exists feature_money_std as
select pid, stddev_samp(day_gzyp_occur) as std_gzyp_occur, stddev_samp(day_gcy_occur) as std_gcy_occur, stddev_samp(day_zcy_occur) as std_zcy_occur, stddev_samp(day_yp_self) as std_yp_self, stddev_samp(day_jc_declare) as std_jc_declare,
stddev_samp(day_zl_declare) as std_zl_declare, stddev_samp(day_yycl_self) as std_yycl_self, stddev_samp(day_qt_occure) as std_qt_occure, stddev_samp(day_ycx_declare) as std_ycx_declare, stddev_samp(day_self_over_std) as std_self_over_std,
stddev_samp(day_med_insurance) as std_med_insurance, stddev_samp(day_rural_assist) as std_rural_assist, stddev_samp(day_available) as std_available, stddev_samp(day_non_account) as std_non_account, stddev_samp(day_personal_med_insurance) as std_personal_med_insurance,
stddev_samp(day_approve) as std_approve
from day_money group by pid;

create table if not exists feature_money_max as
select pid, max(day_gzyp_occur) as max_gzyp_occur, max(day_gcy_occur) as max_gcy_occur, max(day_zcy_occur) as max_zcy_occur, max(day_yp_self) as max_yp_self, max(day_jc_declare) as max_jc_declare,
max(day_zl_declare) as max_zl_declare, max(day_yycl_self) as max_yycl_self, max(day_qt_occure) as max_qt_occure, max(day_ycx_declare) as max_ycx_declare, max(day_self_over_std) as max_self_over_std,
max(day_med_insurance) as max_med_insurance, max(day_rural_assist) as max_rural_assist, max(day_available) as max_available, max(day_non_account) as max_non_account, max(day_personal_med_insurance) as max_personal_med_insurance,
max(day_approve) as max_approve
from day_money group by pid;


-- 关于日均detect费用, sum
drop table if exists day_detect;
drop table if exists feature_detect_sum;
drop table if exists tmp_detect_avg;
drop table if exists tmp_detect_std;

create table if not exists day_detect as
select pid, to_date(trans_time,'yyyy-mm-dd') as date_time, sum(gzjc_occur) as day_gzjc_occur, sum(jc_self) as day_jc_self, sum(zl_self) as day_zl_self, sum(ss_occur) as day_ss_occur, sum(ss_self) as day_ss_self,
sum(ss_declare) as day_ss_declare, sum(gjcl_occur) as day_gjcl_occur, sum(cfsx_declare) as day_cfsx_declare, sum(qt_declare) as day_qt_declare, sum(std_pay) as day_std_pay,
sum(servant_assist) as day_servant_assist, sum(med_assist_declare) as day_med_assist_declare, sum(disable_med_assist) as day_disable_med_assist, sum(rural_assist2) as day_rural_assist2
from not_null_test group by pid, trans_time;

create table if not exists feature_detect_sum as
select pid, sum(day_gzjc_occur) as sum_gzjc_occur, sum(day_jc_self) as sum_jc_self, sum(day_zl_self) as sum_zl_self, sum(day_ss_occur) as sum_ss_occur, sum(day_ss_self) as sum_ss_self,
sum(day_ss_declare) as sum_ss_declare, sum(day_gjcl_occur) as sum_gjcl_occur, sum(day_cfsx_declare) as sum_cfsx_declare, sum(day_qt_declare) as sum_qt_declare, sum(day_std_pay) as sum_std_pay,
sum(day_servant_assist) as sum_servant_assist, sum(day_med_assist_declare) as sum_med_assist_declare, sum(day_disable_med_assist) as sum_disable_med_assist, sum(day_rural_assist2) as sum_rural_assist2
from day_detect group by pid;

create table if not exists tmp_detect_avg as
select pid,avg(day_gzjc_occur) as avg_gzjc_occur, avg(day_jc_self) as avg_jc_self, avg(day_zl_self) as avg_zl_self, avg(day_ss_occur) as avg_ss_occur, avg(day_ss_self) as avg_ss_self,
avg(day_ss_declare) as avg_ss_declare, avg(day_gjcl_occur) as avg_gjcl_occur, avg(day_cfsx_declare) as avg_cfsx_declare, avg(day_qt_declare) as avg_qt_declare, avg(day_std_pay) as avg_std_pay,
avg(day_servant_assist) as avg_servant_assist, avg(day_med_assist_declare) as avg_med_assist_declare, avg(day_disable_med_assist) as avg_disable_med_assist, avg(day_rural_assist2) as avg_rural_assist2
from day_detect group by pid;

create table if not exists tmp_detect_std as
select pid,stddev_samp(day_gzjc_occur) as std_gzjc_occur, stddev_samp(day_jc_self) as std_jc_self, stddev_samp(day_zl_self) as std_zl_self, stddev_samp(day_ss_occur) as std_ss_occur, stddev_samp(day_ss_self) as std_ss_self,
stddev_samp(day_ss_declare) as std_ss_declare, stddev_samp(day_gjcl_occur) as std_gjcl_occur, stddev_samp(day_cfsx_declare) as std_cfsx_declare, stddev_samp(day_qt_declare) as std_qt_declare, stddev_samp(day_std_pay) as std_std_pay,
stddev_samp(day_servant_assist) as std_servant_assist, stddev_samp(day_med_assist_declare) as std_med_assist_declare, stddev_samp(day_disable_med_assist) as std_disable_med_assist, stddev_samp(day_rural_assist2) as std_rural_assist2
from day_detect group by pid;


-- 关于时间特征,消费次数,就诊天数等等
drop table if exists feature_pay_times;
create table if not exists feature_pay_times as
select pid, count(seqid) as pay_times
from renshe_df_test
group by pid;

drop table if exists feature_hospital_day;
create table if not exists feature_hospital_day as
select pid, count(pid) as hospital_day
from day_money
group by pid;

drop table if exists feature_total_interval ;
create table if not exists feature_total_interval as
select pid, datediff(max(date_time), min(date_time),'dd') as total_interval
from day_money
group by pid;

drop table if exists tmp_time;
create table if not exists tmp_time as
select pid, max(date_time) as maxtime, min(date_time) as mintime
from day_money
group by pid;

drop table if exists time_join;
create table if not exists time_join as
select a.pid, a.date_time, b.maxtime , b.mintime
from day_money a
left outer join tmp_time b on a.pid = b.pid;

drop table if exists time_diff_1;
create table if not exists time_diff_1 as
select pid, date_time as time1, row_number() over(partition by pid order by pid, date_time) as rank
from time_join
where date_time > mintime;

drop table if exists time_diff_2;
create table if not exists time_diff_2 as
select pid, date_time as time2, row_number() over(partition by pid order by pid, date_time) as rank
from time_join
where date_time < maxtime;

drop table if exists time_interval;
create table if not exists time_interval as
select a.pid, a.time1, b.time2, a.rank, datediff(a.time1,b.time2,'dd') as time_diff
from time_diff_1 a
left outer join time_diff_2 b on a.pid = b.pid and a.rank = b.rank
order by a.pid, a.rank
limit 10000000;

drop table if exists feature_interval;
create table if not exists feature_interval as
select pid, avg(time_diff) as avg_time_interval, stddev_samp(time_diff) as std_time_interval,
max(time_diff) as max_time_interval, count(time_diff) as count_time_interval
from time_interval
group by pid;

drop table if exists time_join_table;
create table if not exists time_join_table as
select a.pid, a.time_diff, b.avg_time_interval
from time_interval a
left outer join feature_interval b on a.pid = b.pid;

drop table if exists time_skew_up;
create table if not exists time_skew_up as
select pid, sum(pow(time_diff-avg_time_interval,3)) as skew_up_time
from time_join_table
group by pid;

drop table if exists tmp_join_skew;
create table if not exists tmp_join_skew  as
select a.pid, a.skew_up_time, b.std_time_interval, b.count_time_interval
from time_skew_up a
left outer join feature_interval b on a.pid = b.pid;

drop table if exists skew_interval;
create table if not exists skew_interval as
select pid, skew_up_time*count_time_interval/(count_time_interval-1)/(count_time_interval -2)/pow(std_time_interval, 3) as skew_time_interval
 from tmp_join_skew
where std_time_interval != 0 and count_time_interval > 2;

drop table if exists feature_time_interval;
create table if not exists feature_time_interval as
select a.pid, a.total_interval, b.avg_time_interval, b.std_time_interval, b.max_time_interval, c.skew_time_interval
from feature_total_interval a
left outer join feature_interval b on a.pid = b.pid
left outer join skew_interval c on a.pid = c.pid ;

drop table if exists feature_count_hospital;
create table if not exists feature_count_hospital as
select pid, count(hid) as count_hospital
from (
  select pid, hid, count(hid) as every_count
  from not_null_test
  group by pid, hid
  ) a
group by pid;


drop table if exists count_tmp;
create table if not exists count_tmp as
select pid, hid, count(trans_time) as tmp
from (
  select pid, trans_time, hid, count(hid) as tmp
  from not_null_test
  group by pid, trans_time, hid
) a
group by pid, hid;

drop table if exists count_most_hospital;
create table if not exists count_most_hospital as
select pid, hid as most_hospital_id, tmp as count_most_hospital
from (
  select pid, hid, tmp, row_number() over(partition by pid order by tmp desc) as rn
  from count_tmp
) a
where rn = 1;

drop table if exists tmp_day_hospital ;
create table if not exists tmp_day_hospital as
select pid, trans_time, count(hid) as count_hospital
from (
  select pid, trans_time, hid, count(hid) as tmp
  from not_null_test
  group by pid, trans_time, hid
) a
group by pid, trans_time ;

drop table if exists feature_day_hospital ;
create table if not exists feature_day_hospital as
select pid, max(count_hospital) as max_day_hospital, avg(count_hospital) as avg_day_hospital,
min(count_hospital) as min_day_hospital
from tmp_day_hospital
group by pid;

drop table if exists three_hospital;
create table if not exists three_hospital as
select pid, count(trans_time) as threehospital
from (
  select * from tmp_day_hospital
  where count_hospital > 2
  ) a
group by pid;

drop table if exists feature_time_all;
create table if not exists feature_time_all as
select a.pid, a.pay_times ,b.hospital_day ,
d.total_interval ,d.avg_time_interval ,d.std_time_interval ,d.max_time_interval ,d.skew_time_interval ,
e.count_hospital ,f.most_hospital_id ,f.count_most_hospital ,h.threehospital,
g.max_day_hospital ,g.avg_day_hospital ,g.min_day_hospital
from feature_pay_times a
left outer join feature_hospital_day b on a.pid = b.pid
left outer join feature_time_interval d on a.pid = d.pid
left outer join feature_count_hospital e on a.pid = e.pid
left outer join count_most_hospital f on a.pid = f.pid
left outer join feature_day_hospital g on a.pid = g.pid
left outer join three_hospital h on a.pid = h.pid;


-- 关于money费用的skew
drop table if exists money_join_table;
create table if not exists money_join_table as
select a.pid, a.day_gzyp_occur, a.day_gcy_occur, a.day_zcy_occur, a.day_yp_self, a.day_jc_declare,
a.day_zl_declare, a.day_yycl_self, a.day_qt_occure, a.day_ycx_declare, a.day_self_over_std,
a.day_med_insurance, a.day_rural_assist, a.day_available, a.day_non_account, a.day_personal_med_insurance,
a.day_approve,
b.avg_gzyp_occur, b.avg_gcy_occur, b.avg_zcy_occur, b.avg_yp_self, b.avg_jc_declare,
b.avg_zl_declare, b.avg_yycl_self, b.avg_qt_occure, b.avg_ycx_declare, b.avg_self_over_std,
b.avg_med_insurance, b.avg_rural_assist, b.avg_available, b.avg_non_account, b.avg_personal_med_insurance,
b.avg_approve
from day_money a
left outer join feature_money_avg b on a.pid = b.pid;

drop table if exists money_skew_up;
create table if not exists money_skew_up as
select pid, sum(pow(day_gzyp_occur-avg_gzyp_occur,3)) as skew_up_gzyp_occur, sum(pow(day_gcy_occur-avg_gcy_occur,3)) as skew_up_gcy_occur, sum(pow(day_zcy_occur-avg_zcy_occur,3)) as skew_up_zcy_occur, sum(pow(day_yp_self-avg_yp_self,3)) as skew_up_yp_self, sum(pow(day_jc_declare-avg_jc_declare,3)) as skew_up_jc_declare,
sum(pow(day_zl_declare-avg_zl_declare,3)) as skew_up_zl_declare, sum(pow(day_yycl_self-avg_yycl_self,3)) as skew_up_yycl_self, sum(pow(day_qt_occure-avg_qt_occure,3)) as skew_up_qt_occure, sum(pow(day_ycx_declare-avg_ycx_declare,3)) as skew_up_ycx_declare, sum(pow(day_self_over_std-avg_self_over_std,3)) as skew_up_self_over_std,
sum(pow(day_med_insurance-avg_med_insurance,3)) as skew_up_med_insurance, sum(pow(day_rural_assist-avg_rural_assist,3)) as skew_up_rural_assist, sum(pow(day_available-avg_available,3)) as skew_up_available, sum(pow(day_non_account-avg_non_account,3)) as skew_up_non_account, sum(pow(day_personal_med_insurance-avg_personal_med_insurance,3)) as skew_up_personal_med_insurance,
sum(pow(day_approve-avg_approve,3)) as skew_up_approve
from money_join_table
group by pid;

drop table if exists tmp_join_skew;
create table if not exists tmp_join_skew  as
select a.pid, a.skew_up_gzyp_occur, a.skew_up_gcy_occur, a.skew_up_zcy_occur, a.skew_up_yp_self, a.skew_up_jc_declare,
a.skew_up_zl_declare, a.skew_up_yycl_self, a.skew_up_qt_occure, a.skew_up_ycx_declare, a.skew_up_self_over_std,
a.skew_up_med_insurance, a.skew_up_rural_assist, a.skew_up_available, a.skew_up_non_account, a.skew_up_personal_med_insurance,
a.skew_up_approve,
b.std_gzyp_occur, b.std_gcy_occur, b.std_zcy_occur, b.std_yp_self, b.std_jc_declare,
b.std_zl_declare, b.std_yycl_self, b.std_qt_occure, b.std_ycx_declare, b.std_self_over_std,
b.std_med_insurance, b.std_rural_assist, b.std_available, b.std_non_account, b.std_personal_med_insurance,
b.std_approve,
c.hospital_day
from money_skew_up a
left outer join feature_money_std b on a.pid = b.pid
left outer join feature_hospital_day c on a.pid = c.pid;

drop table if exists skew_gzyp_occur;
create table if not exists skew_gzyp_occur as
select pid, skew_up_gzyp_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gzyp_occur, 3) as skew_gzyp_occur
 from tmp_join_skew
where std_gzyp_occur != 0 and hospital_day > 2;

drop table if exists skew_gcy_occur;
create table if not exists skew_gcy_occur as
select pid, skew_up_gcy_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gcy_occur, 3) as skew_gcy_occur
 from tmp_join_skew
where std_gcy_occur != 0 and hospital_day > 2;

drop table if exists skew_zcy_occur;
create table if not exists skew_zcy_occur as
select pid, skew_up_zcy_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zcy_occur, 3) as skew_zcy_occur
 from tmp_join_skew
where std_zcy_occur != 0 and hospital_day > 2;

drop table if exists skew_yp_self;
create table if not exists skew_yp_self as
select pid, skew_up_yp_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_yp_self, 3) as skew_yp_self
 from tmp_join_skew
where std_yp_self != 0 and hospital_day > 2;

drop table if exists skew_jc_declare;
create table if not exists skew_jc_declare as
select pid, skew_up_jc_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_jc_declare, 3) as skew_jc_declare
 from tmp_join_skew
where std_jc_declare != 0 and hospital_day > 2;

drop table if exists skew_zl_declare;
create table if not exists skew_zl_declare as
select pid, skew_up_zl_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zl_declare, 3) as skew_zl_declare
 from tmp_join_skew
where std_zl_declare != 0 and hospital_day > 2;

drop table if exists skew_yycl_self;
create table if not exists skew_yycl_self as
select pid, skew_up_yycl_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_yycl_self, 3) as skew_yycl_self
 from tmp_join_skew
where std_yycl_self != 0 and hospital_day > 2;

drop table if exists skew_qt_occure;
create table if not exists skew_qt_occure as
select pid, skew_up_qt_occure*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_qt_occure, 3) as skew_qt_occure
 from tmp_join_skew
where std_qt_occure != 0 and hospital_day > 2;

drop table if exists skew_ycx_declare;
create table if not exists skew_ycx_declare as
select pid, skew_up_ycx_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ycx_declare, 3) as skew_ycx_declare
 from tmp_join_skew
where std_ycx_declare != 0 and hospital_day > 2;

drop table if exists skew_self_over_std;
create table if not exists skew_self_over_std as
select pid, skew_up_self_over_std*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_self_over_std, 3) as skew_self_over_std
 from tmp_join_skew
where std_self_over_std != 0 and hospital_day > 2;

drop table if exists skew_med_insurance;
create table if not exists skew_med_insurance as
select pid, skew_up_med_insurance*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_med_insurance, 3) as skew_med_insurance
 from tmp_join_skew
where std_med_insurance != 0 and hospital_day > 2;

drop table if exists skew_rural_assist;
create table if not exists skew_rural_assist as
select pid, skew_up_rural_assist*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_rural_assist, 3) as skew_rural_assist
 from tmp_join_skew
where std_rural_assist != 0 and hospital_day > 2;

drop table if exists skew_available;
create table if not exists skew_available as
select pid, skew_up_available*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_available, 3) as skew_available
 from tmp_join_skew
where std_available != 0 and hospital_day > 2;

drop table if exists skew_non_account;
create table if not exists skew_non_account as
select pid, skew_up_non_account*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_non_account, 3) as skew_non_account
 from tmp_join_skew
where std_non_account != 0 and hospital_day > 2;

drop table if exists skew_personal_med_insurance;
create table if not exists skew_personal_med_insurance as
select pid, skew_up_personal_med_insurance*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_personal_med_insurance, 3) as skew_personal_med_insurance
 from tmp_join_skew
where std_personal_med_insurance != 0 and hospital_day > 2;

drop table if exists skew_approve;
create table if not exists skew_approve as
select pid, skew_up_approve*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_approve, 3) as skew_approve
 from tmp_join_skew
where std_approve != 0 and hospital_day > 2;

-- 最长只允许16个join
drop table if exists feature_money_skew_part;
create table if not exists feature_money_skew_part as
select a.pid, a.hospital_day, b1.skew_gzyp_occur, b2.skew_gcy_occur, b3.skew_zcy_occur, b4.skew_yp_self, b5.skew_jc_declare,
b6.skew_zl_declare, b7.skew_yycl_self, b8.skew_qt_occure, b9.skew_ycx_declare, b10.skew_self_over_std,
b11.skew_med_insurance, b12.skew_rural_assist, b13.skew_available, b14.skew_non_account, b15.skew_personal_med_insurance
from tmp_join_skew a
left outer join skew_gzyp_occur b1 on a.pid = b1.pid
left outer join skew_gcy_occur b2 on a.pid = b2.pid
left outer join skew_zcy_occur b3 on a.pid = b3.pid
left outer join skew_yp_self b4 on a.pid = b4.pid
left outer join skew_jc_declare b5 on a.pid = b5.pid
left outer join skew_zl_declare b6 on a.pid = b6.pid
left outer join skew_yycl_self b7 on a.pid = b7.pid
left outer join skew_qt_occure b8 on a.pid = b8.pid
left outer join skew_ycx_declare b9 on a.pid = b9.pid
left outer join skew_self_over_std b10 on a.pid = b10.pid
left outer join skew_med_insurance b11 on a.pid = b11.pid
left outer join skew_rural_assist b12 on a.pid = b12.pid
left outer join skew_available b13 on a.pid = b13.pid
left outer join skew_non_account b14 on a.pid = b14.pid
left outer join skew_personal_med_insurance b15 on a.pid = b15.pid;

drop table if exists feature_money_skew;
create table if not exists feature_money_skew as
select a.pid, a.hospital_day, a.skew_gzyp_occur, a.skew_gcy_occur, a.skew_zcy_occur, a.skew_yp_self, a.skew_jc_declare,
a.skew_zl_declare, a.skew_yycl_self, a.skew_qt_occure, a.skew_ycx_declare, a.skew_self_over_std,
a.skew_med_insurance, a.skew_rural_assist, a.skew_available, a.skew_non_account, a.skew_personal_med_insurance,
b.skew_approve
from feature_money_skew_part a
left outer join skew_approve b on a.pid = b.pid;


-- 关于detect的skew, 原理同上
drop table if exists detect_join_table;
create table if not exists detect_join_table as
select a.pid, a.day_gzjc_occur, a.day_jc_self, a.day_zl_self, a.day_ss_occur, a.day_ss_self,
a.day_ss_declare, a.day_gjcl_occur, a.day_cfsx_declare, a.day_qt_declare, a.day_std_pay,
a.day_servant_assist, a.day_med_assist_declare, a.day_disable_med_assist, a.day_rural_assist2,
b.avg_gzjc_occur, b.avg_jc_self, b.avg_zl_self, b.avg_ss_occur, b.avg_ss_self,
b.avg_ss_declare, b.avg_gjcl_occur, b.avg_cfsx_declare, b.avg_qt_declare, b.avg_std_pay,
b.avg_servant_assist, b.avg_med_assist_declare, b.avg_disable_med_assist, b.avg_rural_assist2
from day_detect a
left outer join tmp_detect_avg b on a.pid = b.pid;

drop table if exists detect_skew_up;
create table if not exists detect_skew_up as
select pid, sum(pow(day_gzjc_occur-avg_gzjc_occur,3)) as skew_up_gzjc_occur, sum(pow(day_jc_self-avg_jc_self,3)) as skew_up_jc_self, sum(pow(day_zl_self-avg_zl_self,3)) as skew_up_zl_self, sum(pow(day_ss_occur-avg_ss_occur,3)) as skew_up_ss_occur, sum(pow(day_ss_self-avg_ss_self,3)) as skew_up_ss_self,
sum(pow(day_ss_declare-avg_ss_declare,3)) as skew_up_ss_declare, sum(pow(day_gjcl_occur-avg_gjcl_occur,3)) as skew_up_gjcl_occur, sum(pow(day_cfsx_declare-avg_cfsx_declare,3)) as skew_up_cfsx_declare, sum(pow(day_qt_declare-avg_qt_declare,3)) as skew_up_qt_declare, sum(pow(day_std_pay-avg_std_pay,3)) as skew_up_std_pay,
sum(pow(day_servant_assist-avg_servant_assist,3)) as skew_up_servant_assist, sum(pow(day_med_assist_declare-avg_med_assist_declare,3)) as skew_up_med_assist_declare, sum(pow(day_disable_med_assist-avg_disable_med_assist,3)) as skew_up_disable_med_assist, sum(pow(day_rural_assist2-avg_rural_assist2,3)) as skew_up_rural_assist2
from detect_join_table
group by pid;

drop table if exists tmp_join_skew;
create table if not exists tmp_join_skew  as
select a.pid, a.skew_up_gzjc_occur, a.skew_up_jc_self, a.skew_up_zl_self, a.skew_up_ss_occur, a.skew_up_ss_self,
a.skew_up_ss_declare, a.skew_up_gjcl_occur, a.skew_up_cfsx_declare, a.skew_up_qt_declare, a.skew_up_std_pay,
a.skew_up_servant_assist, a.skew_up_med_assist_declare, a.skew_up_disable_med_assist, a.skew_up_rural_assist2,
b.std_gzjc_occur, b.std_jc_self, b.std_zl_self, b.std_ss_occur, b.std_ss_self,
b.std_ss_declare, b.std_gjcl_occur, b.std_cfsx_declare, b.std_qt_declare, b.std_std_pay,
b.std_servant_assist, b.std_med_assist_declare, b.std_disable_med_assist, b.std_rural_assist2,
c.hospital_day
from detect_skew_up a
left outer join tmp_detect_std b on a.pid = b.pid
left outer join feature_hospital_day c on a.pid = c.pid;

drop table if exists skew_gzjc_occur;
create table if not exists skew_gzjc_occur as
select pid, skew_up_gzjc_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gzjc_occur, 3) as skew_gzjc_occur
 from tmp_join_skew
where std_gzjc_occur != 0 and hospital_day > 2;

drop table if exists skew_jc_self;
create table if not exists skew_jc_self as
select pid, skew_up_jc_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_jc_self, 3) as skew_jc_self
 from tmp_join_skew
where std_jc_self != 0 and hospital_day > 2;

drop table if exists skew_zl_self;
create table if not exists skew_zl_self as
select pid, skew_up_zl_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zl_self, 3) as skew_zl_self
 from tmp_join_skew
where std_zl_self != 0 and hospital_day > 2;

drop table if exists skew_ss_occur;
create table if not exists skew_ss_occur as
select pid, skew_up_ss_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ss_occur, 3) as skew_ss_occur
 from tmp_join_skew
where std_ss_occur != 0 and hospital_day > 2;

drop table if exists skew_ss_self;
create table if not exists skew_ss_self as
select pid, skew_up_ss_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ss_self, 3) as skew_ss_self
 from tmp_join_skew
where std_ss_self != 0 and hospital_day > 2;

drop table if exists skew_ss_declare;
create table if not exists skew_ss_declare as
select pid, skew_up_ss_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ss_declare, 3) as skew_ss_declare
 from tmp_join_skew
where std_ss_declare != 0 and hospital_day > 2;

drop table if exists skew_gjcl_occur;
create table if not exists skew_gjcl_occur as
select pid, skew_up_gjcl_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gjcl_occur, 3) as skew_gjcl_occur
 from tmp_join_skew
where std_gjcl_occur != 0 and hospital_day > 2;

drop table if exists skew_cfsx_declare;
create table if not exists skew_cfsx_declare as
select pid, skew_up_cfsx_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_cfsx_declare, 3) as skew_cfsx_declare
 from tmp_join_skew
where std_cfsx_declare != 0 and hospital_day > 2;

drop table if exists skew_qt_declare;
create table if not exists skew_qt_declare as
select pid, skew_up_qt_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_qt_declare, 3) as skew_qt_declare
 from tmp_join_skew
where std_qt_declare != 0 and hospital_day > 2;

drop table if exists skew_std_pay;
create table if not exists skew_std_pay as
select pid, skew_up_std_pay*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_std_pay, 3) as skew_std_pay
 from tmp_join_skew
where std_std_pay != 0 and hospital_day > 2;

drop table if exists skew_servant_assist;
create table if not exists skew_servant_assist as
select pid, skew_up_servant_assist*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_servant_assist, 3) as skew_servant_assist
 from tmp_join_skew
where std_servant_assist != 0 and hospital_day > 2;

drop table if exists skew_med_assist_declare;
create table if not exists skew_med_assist_declare as
select pid, skew_up_med_assist_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_med_assist_declare, 3) as skew_med_assist_declare
 from tmp_join_skew
where std_med_assist_declare != 0 and hospital_day > 2;

drop table if exists skew_disable_med_assist;
create table if not exists skew_disable_med_assist as
select pid, skew_up_disable_med_assist*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_disable_med_assist, 3) as skew_disable_med_assist
 from tmp_join_skew
where std_disable_med_assist != 0 and hospital_day > 2;

drop table if exists skew_rural_assist2;
create table if not exists skew_rural_assist2 as
select pid, skew_up_rural_assist2*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_rural_assist2, 3) as skew_rural_assist2
 from tmp_join_skew
where std_rural_assist2 != 0 and hospital_day > 2;

drop table if exists feature_detect_skew;
create table if not exists feature_detect_skew as
select a.pid, a.hospital_day, b1.skew_gzjc_occur, b2.skew_jc_self, b3.skew_zl_self, b4.skew_ss_occur, b5.skew_ss_self,
b6.skew_ss_declare, b7.skew_gjcl_occur, b8.skew_cfsx_declare, b9.skew_qt_declare, b10.skew_std_pay,
b11.skew_servant_assist, b12.skew_med_assist_declare, b13.skew_disable_med_assist, b14.skew_rural_assist2
from tmp_join_skew a
left outer join skew_gzjc_occur b1 on a.pid = b1.pid
left outer join skew_jc_self b2 on a.pid = b2.pid
left outer join skew_zl_self b3 on a.pid = b3.pid
left outer join skew_ss_occur b4 on a.pid = b4.pid
left outer join skew_ss_self b5 on a.pid = b5.pid
left outer join skew_ss_declare b6 on a.pid = b6.pid
left outer join skew_gjcl_occur b7 on a.pid = b7.pid
left outer join skew_cfsx_declare b8 on a.pid = b8.pid
left outer join skew_qt_declare b9 on a.pid = b9.pid
left outer join skew_std_pay b10 on a.pid = b10.pid
left outer join skew_servant_assist b11 on a.pid = b11.pid
left outer join skew_med_assist_declare b12 on a.pid = b12.pid
left outer join skew_disable_med_assist b13 on a.pid = b13.pid
left outer join skew_rural_assist2 b14 on a.pid = b14.pid ;


-- 关于fee的特征
drop table if exists fee_pid_table;
create table if not exists fee_pid_table as
select a.seqid, a.pid, b.sm_stat, b.price
from renshe_df_test a
left outer join renshe_fee_detail b on a.seqid = b.seqid;


drop table if exists fee_id_table;
create table if not exists fee_id_table as
select pid, sm_stat, count(seqid) as count_id
from fee_pid_table
group by pid, sm_stat;

drop table if exists feature_id_1;
create table if not exists feature_id_1 as
select pid, count_id
from fee_id_table
where sm_stat = 1;

drop table if exists feature_id_2;
create table if not exists feature_id_2 as
select pid, count_id
from fee_id_table
where sm_stat = 2;

drop table if exists feature_id_3;
create table if not exists feature_id_3 as
select pid, count_id
from fee_id_table
where sm_stat = 3;

drop table if exists feature_id_6;
create table if not exists feature_id_6 as
select pid, count_id
from fee_id_table
where sm_stat = 6;

drop table if exists feature_id_7;
create table if not exists feature_id_7 as
select pid, count_id
from fee_id_table
where sm_stat = 7;


drop table if exists feature_num_price;
create table if not exists feature_num_price as
select pid, count(price) as num_price
from fee_pid_table
group by pid;

drop table if exists tmp_price_table;
create table if not exists tmp_price_table as
select pid, price, count(seqid) as count_seqid
from fee_pid_table
group by pid, price;

drop table if exists feature_num_un_price;
create table if not exists feature_num_un_price as
select pid, count(price) as num_un_price
from tmp_price_table
group by pid ;



drop table if exists tmp_good_price_table;
create table if not exists tmp_good_price_table as
select pid, count(price) as good_price_times, sum(count_seqid) as good_price_count
from tmp_price_table
where price in (
	select price
	from good_diff_price )
group by pid;

drop table if exists tmp_fake_price_table;
create table if not exists tmp_fake_price_table as
select pid, count(price) as fake_price_times, sum(count_seqid) as fake_price_count
from tmp_price_table
where price in (
	select price
	from fake_diff_price )
group by pid;


drop table if exists tmp_diff_price_table;
create table if not exists tmp_diff_price_table as
select pid, count(price) as diff_price_times, sum(count_seqid) as diff_price_count
from tmp_price_table
where price in (
	select price
	from big_diff_table  )
group by pid;


drop table if exists feature_fee_table;
create table if not exists feature_fee_table as
select a.pid , a.num_price , b.num_un_price ,
c.count_id as id_1, d.count_id as id_2, e.count_id as id_3, f.count_id as id_6, g.count_id as id_7,
h.good_price_times , h.good_price_count ,
i.fake_price_times , i.fake_price_count ,
j.diff_price_times , j.diff_price_count
from feature_num_price a
left outer join feature_num_un_price b on a.pid = b.pid
left outer join feature_id_1 c on a.pid = c.pid
left outer join feature_id_2 d on a.pid = d.pid
left outer join feature_id_3 e on a.pid = e.pid
left outer join feature_id_6 f on a.pid = f.pid
left outer join feature_id_7 g on a.pid = g.pid
left outer join tmp_good_price_table h on a.pid = h.pid
left outer join tmp_fake_price_table i on a.pid = i.pid
left outer join tmp_diff_price_table j on a.pid = j.pid ;


-- 特征总和
drop table if exists feature_test_all_0822 ;
create table if not exists feature_test_all_0822 as
select a.pid , a.sum_gzyp_occur, a.sum_gcy_occur, a.sum_zcy_occur, a.sum_yp_self, a.sum_jc_declare,
a.sum_zl_declare, a.sum_yycl_self, a.sum_qt_occure, a.sum_ycx_declare, a.sum_self_over_std,
a.sum_med_insurance, a.sum_rural_assist, a.sum_available, a.sum_non_account, a.sum_personal_med_insurance,
a.sum_approve,
b.avg_gzyp_occur, b.avg_gcy_occur, b.avg_zcy_occur, b.avg_yp_self, b.avg_jc_declare,
b.avg_zl_declare, b.avg_yycl_self, b.avg_qt_occure, b.avg_ycx_declare, b.avg_self_over_std,
b.avg_med_insurance, b.avg_rural_assist, b.avg_available, b.avg_non_account, b.avg_personal_med_insurance,
b.avg_approve,
c.std_gzyp_occur, c.std_gcy_occur, c.std_zcy_occur, c.std_yp_self, c.std_jc_declare,
c.std_zl_declare, c.std_yycl_self, c.std_qt_occure, c.std_ycx_declare, c.std_self_over_std,
c.std_med_insurance, c.std_rural_assist, c.std_available, c.std_non_account, c.std_personal_med_insurance,
c.std_approve,
d.max_gzyp_occur, d.max_gcy_occur, d.max_zcy_occur, d.max_yp_self, d.max_jc_declare,
d.max_zl_declare, d.max_yycl_self, d.max_qt_occure, d.max_ycx_declare, d.max_self_over_std,
d.max_med_insurance, d.max_rural_assist, d.max_available, d.max_non_account, d.max_personal_med_insurance,
d.max_approve,
e.sum_gzjc_occur, e.sum_jc_self, e.sum_zl_self, e.sum_ss_occur, e.sum_ss_self,
e.sum_ss_declare, e.sum_gjcl_occur, e.sum_cfsx_declare, e.sum_qt_declare, e.sum_std_pay,
e.sum_servant_assist, e.sum_med_assist_declare, e.sum_disable_med_assist, e.sum_rural_assist2,
f.pay_times ,f.hospital_day ,
f.total_interval ,f.avg_time_interval ,f.std_time_interval ,f.max_time_interval ,f.skew_time_interval ,
f.count_hospital ,cast(f.most_hospital_id as double) as most_hospital_id,f.count_most_hospital ,f.threehospital,
f.max_day_hospital ,f.avg_day_hospital ,f.min_day_hospital ,
g.skew_gzyp_occur, g.skew_gcy_occur, g.skew_zcy_occur, g.skew_yp_self, g.skew_jc_declare,
g.skew_zl_declare, g.skew_yycl_self, g.skew_qt_occure, g.skew_ycx_declare, g.skew_self_over_std,
g.skew_med_insurance, g.skew_rural_assist, g.skew_available, g.skew_non_account, g.skew_personal_med_insurance,
g.skew_approve,
h.skew_gzjc_occur, h.skew_jc_self, h.skew_zl_self, h.skew_ss_occur, h.skew_ss_self,
h.skew_ss_declare, h.skew_gjcl_occur, h.skew_cfsx_declare, h.skew_qt_declare, h.skew_std_pay,
h.skew_servant_assist, h.skew_med_assist_declare, h.skew_disable_med_assist, h.skew_rural_assist2,
i.num_price , i.num_un_price ,
i.id_1, i.id_2, i.id_3, i.id_6, i.id_7,
i.good_price_times , i.good_price_count ,
i.fake_price_times , i.fake_price_count ,
i.diff_price_times , i.diff_price_count
from feature_money_sum a
left outer join feature_money_avg b on a.pid = b.pid
left outer join feature_money_std c on a.pid = c.pid
left outer join feature_money_max d on a.pid = d.pid
left outer join feature_detect_sum e on a.pid = e.pid
left outer join feature_time_all f on a.pid = f.pid
left outer join feature_money_skew g on a.pid = g.pid
left outer join feature_detect_skew h on a.pid = h.pid
left outer join feature_fee_table i on a.pid = i.pid ;


-- 特征最后需要通过PAI对null补零






-- 关于日均detect费用, sum
drop table if exists day_detect;
drop table if exists feature_detect_sum;
drop table if exists tmp_detect_avg;
drop table if exists tmp_detect_std;

create table if not exists day_detect as
select pid, to_date(trans_time,'yyyy-mm-dd') as date_time, sum(gzjc_occur) as day_gzjc_occur, sum(jc_self) as day_jc_self, sum(zl_self) as day_zl_self, sum(ss_occur) as day_ss_occur, sum(ss_self) as day_ss_self,
sum(ss_declare) as day_ss_declare, sum(gjcl_occur) as day_gjcl_occur, sum(cfsx_declare) as day_cfsx_declare, sum(qt_declare) as day_qt_declare, sum(std_pay) as day_std_pay,
sum(servant_assist) as day_servant_assist, sum(med_assist_declare) as day_med_assist_declare, sum(disable_med_assist) as day_disable_med_assist, sum(rural_assist2) as day_rural_assist2
from not_null_train group by pid, trans_time;

create table if not exists feature_detect_sum as
select pid, sum(day_gzjc_occur) as sum_gzjc_occur, sum(day_jc_self) as sum_jc_self, sum(day_zl_self) as sum_zl_self, sum(day_ss_occur) as sum_ss_occur, sum(day_ss_self) as sum_ss_self,
sum(day_ss_declare) as sum_ss_declare, sum(day_gjcl_occur) as sum_gjcl_occur, sum(day_cfsx_declare) as sum_cfsx_declare, sum(day_qt_declare) as sum_qt_declare, sum(day_std_pay) as sum_std_pay,
sum(day_servant_assist) as sum_servant_assist, sum(day_med_assist_declare) as sum_med_assist_declare, sum(day_disable_med_assist) as sum_disable_med_assist, sum(day_rural_assist2) as sum_rural_assist2
from day_detect group by pid;

create table if not exists tmp_detect_avg as
select pid,avg(day_gzjc_occur) as avg_gzjc_occur, avg(day_jc_self) as avg_jc_self, avg(day_zl_self) as avg_zl_self, avg(day_ss_occur) as avg_ss_occur, avg(day_ss_self) as avg_ss_self,
avg(day_ss_declare) as avg_ss_declare, avg(day_gjcl_occur) as avg_gjcl_occur, avg(day_cfsx_declare) as avg_cfsx_declare, avg(day_qt_declare) as avg_qt_declare, avg(day_std_pay) as avg_std_pay,
avg(day_servant_assist) as avg_servant_assist, avg(day_med_assist_declare) as avg_med_assist_declare, avg(day_disable_med_assist) as avg_disable_med_assist, avg(day_rural_assist2) as avg_rural_assist2
from day_detect group by pid;

create table if not exists tmp_detect_std as
select pid,stddev_samp(day_gzjc_occur) as std_gzjc_occur, stddev_samp(day_jc_self) as std_jc_self, stddev_samp(day_zl_self) as std_zl_self, stddev_samp(day_ss_occur) as std_ss_occur, stddev_samp(day_ss_self) as std_ss_self,
stddev_samp(day_ss_declare) as std_ss_declare, stddev_samp(day_gjcl_occur) as std_gjcl_occur, stddev_samp(day_cfsx_declare) as std_cfsx_declare, stddev_samp(day_qt_declare) as std_qt_declare, stddev_samp(day_std_pay) as std_std_pay,
stddev_samp(day_servant_assist) as std_servant_assist, stddev_samp(day_med_assist_declare) as std_med_assist_declare, stddev_samp(day_disable_med_assist) as std_disable_med_assist, stddev_samp(day_rural_assist2) as std_rural_assist2
from day_detect group by pid;



-- 关于detect的skew, 原理同上
drop table if exists detect_join_table;
create table if not exists detect_join_table as
select a.pid, a.day_gzjc_occur, a.day_jc_self, a.day_zl_self, a.day_ss_occur, a.day_ss_self,
a.day_ss_declare, a.day_gjcl_occur, a.day_cfsx_declare, a.day_qt_declare, a.day_std_pay,
a.day_servant_assist, a.day_med_assist_declare, a.day_disable_med_assist, a.day_rural_assist2,
b.avg_gzjc_occur, b.avg_jc_self, b.avg_zl_self, b.avg_ss_occur, b.avg_ss_self,
b.avg_ss_declare, b.avg_gjcl_occur, b.avg_cfsx_declare, b.avg_qt_declare, b.avg_std_pay,
b.avg_servant_assist, b.avg_med_assist_declare, b.avg_disable_med_assist, b.avg_rural_assist2
from day_detect a
left outer join tmp_detect_avg b on a.pid = b.pid;

drop table if exists detect_skew_up;
create table if not exists detect_skew_up as
select pid, sum(pow(day_gzjc_occur-avg_gzjc_occur,3)) as skew_up_gzjc_occur, sum(pow(day_jc_self-avg_jc_self,3)) as skew_up_jc_self, sum(pow(day_zl_self-avg_zl_self,3)) as skew_up_zl_self, sum(pow(day_ss_occur-avg_ss_occur,3)) as skew_up_ss_occur, sum(pow(day_ss_self-avg_ss_self,3)) as skew_up_ss_self,
sum(pow(day_ss_declare-avg_ss_declare,3)) as skew_up_ss_declare, sum(pow(day_gjcl_occur-avg_gjcl_occur,3)) as skew_up_gjcl_occur, sum(pow(day_cfsx_declare-avg_cfsx_declare,3)) as skew_up_cfsx_declare, sum(pow(day_qt_declare-avg_qt_declare,3)) as skew_up_qt_declare, sum(pow(day_std_pay-avg_std_pay,3)) as skew_up_std_pay,
sum(pow(day_servant_assist-avg_servant_assist,3)) as skew_up_servant_assist, sum(pow(day_med_assist_declare-avg_med_assist_declare,3)) as skew_up_med_assist_declare, sum(pow(day_disable_med_assist-avg_disable_med_assist,3)) as skew_up_disable_med_assist, sum(pow(day_rural_assist2-avg_rural_assist2,3)) as skew_up_rural_assist2
from detect_join_table
group by pid;

drop table if exists tmp_join_skew;
create table if not exists tmp_join_skew  as
select a.pid, a.skew_up_gzjc_occur, a.skew_up_jc_self, a.skew_up_zl_self, a.skew_up_ss_occur, a.skew_up_ss_self,
a.skew_up_ss_declare, a.skew_up_gjcl_occur, a.skew_up_cfsx_declare, a.skew_up_qt_declare, a.skew_up_std_pay,
a.skew_up_servant_assist, a.skew_up_med_assist_declare, a.skew_up_disable_med_assist, a.skew_up_rural_assist2,
b.std_gzjc_occur, b.std_jc_self, b.std_zl_self, b.std_ss_occur, b.std_ss_self,
b.std_ss_declare, b.std_gjcl_occur, b.std_cfsx_declare, b.std_qt_declare, b.std_std_pay,
b.std_servant_assist, b.std_med_assist_declare, b.std_disable_med_assist, b.std_rural_assist2,
c.hospital_day
from detect_skew_up a
left outer join tmp_detect_std b on a.pid = b.pid
left outer join feature_hospital_day c on a.pid = c.pid;

drop table if exists skew_gzjc_occur;
create table if not exists skew_gzjc_occur as
select pid, skew_up_gzjc_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gzjc_occur, 3) as skew_gzjc_occur
 from tmp_join_skew
where std_gzjc_occur != 0 and hospital_day > 2;

drop table if exists skew_jc_self;
create table if not exists skew_jc_self as
select pid, skew_up_jc_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_jc_self, 3) as skew_jc_self
 from tmp_join_skew
where std_jc_self != 0 and hospital_day > 2;

drop table if exists skew_zl_self;
create table if not exists skew_zl_self as
select pid, skew_up_zl_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zl_self, 3) as skew_zl_self
 from tmp_join_skew
where std_zl_self != 0 and hospital_day > 2;

drop table if exists skew_ss_occur;
create table if not exists skew_ss_occur as
select pid, skew_up_ss_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ss_occur, 3) as skew_ss_occur
 from tmp_join_skew
where std_ss_occur != 0 and hospital_day > 2;

drop table if exists skew_ss_self;
create table if not exists skew_ss_self as
select pid, skew_up_ss_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ss_self, 3) as skew_ss_self
 from tmp_join_skew
where std_ss_self != 0 and hospital_day > 2;

drop table if exists skew_ss_declare;
create table if not exists skew_ss_declare as
select pid, skew_up_ss_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ss_declare, 3) as skew_ss_declare
 from tmp_join_skew
where std_ss_declare != 0 and hospital_day > 2;

drop table if exists skew_gjcl_occur;
create table if not exists skew_gjcl_occur as
select pid, skew_up_gjcl_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gjcl_occur, 3) as skew_gjcl_occur
 from tmp_join_skew
where std_gjcl_occur != 0 and hospital_day > 2;

drop table if exists skew_cfsx_declare;
create table if not exists skew_cfsx_declare as
select pid, skew_up_cfsx_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_cfsx_declare, 3) as skew_cfsx_declare
 from tmp_join_skew
where std_cfsx_declare != 0 and hospital_day > 2;

drop table if exists skew_qt_declare;
create table if not exists skew_qt_declare as
select pid, skew_up_qt_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_qt_declare, 3) as skew_qt_declare
 from tmp_join_skew
where std_qt_declare != 0 and hospital_day > 2;

drop table if exists skew_std_pay;
create table if not exists skew_std_pay as
select pid, skew_up_std_pay*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_std_pay, 3) as skew_std_pay
 from tmp_join_skew
where std_std_pay != 0 and hospital_day > 2;

drop table if exists skew_servant_assist;
create table if not exists skew_servant_assist as
select pid, skew_up_servant_assist*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_servant_assist, 3) as skew_servant_assist
 from tmp_join_skew
where std_servant_assist != 0 and hospital_day > 2;

drop table if exists skew_med_assist_declare;
create table if not exists skew_med_assist_declare as
select pid, skew_up_med_assist_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_med_assist_declare, 3) as skew_med_assist_declare
 from tmp_join_skew
where std_med_assist_declare != 0 and hospital_day > 2;

drop table if exists skew_disable_med_assist;
create table if not exists skew_disable_med_assist as
select pid, skew_up_disable_med_assist*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_disable_med_assist, 3) as skew_disable_med_assist
 from tmp_join_skew
where std_disable_med_assist != 0 and hospital_day > 2;

drop table if exists skew_rural_assist2;
create table if not exists skew_rural_assist2 as
select pid, skew_up_rural_assist2*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_rural_assist2, 3) as skew_rural_assist2
 from tmp_join_skew
where std_rural_assist2 != 0 and hospital_day > 2;

drop table if exists feature_detect_skew;
create table if not exists feature_detect_skew as
select a.pid, a.hospital_day, b1.skew_gzjc_occur, b2.skew_jc_self, b3.skew_zl_self, b4.skew_ss_occur, b5.skew_ss_self,
b6.skew_ss_declare, b7.skew_gjcl_occur, b8.skew_cfsx_declare, b9.skew_qt_declare, b10.skew_std_pay,
b11.skew_servant_assist, b12.skew_med_assist_declare, b13.skew_disable_med_assist, b14.skew_rural_assist2
from tmp_join_skew a
left outer join skew_gzjc_occur b1 on a.pid = b1.pid
left outer join skew_jc_self b2 on a.pid = b2.pid
left outer join skew_zl_self b3 on a.pid = b3.pid
left outer join skew_ss_occur b4 on a.pid = b4.pid
left outer join skew_ss_self b5 on a.pid = b5.pid
left outer join skew_ss_declare b6 on a.pid = b6.pid
left outer join skew_gjcl_occur b7 on a.pid = b7.pid
left outer join skew_cfsx_declare b8 on a.pid = b8.pid
left outer join skew_qt_declare b9 on a.pid = b9.pid
left outer join skew_std_pay b10 on a.pid = b10.pid
left outer join skew_servant_assist b11 on a.pid = b11.pid
left outer join skew_med_assist_declare b12 on a.pid = b12.pid
left outer join skew_disable_med_assist b13 on a.pid = b13.pid
left outer join skew_rural_assist2 b14 on a.pid = b14.pid ;




-- 关于fee的特征
drop table if exists fee_pid_table;
create table if not exists fee_pid_table as
select a.seqid, a.pid, b.sm_stat, b.price
from renshe_df_train a
left outer join renshe_fee_detail b on a.seqid = b.seqid;


drop table if exists fee_id_table;
create table if not exists fee_id_table as
select pid, sm_stat, count(seqid) as count_id
from fee_pid_table
group by pid, sm_stat;

drop table if exists feature_id_1;
create table if not exists feature_id_1 as
select pid, count_id
from fee_id_table
where sm_stat = 1;

drop table if exists feature_id_2;
create table if not exists feature_id_2 as
select pid, count_id
from fee_id_table
where sm_stat = 2;

drop table if exists feature_id_3;
create table if not exists feature_id_3 as
select pid, count_id
from fee_id_table
where sm_stat = 3;

drop table if exists feature_id_6;
create table if not exists feature_id_6 as
select pid, count_id
from fee_id_table
where sm_stat = 6;

drop table if exists feature_id_7;
create table if not exists feature_id_7 as
select pid, count_id
from fee_id_table
where sm_stat = 7;


drop table if exists feature_num_price;
create table if not exists feature_num_price as
select pid, count(price) as num_price
from fee_pid_table
group by pid;

drop table if exists tmp_price_table;
create table if not exists tmp_price_table as
select pid, price, count(seqid) as count_seqid
from fee_pid_table
group by pid, price;

drop table if exists feature_num_un_price;
create table if not exists feature_num_un_price as
select pid, count(price) as num_un_price
from tmp_price_table
group by pid ;

drop table if exists tmp_labeled_seqid_table;
create table if not exists tmp_labeled_seqid_table as
select a.pid, a.price , a.count_seqid , b.label
from tmp_price_table a
left outer join renshe_df_id_train b on a.pid = b.pid ;


drop table if exists labeled_count_price;
create table if not exists labeled_count_price as
select price, label, count(pid) as count_price
from tmp_labeled_seqid_table
group by price, label;

drop table if exists good_count_price;
create table if not exists good_count_price as
select price, count_price
from labeled_count_price
where label = 0;

drop table if exists fake_count_price;
create table if not exists fake_count_price as
select price, count_price
from labeled_count_price
where label = 1;

drop table if exists good_price;
create table if not exists good_price as
select price, count_price
from good_count_price
order by count_price desc
limit 200;

drop table if exists fake_price;
create table if not exists fake_price as
select price, count_price
from fake_count_price
order by count_price desc
limit 200;

drop table if exists fake_diff_price;
create table if not exists fake_diff_price as
select price, count_price
from fake_price
where price not in (
	select price
	from good_price);

drop table if exists good_diff_price;
create table if not exists good_diff_price as
select price, count_price
from good_price
where price not in (
	select price
	from fake_price);

drop table if exists no_diff_price;
create table if not exists no_diff_price as
select a.price, a.count_price as fake_count, b.count_price as good_count, (b.count_price/a.count_price) as rate
from fake_price a
join good_price b on a.price = b.price ;


drop table if exists big_diff_table;
create table if not exists big_diff_table as
select *
from no_diff_price
where rate>40;


drop table if exists tmp_good_price_table;
create table if not exists tmp_good_price_table as
select pid, label, count(price) as good_price_times, sum(count_seqid) as good_price_count
from tmp_labeled_seqid_table
where price in (
	select price
	from good_diff_price )
group by pid, label;

drop table if exists tmp_fake_price_table;
create table if not exists tmp_fake_price_table as
select pid, label, count(price) as fake_price_times, sum(count_seqid) as fake_price_count
from tmp_labeled_seqid_table
where price in (
	select price
	from fake_diff_price )
group by pid, label;


drop table if exists tmp_diff_price_table;
create table if not exists tmp_diff_price_table as
select pid, label, count(price) as diff_price_times, sum(count_seqid) as diff_price_count
from tmp_labeled_seqid_table
where price in (
	select price
	from big_diff_table  )
group by pid, label;


drop table if exists feature_fee_table;
create table if not exists feature_fee_table as
select a.pid , a.num_price , b.num_un_price ,
c.count_id as id_1, d.count_id as id_2, e.count_id as id_3, f.count_id as id_6, g.count_id as id_7,
h.good_price_times , h.good_price_count ,
i.fake_price_times , i.fake_price_count ,
j.diff_price_times , j.diff_price_count
from feature_num_price a
left outer join feature_num_un_price b on a.pid = b.pid
left outer join feature_id_1 c on a.pid = c.pid
left outer join feature_id_2 d on a.pid = d.pid
left outer join feature_id_3 e on a.pid = e.pid
left outer join feature_id_6 f on a.pid = f.pid
left outer join feature_id_7 g on a.pid = g.pid
left outer join tmp_good_price_table h on a.pid = h.pid
left outer join tmp_fake_price_table i on a.pid = i.pid
left outer join tmp_diff_price_table j on a.pid = j.pid ;

-- 特征总和
drop table if exists feature_all_0822 ;
create table if not exists feature_all_0822 as
select a.pid , a.sum_gzyp_occur, a.sum_gcy_occur, a.sum_zcy_occur, a.sum_yp_self, a.sum_jc_declare,
a.sum_zl_declare, a.sum_yycl_self, a.sum_qt_occure, a.sum_ycx_declare, a.sum_self_over_std,
a.sum_med_insurance, a.sum_rural_assist, a.sum_available, a.sum_non_account, a.sum_personal_med_insurance,
a.sum_approve,
b.avg_gzyp_occur, b.avg_gcy_occur, b.avg_zcy_occur, b.avg_yp_self, b.avg_jc_declare,
b.avg_zl_declare, b.avg_yycl_self, b.avg_qt_occure, b.avg_ycx_declare, b.avg_self_over_std,
b.avg_med_insurance, b.avg_rural_assist, b.avg_available, b.avg_non_account, b.avg_personal_med_insurance,
b.avg_approve,
c.std_gzyp_occur, c.std_gcy_occur, c.std_zcy_occur, c.std_yp_self, c.std_jc_declare,
c.std_zl_declare, c.std_yycl_self, c.std_qt_occure, c.std_ycx_declare, c.std_self_over_std,
c.std_med_insurance, c.std_rural_assist, c.std_available, c.std_non_account, c.std_personal_med_insurance,
c.std_approve,
d.max_gzyp_occur, d.max_gcy_occur, d.max_zcy_occur, d.max_yp_self, d.max_jc_declare,
d.max_zl_declare, d.max_yycl_self, d.max_qt_occure, d.max_ycx_declare, d.max_self_over_std,
d.max_med_insurance, d.max_rural_assist, d.max_available, d.max_non_account, d.max_personal_med_insurance,
d.max_approve,
e.sum_gzjc_occur, e.sum_jc_self, e.sum_zl_self, e.sum_ss_occur, e.sum_ss_self,
e.sum_ss_declare, e.sum_gjcl_occur, e.sum_cfsx_declare, e.sum_qt_declare, e.sum_std_pay,
e.sum_servant_assist, e.sum_med_assist_declare, e.sum_disable_med_assist, e.sum_rural_assist2,
f.pay_times ,f.hospital_day ,
f.total_interval ,f.avg_time_interval ,f.std_time_interval ,f.max_time_interval ,f.skew_time_interval ,
f.count_hospital ,cast(f.most_hospital_id as double) as most_hospital_id ,f.count_most_hospital ,f.threehospital,
f.max_day_hospital ,f.avg_day_hospital ,f.min_day_hospital ,
g.skew_gzyp_occur, g.skew_gcy_occur, g.skew_zcy_occur, g.skew_yp_self, g.skew_jc_declare,
g.skew_zl_declare, g.skew_yycl_self, g.skew_qt_occure, g.skew_ycx_declare, g.skew_self_over_std,
g.skew_med_insurance, g.skew_rural_assist, g.skew_available, g.skew_non_account, g.skew_personal_med_insurance,
g.skew_approve,
h.skew_gzjc_occur, h.skew_jc_self, h.skew_zl_self, h.skew_ss_occur, h.skew_ss_self,
h.skew_ss_declare, h.skew_gjcl_occur, h.skew_cfsx_declare, h.skew_qt_declare, h.skew_std_pay,
h.skew_servant_assist, h.skew_med_assist_declare, h.skew_disable_med_assist, h.skew_rural_assist2,
i.num_price , i.num_un_price ,
i.id_1, i.id_2, i.id_3, i.id_6, i.id_7,
i.good_price_times , i.good_price_count ,
i.fake_price_times , i.fake_price_count ,
i.diff_price_times , i.diff_price_count ,
j.label
from feature_money_sum a
left outer join feature_money_avg b on a.pid = b.pid
left outer join feature_money_std c on a.pid = c.pid
left outer join feature_money_max d on a.pid = d.pid
left outer join feature_detect_sum e on a.pid = e.pid
left outer join feature_time_all f on a.pid = f.pid
left outer join feature_money_skew g on a.pid = g.pid
left outer join feature_detect_skew h on a.pid = h.pid
left outer join feature_fee_table i on a.pid = i.pid
left outer join renshe_df_id_train j on a.pid = j.pid;


--#############################################################################################################################################################################################################
-- 关于日均的money费用sum, avg, std, max
drop table if exists day_money;
drop table if exists feature_money_sum;
drop table if exists feature_money_avg;
drop table if exists feature_money_std;
drop table if exists feature_money_max;


create table if not exists day_money as
select pid, to_date(trans_time,'yyyy-mm-dd') as date_time, sum(gzyp_occur) as day_gzyp_occur, sum(gcy_occur) as day_gcy_occur, sum(zcy_occur) as day_zcy_occur, sum(yp_self) as day_yp_self, sum(jc_declare) as day_jc_declare,
sum(zl_declare) as day_zl_declare, sum(yycl_self) as day_yycl_self, sum(qt_occure) as day_qt_occure, sum(ycx_declare) as day_ycx_declare, sum(self_over_std) as day_self_over_std,
sum(med_insurance) as day_med_insurance, sum(rural_assist) as day_rural_assist, sum(available) as day_available, sum(non_account) as day_non_account, sum(personal_med_insurance) as day_personal_med_insurance,
sum(approve) as day_approve
from not_null_train group by pid, trans_time;

create table if not exists feature_money_sum as
select pid, sum(day_gzyp_occur) as sum_gzyp_occur, sum(day_gcy_occur) as sum_gcy_occur, sum(day_zcy_occur) as sum_zcy_occur, sum(day_yp_self) as sum_yp_self, sum(day_jc_declare) as sum_jc_declare,
sum(day_zl_declare) as sum_zl_declare, sum(day_yycl_self) as sum_yycl_self, sum(day_qt_occure) as sum_qt_occure, sum(day_ycx_declare) as sum_ycx_declare, sum(day_self_over_std) as sum_self_over_std,
sum(day_med_insurance) as sum_med_insurance, sum(day_rural_assist) as sum_rural_assist, sum(day_available) as sum_available, sum(day_non_account) as sum_non_account, sum(day_personal_med_insurance) as sum_personal_med_insurance,
sum(day_approve) as sum_approve
from day_money group by pid;

create table if not exists feature_money_avg as
select pid, avg(day_gzyp_occur) as avg_gzyp_occur, avg(day_gcy_occur) as avg_gcy_occur, avg(day_zcy_occur) as avg_zcy_occur, avg(day_yp_self) as avg_yp_self, avg(day_jc_declare) as avg_jc_declare,
avg(day_zl_declare) as avg_zl_declare, avg(day_yycl_self) as avg_yycl_self, avg(day_qt_occure) as avg_qt_occure, avg(day_ycx_declare) as avg_ycx_declare, avg(day_self_over_std) as avg_self_over_std,
avg(day_med_insurance) as avg_med_insurance, avg(day_rural_assist) as avg_rural_assist, avg(day_available) as avg_available, avg(day_non_account) as avg_non_account, avg(day_personal_med_insurance) as avg_personal_med_insurance,
avg(day_approve) as avg_approve
from day_money group by pid;

create table if not exists feature_money_std as
select pid, stddev_samp(day_gzyp_occur) as std_gzyp_occur, stddev_samp(day_gcy_occur) as std_gcy_occur, stddev_samp(day_zcy_occur) as std_zcy_occur, stddev_samp(day_yp_self) as std_yp_self, stddev_samp(day_jc_declare) as std_jc_declare,
stddev_samp(day_zl_declare) as std_zl_declare, stddev_samp(day_yycl_self) as std_yycl_self, stddev_samp(day_qt_occure) as std_qt_occure, stddev_samp(day_ycx_declare) as std_ycx_declare, stddev_samp(day_self_over_std) as std_self_over_std,
stddev_samp(day_med_insurance) as std_med_insurance, stddev_samp(day_rural_assist) as std_rural_assist, stddev_samp(day_available) as std_available, stddev_samp(day_non_account) as std_non_account, stddev_samp(day_personal_med_insurance) as std_personal_med_insurance,
stddev_samp(day_approve) as std_approve
from day_money group by pid;

create table if not exists feature_money_max as
select pid, max(day_gzyp_occur) as max_gzyp_occur, max(day_gcy_occur) as max_gcy_occur, max(day_zcy_occur) as max_zcy_occur, max(day_yp_self) as max_yp_self, max(day_jc_declare) as max_jc_declare,
max(day_zl_declare) as max_zl_declare, max(day_yycl_self) as max_yycl_self, max(day_qt_occure) as max_qt_occure, max(day_ycx_declare) as max_ycx_declare, max(day_self_over_std) as max_self_over_std,
max(day_med_insurance) as max_med_insurance, max(day_rural_assist) as max_rural_assist, max(day_available) as max_available, max(day_non_account) as max_non_account, max(day_personal_med_insurance) as max_personal_med_insurance,
max(day_approve) as max_approve
from day_money group by pid;






-- 关于money费用的skew
drop table if exists money_join_table;
create table if not exists money_join_table as
select a.pid, a.day_gzyp_occur, a.day_gcy_occur, a.day_zcy_occur, a.day_yp_self, a.day_jc_declare,
a.day_zl_declare, a.day_yycl_self, a.day_qt_occure, a.day_ycx_declare, a.day_self_over_std,
a.day_med_insurance, a.day_rural_assist, a.day_available, a.day_non_account, a.day_personal_med_insurance,
a.day_approve,
b.avg_gzyp_occur, b.avg_gcy_occur, b.avg_zcy_occur, b.avg_yp_self, b.avg_jc_declare,
b.avg_zl_declare, b.avg_yycl_self, b.avg_qt_occure, b.avg_ycx_declare, b.avg_self_over_std,
b.avg_med_insurance, b.avg_rural_assist, b.avg_available, b.avg_non_account, b.avg_personal_med_insurance,
b.avg_approve
from day_money a
left outer join feature_money_avg b on a.pid = b.pid;

drop table if exists money_skew_up;
create table if not exists money_skew_up as
select pid, sum(pow(day_gzyp_occur-avg_gzyp_occur,3)) as skew_up_gzyp_occur, sum(pow(day_gcy_occur-avg_gcy_occur,3)) as skew_up_gcy_occur, sum(pow(day_zcy_occur-avg_zcy_occur,3)) as skew_up_zcy_occur, sum(pow(day_yp_self-avg_yp_self,3)) as skew_up_yp_self, sum(pow(day_jc_declare-avg_jc_declare,3)) as skew_up_jc_declare,
sum(pow(day_zl_declare-avg_zl_declare,3)) as skew_up_zl_declare, sum(pow(day_yycl_self-avg_yycl_self,3)) as skew_up_yycl_self, sum(pow(day_qt_occure-avg_qt_occure,3)) as skew_up_qt_occure, sum(pow(day_ycx_declare-avg_ycx_declare,3)) as skew_up_ycx_declare, sum(pow(day_self_over_std-avg_self_over_std,3)) as skew_up_self_over_std,
sum(pow(day_med_insurance-avg_med_insurance,3)) as skew_up_med_insurance, sum(pow(day_rural_assist-avg_rural_assist,3)) as skew_up_rural_assist, sum(pow(day_available-avg_available,3)) as skew_up_available, sum(pow(day_non_account-avg_non_account,3)) as skew_up_non_account, sum(pow(day_personal_med_insurance-avg_personal_med_insurance,3)) as skew_up_personal_med_insurance,
sum(pow(day_approve-avg_approve,3)) as skew_up_approve
from money_join_table
group by pid;

drop table if exists tmp_join_skew;
create table if not exists tmp_join_skew  as
select a.pid, a.skew_up_gzyp_occur, a.skew_up_gcy_occur, a.skew_up_zcy_occur, a.skew_up_yp_self, a.skew_up_jc_declare,
a.skew_up_zl_declare, a.skew_up_yycl_self, a.skew_up_qt_occure, a.skew_up_ycx_declare, a.skew_up_self_over_std,
a.skew_up_med_insurance, a.skew_up_rural_assist, a.skew_up_available, a.skew_up_non_account, a.skew_up_personal_med_insurance,
a.skew_up_approve,
b.std_gzyp_occur, b.std_gcy_occur, b.std_zcy_occur, b.std_yp_self, b.std_jc_declare,
b.std_zl_declare, b.std_yycl_self, b.std_qt_occure, b.std_ycx_declare, b.std_self_over_std,
b.std_med_insurance, b.std_rural_assist, b.std_available, b.std_non_account, b.std_personal_med_insurance,
b.std_approve,
c.hospital_day
from money_skew_up a
left outer join feature_money_std b on a.pid = b.pid
left outer join feature_hospital_day c on a.pid = c.pid;

drop table if exists skew_gzyp_occur;
create table if not exists skew_gzyp_occur as
select pid, skew_up_gzyp_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gzyp_occur, 3) as skew_gzyp_occur
 from tmp_join_skew
where std_gzyp_occur != 0 and hospital_day > 2;

drop table if exists skew_gcy_occur;
create table if not exists skew_gcy_occur as
select pid, skew_up_gcy_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gcy_occur, 3) as skew_gcy_occur
 from tmp_join_skew
where std_gcy_occur != 0 and hospital_day > 2;

drop table if exists skew_zcy_occur;
create table if not exists skew_zcy_occur as
select pid, skew_up_zcy_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zcy_occur, 3) as skew_zcy_occur
 from tmp_join_skew
where std_zcy_occur != 0 and hospital_day > 2;

drop table if exists skew_yp_self;
create table if not exists skew_yp_self as
select pid, skew_up_yp_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_yp_self, 3) as skew_yp_self
 from tmp_join_skew
where std_yp_self != 0 and hospital_day > 2;

drop table if exists skew_jc_declare;
create table if not exists skew_jc_declare as
select pid, skew_up_jc_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_jc_declare, 3) as skew_jc_declare
 from tmp_join_skew
where std_jc_declare != 0 and hospital_day > 2;

drop table if exists skew_zl_declare;
create table if not exists skew_zl_declare as
select pid, skew_up_zl_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zl_declare, 3) as skew_zl_declare
 from tmp_join_skew
where std_zl_declare != 0 and hospital_day > 2;

drop table if exists skew_yycl_self;
create table if not exists skew_yycl_self as
select pid, skew_up_yycl_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_yycl_self, 3) as skew_yycl_self
 from tmp_join_skew
where std_yycl_self != 0 and hospital_day > 2;

drop table if exists skew_qt_occure;
create table if not exists skew_qt_occure as
select pid, skew_up_qt_occure*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_qt_occure, 3) as skew_qt_occure
 from tmp_join_skew
where std_qt_occure != 0 and hospital_day > 2;

drop table if exists skew_ycx_declare;
create table if not exists skew_ycx_declare as
select pid, skew_up_ycx_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ycx_declare, 3) as skew_ycx_declare
 from tmp_join_skew
where std_ycx_declare != 0 and hospital_day > 2;

drop table if exists skew_self_over_std;
create table if not exists skew_self_over_std as
select pid, skew_up_self_over_std*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_self_over_std, 3) as skew_self_over_std
 from tmp_join_skew
where std_self_over_std != 0 and hospital_day > 2;

drop table if exists skew_med_insurance;
create table if not exists skew_med_insurance as
select pid, skew_up_med_insurance*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_med_insurance, 3) as skew_med_insurance
 from tmp_join_skew
where std_med_insurance != 0 and hospital_day > 2;

drop table if exists skew_rural_assist;
create table if not exists skew_rural_assist as
select pid, skew_up_rural_assist*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_rural_assist, 3) as skew_rural_assist
 from tmp_join_skew
where std_rural_assist != 0 and hospital_day > 2;

drop table if exists skew_available;
create table if not exists skew_available as
select pid, skew_up_available*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_available, 3) as skew_available
 from tmp_join_skew
where std_available != 0 and hospital_day > 2;

drop table if exists skew_non_account;
create table if not exists skew_non_account as
select pid, skew_up_non_account*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_non_account, 3) as skew_non_account
 from tmp_join_skew
where std_non_account != 0 and hospital_day > 2;

drop table if exists skew_personal_med_insurance;
create table if not exists skew_personal_med_insurance as
select pid, skew_up_personal_med_insurance*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_personal_med_insurance, 3) as skew_personal_med_insurance
 from tmp_join_skew
where std_personal_med_insurance != 0 and hospital_day > 2;

drop table if exists skew_approve;
create table if not exists skew_approve as
select pid, skew_up_approve*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_approve, 3) as skew_approve
 from tmp_join_skew
where std_approve != 0 and hospital_day > 2;

-- 最长只允许16个join
drop table if exists feature_money_skew_part;
create table if not exists feature_money_skew_part as
select a.pid, a.hospital_day, b1.skew_gzyp_occur, b2.skew_gcy_occur, b3.skew_zcy_occur, b4.skew_yp_self, b5.skew_jc_declare,
b6.skew_zl_declare, b7.skew_yycl_self, b8.skew_qt_occure, b9.skew_ycx_declare, b10.skew_self_over_std,
b11.skew_med_insurance, b12.skew_rural_assist, b13.skew_available, b14.skew_non_account, b15.skew_personal_med_insurance
from tmp_join_skew a
left outer join skew_gzyp_occur b1 on a.pid = b1.pid
left outer join skew_gcy_occur b2 on a.pid = b2.pid
left outer join skew_zcy_occur b3 on a.pid = b3.pid
left outer join skew_yp_self b4 on a.pid = b4.pid
left outer join skew_jc_declare b5 on a.pid = b5.pid
left outer join skew_zl_declare b6 on a.pid = b6.pid
left outer join skew_yycl_self b7 on a.pid = b7.pid
left outer join skew_qt_occure b8 on a.pid = b8.pid
left outer join skew_ycx_declare b9 on a.pid = b9.pid
left outer join skew_self_over_std b10 on a.pid = b10.pid
left outer join skew_med_insurance b11 on a.pid = b11.pid
left outer join skew_rural_assist b12 on a.pid = b12.pid
left outer join skew_available b13 on a.pid = b13.pid
left outer join skew_non_account b14 on a.pid = b14.pid
left outer join skew_personal_med_insurance b15 on a.pid = b15.pid;

drop table if exists feature_money_skew;
create table if not exists feature_money_skew as
select a.pid, a.hospital_day, a.skew_gzyp_occur, a.skew_gcy_occur, a.skew_zcy_occur, a.skew_yp_self, a.skew_jc_declare,
a.skew_zl_declare, a.skew_yycl_self, a.skew_qt_occure, a.skew_ycx_declare, a.skew_self_over_std,
a.skew_med_insurance, a.skew_rural_assist, a.skew_available, a.skew_non_account, a.skew_personal_med_insurance,
b.skew_approve
from feature_money_skew_part a
left outer join skew_approve b on a.pid = b.pid;




-- 关于money费用的skew
drop table if exists money_join_table;
create table if not exists money_join_table as
select a.pid, a.day_gzyp_occur, a.day_gcy_occur, a.day_zcy_occur, a.day_yp_self, a.day_jc_declare,
a.day_zl_declare, a.day_yycl_self, a.day_qt_occure, a.day_ycx_declare, a.day_self_over_std,
a.day_med_insurance, a.day_rural_assist, a.day_available, a.day_non_account, a.day_personal_med_insurance,
a.day_approve,
b.avg_gzyp_occur, b.avg_gcy_occur, b.avg_zcy_occur, b.avg_yp_self, b.avg_jc_declare,
b.avg_zl_declare, b.avg_yycl_self, b.avg_qt_occure, b.avg_ycx_declare, b.avg_self_over_std,
b.avg_med_insurance, b.avg_rural_assist, b.avg_available, b.avg_non_account, b.avg_personal_med_insurance,
b.avg_approve
from day_money a
left outer join feature_money_avg b on a.pid = b.pid;

drop table if exists money_skew_up;
create table if not exists money_skew_up as
select pid, sum(pow(day_gzyp_occur-avg_gzyp_occur,3)) as skew_up_gzyp_occur, sum(pow(day_gcy_occur-avg_gcy_occur,3)) as skew_up_gcy_occur, sum(pow(day_zcy_occur-avg_zcy_occur,3)) as skew_up_zcy_occur, sum(pow(day_yp_self-avg_yp_self,3)) as skew_up_yp_self, sum(pow(day_jc_declare-avg_jc_declare,3)) as skew_up_jc_declare,
sum(pow(day_zl_declare-avg_zl_declare,3)) as skew_up_zl_declare, sum(pow(day_yycl_self-avg_yycl_self,3)) as skew_up_yycl_self, sum(pow(day_qt_occure-avg_qt_occure,3)) as skew_up_qt_occure, sum(pow(day_ycx_declare-avg_ycx_declare,3)) as skew_up_ycx_declare, sum(pow(day_self_over_std-avg_self_over_std,3)) as skew_up_self_over_std,
sum(pow(day_med_insurance-avg_med_insurance,3)) as skew_up_med_insurance, sum(pow(day_rural_assist-avg_rural_assist,3)) as skew_up_rural_assist, sum(pow(day_available-avg_available,3)) as skew_up_available, sum(pow(day_non_account-avg_non_account,3)) as skew_up_non_account, sum(pow(day_personal_med_insurance-avg_personal_med_insurance,3)) as skew_up_personal_med_insurance,
sum(pow(day_approve-avg_approve,3)) as skew_up_approve
from money_join_table
group by pid;

drop table if exists tmp_join_skew;
create table if not exists tmp_join_skew  as
select a.pid, a.skew_up_gzyp_occur, a.skew_up_gcy_occur, a.skew_up_zcy_occur, a.skew_up_yp_self, a.skew_up_jc_declare,
a.skew_up_zl_declare, a.skew_up_yycl_self, a.skew_up_qt_occure, a.skew_up_ycx_declare, a.skew_up_self_over_std,
a.skew_up_med_insurance, a.skew_up_rural_assist, a.skew_up_available, a.skew_up_non_account, a.skew_up_personal_med_insurance,
a.skew_up_approve,
b.std_gzyp_occur, b.std_gcy_occur, b.std_zcy_occur, b.std_yp_self, b.std_jc_declare,
b.std_zl_declare, b.std_yycl_self, b.std_qt_occure, b.std_ycx_declare, b.std_self_over_std,
b.std_med_insurance, b.std_rural_assist, b.std_available, b.std_non_account, b.std_personal_med_insurance,
b.std_approve,
c.hospital_day
from money_skew_up a
left outer join feature_money_std b on a.pid = b.pid
left outer join feature_hospital_day c on a.pid = c.pid;

drop table if exists skew_gzyp_occur;
create table if not exists skew_gzyp_occur as
select pid, skew_up_gzyp_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gzyp_occur, 3) as skew_gzyp_occur
 from tmp_join_skew
where std_gzyp_occur != 0 and hospital_day > 2;

drop table if exists skew_gcy_occur;
create table if not exists skew_gcy_occur as
select pid, skew_up_gcy_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_gcy_occur, 3) as skew_gcy_occur
 from tmp_join_skew
where std_gcy_occur != 0 and hospital_day > 2;

drop table if exists skew_zcy_occur;
create table if not exists skew_zcy_occur as
select pid, skew_up_zcy_occur*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zcy_occur, 3) as skew_zcy_occur
 from tmp_join_skew
where std_zcy_occur != 0 and hospital_day > 2;

drop table if exists skew_yp_self;
create table if not exists skew_yp_self as
select pid, skew_up_yp_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_yp_self, 3) as skew_yp_self
 from tmp_join_skew
where std_yp_self != 0 and hospital_day > 2;

drop table if exists skew_jc_declare;
create table if not exists skew_jc_declare as
select pid, skew_up_jc_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_jc_declare, 3) as skew_jc_declare
 from tmp_join_skew
where std_jc_declare != 0 and hospital_day > 2;

drop table if exists skew_zl_declare;
create table if not exists skew_zl_declare as
select pid, skew_up_zl_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_zl_declare, 3) as skew_zl_declare
 from tmp_join_skew
where std_zl_declare != 0 and hospital_day > 2;

drop table if exists skew_yycl_self;
create table if not exists skew_yycl_self as
select pid, skew_up_yycl_self*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_yycl_self, 3) as skew_yycl_self
 from tmp_join_skew
where std_yycl_self != 0 and hospital_day > 2;

drop table if exists skew_qt_occure;
create table if not exists skew_qt_occure as
select pid, skew_up_qt_occure*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_qt_occure, 3) as skew_qt_occure
 from tmp_join_skew
where std_qt_occure != 0 and hospital_day > 2;

drop table if exists skew_ycx_declare;
create table if not exists skew_ycx_declare as
select pid, skew_up_ycx_declare*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_ycx_declare, 3) as skew_ycx_declare
 from tmp_join_skew
where std_ycx_declare != 0 and hospital_day > 2;

drop table if exists skew_self_over_std;
create table if not exists skew_self_over_std as
select pid, skew_up_self_over_std*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_self_over_std, 3) as skew_self_over_std
 from tmp_join_skew
where std_self_over_std != 0 and hospital_day > 2;

drop table if exists skew_med_insurance;
create table if not exists skew_med_insurance as
select pid, skew_up_med_insurance*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_med_insurance, 3) as skew_med_insurance
 from tmp_join_skew
where std_med_insurance != 0 and hospital_day > 2;

drop table if exists skew_rural_assist;
create table if not exists skew_rural_assist as
select pid, skew_up_rural_assist*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_rural_assist, 3) as skew_rural_assist
 from tmp_join_skew
where std_rural_assist != 0 and hospital_day > 2;

drop table if exists skew_available;
create table if not exists skew_available as
select pid, skew_up_available*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_available, 3) as skew_available
 from tmp_join_skew
where std_available != 0 and hospital_day > 2;

drop table if exists skew_non_account;
create table if not exists skew_non_account as
select pid, skew_up_non_account*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_non_account, 3) as skew_non_account
 from tmp_join_skew
where std_non_account != 0 and hospital_day > 2;

drop table if exists skew_personal_med_insurance;
create table if not exists skew_personal_med_insurance as
select pid, skew_up_personal_med_insurance*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_personal_med_insurance, 3) as skew_personal_med_insurance
 from tmp_join_skew
where std_personal_med_insurance != 0 and hospital_day > 2;

drop table if exists skew_approve;
create table if not exists skew_approve as
select pid, skew_up_approve*hospital_day/(hospital_day-1)/(hospital_day-2)/pow(std_approve, 3) as skew_approve
 from tmp_join_skew
where std_approve != 0 and hospital_day > 2;

-- 最长只允许16个join
drop table if exists feature_money_skew_part;
create table if not exists feature_money_skew_part as
select a.pid, a.hospital_day, b1.skew_gzyp_occur, b2.skew_gcy_occur, b3.skew_zcy_occur, b4.skew_yp_self, b5.skew_jc_declare,
b6.skew_zl_declare, b7.skew_yycl_self, b8.skew_qt_occure, b9.skew_ycx_declare, b10.skew_self_over_std,
b11.skew_med_insurance, b12.skew_rural_assist, b13.skew_available, b14.skew_non_account, b15.skew_personal_med_insurance
from tmp_join_skew a
left outer join skew_gzyp_occur b1 on a.pid = b1.pid
left outer join skew_gcy_occur b2 on a.pid = b2.pid
left outer join skew_zcy_occur b3 on a.pid = b3.pid
left outer join skew_yp_self b4 on a.pid = b4.pid
left outer join skew_jc_declare b5 on a.pid = b5.pid
left outer join skew_zl_declare b6 on a.pid = b6.pid
left outer join skew_yycl_self b7 on a.pid = b7.pid
left outer join skew_qt_occure b8 on a.pid = b8.pid
left outer join skew_ycx_declare b9 on a.pid = b9.pid
left outer join skew_self_over_std b10 on a.pid = b10.pid
left outer join skew_med_insurance b11 on a.pid = b11.pid
left outer join skew_rural_assist b12 on a.pid = b12.pid
left outer join skew_available b13 on a.pid = b13.pid
left outer join skew_non_account b14 on a.pid = b14.pid
left outer join skew_personal_med_insurance b15 on a.pid = b15.pid;

drop table if exists feature_money_skew;
create table if not exists feature_money_skew as
select a.pid, a.hospital_day, a.skew_gzyp_occur, a.skew_gcy_occur, a.skew_zcy_occur, a.skew_yp_self, a.skew_jc_declare,
a.skew_zl_declare, a.skew_yycl_self, a.skew_qt_occure, a.skew_ycx_declare, a.skew_self_over_std,
a.skew_med_insurance, a.skew_rural_assist, a.skew_available, a.skew_non_account, a.skew_personal_med_insurance,
b.skew_approve
from feature_money_skew_part a
left outer join skew_approve b on a.pid = b.pid;






select pid, label, prediction_result1 + prediction_result2 + prediction_result3 + prediction_result4 + prediction_result5 + prediction_result6 + prediction_result7 + prediction_result8 + prediction_result9 + prediction_result10 + prediction_result11 + prediction_result12 + prediction_result13 + prediction_result14 + prediction_result15 + prediction_result16 as label_sum
from ${t1};

select pid, label, case when label_sum>15 then '1' else '0' end as prediction_result from ${t1}



CREATE TABLE renshe_df_train (
	seqid STRING COMMENT '顺序号',
	pid STRING COMMENT '个人编码',
	hid STRING COMMENT '医院编码',
	yp_occur DOUBLE COMMENT '药品费发生金额',
	gzyp_occur DOUBLE COMMENT '贵重药品发生金额',
	gcy_occur DOUBLE COMMENT '中成药费发生金额',
	zcy_occur DOUBLE COMMENT '中草药费发生金额',
	yp_self DOUBLE COMMENT '药品费自费金额',
	yp_refuse DOUBLE COMMENT '药品费拒付金额',
	yp_declare DOUBLE COMMENT '药品费申报金额',
	jc_occur DOUBLE COMMENT '检查费发生金额',
	gzjc_occur DOUBLE COMMENT '贵重检查费金额',
	jc_self DOUBLE COMMENT '检查费自费金额',
	jc_refuse DOUBLE COMMENT '检查费拒付金额',
	jc_declare DOUBLE COMMENT '检查费申报金额',
	zl_occur DOUBLE COMMENT '治疗费发生金额',
	zl_self DOUBLE COMMENT '治疗费自费金额',
	zl_refuse DOUBLE COMMENT '治疗费拒付金额',
	zl_declare DOUBLE COMMENT '治疗费申报金额',
	ss_occur DOUBLE COMMENT '手术费发生金额',
	ss_self DOUBLE COMMENT '手术费自费金额',
	ss_refuse DOUBLE COMMENT '手术费拒付金额',
	ss_declare DOUBLE COMMENT '手术费申报金额',
	cw_occur DOUBLE COMMENT '床位费发生金额',
	cw_refuse DOUBLE COMMENT '床位费拒付金额',
	cw_declare DOUBLE COMMENT '床位费申报金额',
	yycl_occur DOUBLE COMMENT '医用材料发生金额',
	gjcl_occur DOUBLE COMMENT '高价材料发生金额',
	yycl_self DOUBLE COMMENT '医用材料费自费金额',
	yycl_refuse DOUBLE COMMENT '医用材料费拒付金额',
	sqx_declare DOUBLE COMMENT '输全血申报金额',
	cfsx_self DOUBLE COMMENT '成分输血自费金额',
	cfsx_refuse DOUBLE COMMENT '成分输血拒付金额',
	cfsx_declare DOUBLE COMMENT '成分输血申报金额',
	qt_occure DOUBLE COMMENT '其它发生金额',
	qt_refuse DOUBLE COMMENT '其它拒付金额',
	qt_declare DOUBLE COMMENT '其它申报金额',
	ycx_self DOUBLE COMMENT '一次性医用材料自费金额',
	ycx_refuse DOUBLE COMMENT '一次性医用材料拒付金额',
	ycx_declare DOUBLE COMMENT '一次性医用材料申报金额',
	sqx_self DOUBLE COMMENT '输全血按比例自负金额',
	std_pay DOUBLE COMMENT '起付线标准金额',
	self_over_std DOUBLE COMMENT '起付标准以上自负比例金额',
	med_assist DOUBLE COMMENT '医疗救助个人按比例负担金额',
	over_upper_limit DOUBLE COMMENT '最高限额以上金额',
	refuse_amount DOUBLE COMMENT '统筹拒付金额',
	med_insurance DOUBLE COMMENT '基本医疗保险统筹基金支付金额',
	trans_time STRING COMMENT '交易时间',
	farmer_assist DOUBLE COMMENT '农民工医疗救助计算金额',
	servant_assist DOUBLE COMMENT '公务员医疗补助基金支付金额',
	rural_assist DOUBLE COMMENT '城乡救助补助金额',
	available DOUBLE COMMENT '可用账户报销金额',
	personal_med_insurance DOUBLE COMMENT '基本医疗保险个人账户支付金额',
	non_account DOUBLE COMMENT '非账户支付金额',
	return STRING COMMENT '双笔退费标识',
	start_datetime STRING COMMENT '住院开始时间',
	end_datetime STRING COMMENT '住院终止时间',
	duration DOUBLE COMMENT '住院天数',
	declare_accept STRING COMMENT '申报受理时间',
	disease STRING COMMENT '出院诊断病种名称',
	approve DOUBLE COMMENT '本次审批金额',
	assist_approve DOUBLE COMMENT '补助审批金额',
	med_assist_declare STRING COMMENT '医疗救助医院申请',
	disable_med_assist DOUBLE COMMENT '残疾军人医疗补助基金支付金额',
	gov_med_assist DOUBLE COMMENT '民政救助补助金额',
	rural_assist2 DOUBLE COMMENT '城乡优抚补助金额',
	sars_assist DOUBLE COMMENT '非典补助补助金额',
	home_bed DOUBLE COMMENT '家床起付线剩余',
	trans_time2 STRING COMMENT '操作时间'
)
COMMENT '训练集字段明细';


CREATE TABLE renshe_fee_detail (
	seqid STRING COMMENT '顺序号',
	hid STRING COMMENT '医院编码',
	sm_stat DOUBLE COMMENT '三目统计项目',
	sm_proj_name STRING COMMENT '三目服务项目名称',
	sm_hos_proj_name STRING COMMENT '三目医院服务项目名称',
	type STRING COMMENT '剂型',
	standard STRING COMMENT '规格',
	price DOUBLE COMMENT '单价',
	amount DOUBLE COMMENT '数量',
	reason_code STRING COMMENT '拒付原因编码',
	reason STRING COMMENT '拒付原因',
	datetime_1 STRING COMMENT '费用发生时间'
)
COMMENT '费用明细补充表';
