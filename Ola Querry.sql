create database ola;
use ola;
#Question:1 Check Rides Cancelled By Customers;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `canceled_rides_by_customer` AS
    SELECT 
        COUNT(0) AS `count(*)`
    FROM
        `bookings`
    WHERE
        (`bookings`.`Booking_Status` = 'Canceled by Customer')
        
#question:2 Which type of ratings given customers;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `customer_rating_per_vehicle_type` AS
    SELECT 
        `bookings`.`Vehicle_Type` AS `Vehicle_Type`,
        AVG(`bookings`.`Customer_Rating`) AS `average_customer_rating`
    FROM
        `bookings`
    GROUP BY `bookings`.`Vehicle_Type`
    #question:3 show all Incomplete rides status;
     CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `incomplete_rides_reason` AS
    SELECT 
        `bookings`.`Booking_ID` AS `Booking_ID`,
        `bookings`.`Incomplete_Rides_Reason` AS `Incomplete_Rides_Reason`
    FROM
        `bookings`
    WHERE
        (`bookings`.`Incomplete_Rides` = 'yes')
#question:4 What is the customer rating each driver has recieved from customers;
        CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `maximum_and_minimum_driver_rating` AS
    SELECT 
        MAX(`bookings`.`Driver_Ratings`) AS `max_rating`,
        MIN(`bookings`.`Driver_Ratings`) AS `min_rating`
    FROM
        `bookings`
    WHERE
        (`bookings`.`Vehicle_Type` = 'Prime Sedan')
#question:5 what is the distance between each ride;
        CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `ride_distance_for_each_veichel` AS
    SELECT 
        `bookings`.`Vehicle_Type` AS `Vehicle_Type`,
        AVG(`bookings`.`Ride_Distance`) AS `avg_distance`
    FROM
        `bookings`
    GROUP BY `bookings`.`Vehicle_Type`
#Question:6 How many rides canceled by drivers;
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `rides_canceled_by_drivers_p_c_issues` AS
    SELECT 
        COUNT(0) AS `COUNT(*)`
    FROM
        `bookings`
    WHERE
        (`bookings`.`Canceled_Rides_by_Driver` = 'Personal $ Car related issues')
#Question:7 How many Bookings are successfuly Complete;
        CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `successfull_bookings` AS
    SELECT 
        `bookings`.`Date` AS `Date`,
        `bookings`.`Time` AS `Time`,
        `bookings`.`Booking_ID` AS `Booking_ID`,
        `bookings`.`Booking_Status` AS `Booking_Status`,
        `bookings`.`Customer_ID` AS `Customer_ID`,
        `bookings`.`Vehicle_Type` AS `Vehicle_Type`,
        `bookings`.`Pickup_Location` AS `Pickup_Location`,
        `bookings`.`Drop_Location` AS `Drop_Location`,
        `bookings`.`V_TAT` AS `V_TAT`,
        `bookings`.`C_TAT` AS `C_TAT`,
        `bookings`.`Canceled_Rides_by_Customer` AS `Canceled_Rides_by_Customer`,
        `bookings`.`Canceled_Rides_by_Driver` AS `Canceled_Rides_by_Driver`,
        `bookings`.`Incomplete_Rides` AS `Incomplete_Rides`,
        `bookings`.`Incomplete_Rides_Reason` AS `Incomplete_Rides_Reason`,
        `bookings`.`Booking_Value` AS `Booking_Value`,
        `bookings`.`Payment_Method` AS `Payment_Method`,
        `bookings`.`Ride_Distance` AS `Ride_Distance`,
        `bookings`.`Driver_Ratings` AS `Driver_Ratings`,
        `bookings`.`Customer_Rating` AS `Customer_Rating`,
        `bookings`.`Vehicle Images` AS `Vehicle Images`
    FROM
        `bookings`
    WHERE
        (`bookings`.`Booking_Status` = 'Success')
#question:8 Select top 5 Customer rides use multiple times;
        CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `top_5_customers` AS
    SELECT 
        `bookings`.`Customer_ID` AS `customer_id`,
        COUNT(`bookings`.`Booking_ID`) AS `total_rides`
    FROM
        `bookings`
    GROUP BY `bookings`.`Customer_ID`
    ORDER BY `total_rides` DESC
    LIMIT 5
#Question:9 how many rides successfully complete by drivers;
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `total_successful_ride_value` AS
    SELECT 
        SUM(`bookings`.`Booking_Value`) AS `total_Successful_ride_value`
    FROM
        `bookings`
    WHERE
        (`bookings`.`Booking_Status` = 'Success')
        
#question:10 How many customer pay by UPI payment;
        CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `upi_payment` AS
    SELECT 
        `bookings`.`Date` AS `Date`,
        `bookings`.`Time` AS `Time`,
        `bookings`.`Booking_ID` AS `Booking_ID`,
        `bookings`.`Booking_Status` AS `Booking_Status`,
        `bookings`.`Customer_ID` AS `Customer_ID`,
        `bookings`.`Vehicle_Type` AS `Vehicle_Type`,
        `bookings`.`Pickup_Location` AS `Pickup_Location`,
        `bookings`.`Drop_Location` AS `Drop_Location`,
        `bookings`.`V_TAT` AS `V_TAT`,
        `bookings`.`C_TAT` AS `C_TAT`,
        `bookings`.`Canceled_Rides_by_Customer` AS `Canceled_Rides_by_Customer`,
        `bookings`.`Canceled_Rides_by_Driver` AS `Canceled_Rides_by_Driver`,
        `bookings`.`Incomplete_Rides` AS `Incomplete_Rides`,
        `bookings`.`Incomplete_Rides_Reason` AS `Incomplete_Rides_Reason`,
        `bookings`.`Booking_Value` AS `Booking_Value`,
        `bookings`.`Payment_Method` AS `Payment_Method`,
        `bookings`.`Ride_Distance` AS `Ride_Distance`,
        `bookings`.`Driver_Ratings` AS `Driver_Ratings`,
        `bookings`.`Customer_Rating` AS `Customer_Rating`,
        `bookings`.`Vehicle Images` AS `Vehicle Images`
    FROM
        `bookings`
    WHERE
        (`bookings`.`Payment_Method` = 'UPI')