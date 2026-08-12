
create schema finance;
 select * from finance.cc_data;
 select * from finance.location_data;

# total number of transactions in cc_data table
 
select count(*) as total_transaction from cc_data;

# top 10 most frequent merchants in cc_data table

 select merchant, count(*) as transaction_count
 from cc_data
 group by merchant
 order by transaction_count desc
 limit 10;

# Average transaction amount for each category

 select category, avg(amt) as avg_tran_amt
 from cc_data
 group by category
 order by avg_tran_amt;

# Number of fraudulent transactions and percentage of total transactions that they represent
 select 
 sum(case when is_fraud = 1 then 1 else 0 end),
 (sum(case when is_fraud =1 then 1 else 0 end)/count(*))*100 as percentage_of_total
 from cc_data;

# join two tables to identify longitude and latitude

 select cc.*,ld.long,ld.lat
 from cc_data cc
 join location_data ld on cc.cc_num=ld.cc_num ;

# city with highest population

select city, max(city_pop) as highest_population
from cc_data
group by city
order by highest_population desc
limit 1;

# latest and earliest transactions

select
min(str_to_date(trans_date_trans-time,'%d-%m-%Y %H:%i')) as earliest_transaction,
max(str_to_date(trans_date_trans-time,'%d-%m-%Y %H:%i')) as latest_transaction
from cc_data;

# total amount spent

select sum(amt) as total_amt_spent
from cc_data;

# number of transactions in each category

select category, count(trans_num) as total_transactions
from cc_data
group by category
order by total_transactions desc;

# average amount transactions by gender

select gender,avg(amt) as average_amt
from cc_data
group by gender;

# name of day with highest average amount of transaction

select dayname(str_to_date(trans_date_trans_time, '%d-%m-%Y %H:%i')) as day_of_week,
avg(amt) as max_avg_amt
from cc_data
group by day_of_week
order by max_avg_amt desc
limit 1;




