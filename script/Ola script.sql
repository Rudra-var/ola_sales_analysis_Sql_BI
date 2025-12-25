use ola;

#1. Retrieve all successful bookings:

create view Sucessful_Bookings as 
select * from bookings where Booking_Status='Success';


#2. Find the average ride distance for each vehicle type:

CREATE view ride_distance_for_each_vehicle as
SELECT Vehicle_Type, AVG(Ride_Distance)as AVG_DISTANCE FROM Bookings 
group by  Vehicle_Type;


#3. Get the total number of canceled rides by customers:

CREATE VIEW canceled_rides_by_customers AS
SELECT count(*) FROM bookings WHERE Booking_Status='Canceled by Customer';


#4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW highest_number_of_rides_by_cust AS
SELECT Customer_ID, COUNT(Booking_ID) AS Total_rides FROM Bookings  
Group by Customer_ID
order by Total_rides desc limit 5;

#5. Get the number of rides canceled by drivers due to personal and car-related issues:

CREATE VIEW canceled_by_drivers_due_to_P_C_issue as
SELECT  count(*)  FROM Bookings
WHERE Canceled_Rides_by_Driver='Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW maximum_and_minimum_driver_ratings_PS AS
SELECT MAX(Driver_Ratings),MIN(Driver_Ratings) FROM Bookings
WHERE Vehicle_Type = "Prime Sedan";

#7. Retrieve all rides where payment was made using UPI:

CREATE VIEW  payment_was_made_using_UPI as
SELECT * FROM Bookings 
WHERE Payment_Method = "UPI";

#8. Find the average customer rating per vehicle type:
CREATE VIEW AVG_CUST_RATING as 
select Vehicle_Type ,avg(Customer_Rating) as AVG_RATING From Bookings
group by Vehicle_Type;



#9. Calculate the total booking value of rides completed successfully:

CREATE VIEW total_booking_value_comp_succs as
Select sum(Booking_Value) from bookings where Booking_Status="Success";



#10. List all incomplete rides along with the reason:

CREATE VIEW incomplete_rides_REASONS as
Select Booking_ID,Incomplete_Rides_Reason from Bookings
where Incomplete_Rides='Yes';

select * from incomplete_rides_REASONS;




