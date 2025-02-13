SELECT * FROM classdb.`hotel reservation dataset`;
-- change the table name
Rename  table `hotel reservation dataset` to Hotel_Reserv_data;

Alter table hotel_reserv_data
rename column `room_type_reserved` to room_reserved;
Alter table hotel_reserv_data
rename column `avg_price_per_room` to avg_price_room;
select * from hotel_reserv_data;

-- 1. What is the total number of reservations in the dataset?  
Select  count(room_reserved) as total_reservation from hotel_reserv_data;

-- 2. Which meal plan is the most popular among guests?
  select type_of_meal_plan, count(type_of_meal_plan) as count_meal from hotel_reserv_data
  where booking_status = "Not_canceled"
  group by type_of_meal_plan 
  order by count_meal desc
  limit 1;
  
-- 3. What is the average price per room for reservations involving children? 
Select round(avg(avg_price_room),2) as avg_price from hotel_reserv_data
where no_of_children > 0;

-- 4. How many reservations were made for the year 2017 (replace XX with the desired year)?  
alter table hotel_reserv_data
add column reservation date after arrival_date;

update hotel_reserv_data
set reservation = date_sub(arrival_date,interval lead_time day);
select* from hotel_reserv_data;

select count(reservation) as count_reserv from hotel_reserv_data
 where reservation between "2017-01-01" and "2017-12-31";


-- 5. What is the most commonly booked room type? 
select room_reserved, count(room_reserved) as count_room_reserved from hotel_reserv_data
group by room_reserved
order by count_room_reserved desc
limit 1;

 -- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?  
 select count(room_reserved) as count_room_reserved from hotel_reserv_data
 where no_weekend_night > 0;
 
 -- 7.What is the highest and lowest lead time for reservations? 
 select max(Lead_time) as highest_lead_time, min(lead_time) as lowest_lead_time from hotel_reserv_data;

 
 -- 8. What is the most common market segment type for reservations? 
select market_segment_type, count(market_segment_type) as count_market from hotel_reserv_data
group by market_segment_type
order by count_market desc
limit 1;
-- 9. How many reservations have a booking status of "Confirmed"?  
select count(booking_status) as confirmed_booking_status from hotel_reserv_data
where booking_status = "Not_canceled";

-- 10. What is the total number of adults and children across all reservations?  
select sum(no_of_adults) as Total_Adults, sum(no_of_children) as Total_children,
sum(no_of_adults) + sum(no_of_children)as total_children_et_adult from hotel_reserv_data;

-- 11. What is the average number of weekend nights for reservations involving children?  
select round(avg(no_weekend_night),2) as avg_weekend_nights from hotel_reserv_data
where no_of_children > 0;

-- 12. How many reservations were made in each month of the year? 
-- m/d/YYYY
update hotel_reserv_data
set arrival_date = str_to_date(arrival_date,"%d/%m/%YYYY");
alter table hotel_reserv_data
add column month text;

update hotel_reserv_data
set arrival_date = replace(arrival_date,"-", "/");
set SQL_SAFE_UPDATES=0;
update hotel_reserv_data
set month = left(monthname(arrival_date),3);

select monthname(reservation) as mnt_name, month(reservation) as Mnt_number, count(reservation) as count_reserv from hotel_reserv_data
group by monthname(reservation) , month(reservation)
order by month(reservation);


 -- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
 alter table hotel_reserv_data
 rename column`no_of_weekend_nights` to no_weekend_night;
 
 alter table hotel_reserv_data
 rename column`no_of_week_nights` to no_week_night;
 
 select room_reserved, round(avg(no_weekend_night),2) + round(avg(no_week_night),2) as avg_no_of_night from hotel_reserv_data
 where booking_status = "Not_canceled"
 group by room_reserved
 order by avg_no_of_night desc;
 
-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?  
select room_reserved, count(room_reserved) as count_room_reserved, round(avg(avg_price_room),2) as avg_price from hotel_reserv_data
where no_of_children > 0
group by room_reserved
order by count_room_reserved desc
limit 1;

-- 15. Find the market segment type that generates the highest average price per room. 
select market_segment_type, round(avg(avg_price_room),2) as avg_price from hotel_reserv_data
group by market_segment_type
order by avg_price desc
limit 1;


