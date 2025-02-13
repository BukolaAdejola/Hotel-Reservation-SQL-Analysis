# Hotel Reservation SQL Analysis


![59kzcy6l](https://github.com/user-attachments/assets/d0fff408-9f63-44af-bee9-631b6b8d6770)

## Table of Contents
- [Introduction](#Introduction)
- [Overview](#Overview)
- [Project Objective](#Project-Objective)
- [Data Cleaning](#Data-Cleaning)
- [Data Exploration and Insights](#Data-Exploration-and-Insights)
- [Recommendation](#Recommendation)
- [Conclusion](#Conclusion)

- ## Introduction
  The hotel industry relies on data to make informed decisions and provide a better guest experience.
   In this internship, I worked with a hotel reservation dataset to gain insights into guest preferences, booking trends,
   and other key factors that impact the hotel’s operations. I used SQL to query and analyze the data, as well as answer specific questions about the dataset.

  ## Overview
  The dataset includes the following columns:
-	Booking_ID:  A unique identifier for each hotel reservation
-	No_of_adults: The number of adults in the reservation.
-	No_of_children: The number of children in the reservation. 
-	No_of_weekend_nights: The number of nights in the reservation that fall on weekends. 
- No_of_week_nights: The number of nights in the reservation that fall on weekdays.
-Type_of_meal_plan: The meal plan chosen by the guests. 
-	Room_type_reserved: The type of room reserved by the guests. 
-	Lead_time: The number of days between booking and arrival.
-	Arrival_date: The date of arrival.
-	Market_segment_type: The market segment to which the reservation belongs. 
-	Avg_price_per_room: The average price per room in the reservation.
-	Booking_status: The status of the booking.
-The dataset also has 700 rows.


<img width="808" alt="Hotel Reservation ScreenShot" src="https://github.com/user-attachments/assets/7fd1e59d-2e11-4c1a-a694-044c25b429eb" />

## Data Cleaning
- Rename Table name and two other columns
```sql
Rename table `hotel reservation dataset` to Hotel_Reserv_data;
Alter table hotel_reserv_data
rename column `room_type_reserved` to room_reserved;
Alter table hotel_reserv_data
rename column `avg_price_per_room` to avg_price_room;
select * from hotel_reserv_data;
```
- Standardizing Data Formats
```sql
SET SQL_SAFE UPDATES = 0 
update hotel_reserv_data
set arrival_date = str_to_date(arrival_date,"%d/%m/%YYYY");
update hotel_reserv_data
set arrival_date = replace(arrival_date,"-", "/");
```
-Added column Month
```sql
alter table hotel_reserv_data
add column month text;
update hotel_reserv_data
set month = monthname(arrival_date);
```
## Data Exploration and Insights
•	What is the total number of reservations in the dataset?
Insights: The total number of reservations in this dataset is 700.

•	Which meal plan is the most popular among guests?
Insights: Meal Plan 1 is the most popular amongst guests.

•	What is the average price per room for reservations involving children?
Insights: Room_Type 6 has the highest average price of 189.47, followed by Room_Type7 having an average price of 187.04. Room_Type 1 and 4 has the lowest average price of 108.38 and 86.32.

•	How many reservations were made for the year 20XX (replace XX with the desired year)?
  Insights: The dataset has two years, 2017 and 2018. I decided to work with 2017.
In the year 2017, 194 reservations were made in total.

•	What is the most commonly booked room type?
Room_Type 1 is the most commonly booked room having a total count of 534.
•	How many reservations fall on a weekend (no_of_weekend_nights > 0)?
Insights: A total of 383 reservations falls on a weekend.

•	What is the highest and lowest lead time for reservations?
Insights: The highest and lowest lead time reservation is 443 and 0.

•	What is the most common market segment type for reservations?
Insights: The most common market segment is ONLINE.

•	How many reservations have a booking status of "Confirmed"?
Insights: 493 reservations.

•	What is the total number of adults and children across all reservations?
Insights: A total of 1385 of adults and children were made across all reservations.

•	What is the average number of weekend nights for reservations involving children?
Insights: Average number is 1.


•	How many reservations were made in each month of the year?
Insights: I will be selecting the top three and bottom two.
January	- 90
February - 80
0ctober – 74
June -36
November – 34

•	What is the average number of nights (both weekend and weekday) spent by guests for each room type?
Insights: The average number of nights for each room type are
Room_Type 1 – 2.79
Room_Type 2 – 3.17
Room_Type 4 – 3.45
Room_Type 5 – 2.50
Room_Type 6 – 3.11
Room_Type 7 – 2.60
 
•	 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
Insights: The most common Room_Tpye is Room_Type 1 which has an average price of 123.12.

•	 15. Find the market segment type that generates the highest average price per room.
Insights: The Online segment generates the highest with an average of 112.46

## Recommendation:
I recommend the optimization of the prices of Room_Type6 because it has the highest average price. Pricing strategies should be adjusted so as to maximize profits.
Three hundred and eighty_three reservations were made for weekends, attractive weekend packages should be developed to increase bookings.
Room_Type1 is the most popular among families. Consier offering family-friendly packages and promotions to attract more families.
Room_Type1 also has the highest lead time of 443.
Since Meal Plan 1 is the most popular, consider enhancing its value by adding more appaeling meals and also include discounts to make it more attractive.
Online is the most common market segment type and generates the highest average price per room. Invest in online marketing and advertising to attract more online booking.

## Conclusion:
The insights from this dataset provide valuable information for improving the hotel’s operations and revenue. 
The hotel should capitalize on high-performing meal plans, room types, and market segments while introducing strategies to boost 
bookings during low-demand periods. By implementing dynamic pricing, enhancing customer experience, and focusing on digital marketing, 
the hotel can maximize profitability and ensure long term success.



