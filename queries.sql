-- Query 1: JOIN
select booking_id, users.name as customer_name, vehicles.name as vehicle_name, start_date, end_date, bookings.status from bookings inner join users using(user_id) inner join vehicles using(vehicle_id);

-- Query 2: EXISTS
select * from vehicles where not exists(select 1 from bookings where bookings.vehicle_id = vehicles.vehicle_id);

-- Query 3: WHERE
select * from vehicles where status='available' and vehicles.type='car';

-- Query 4: GROUP BY and HAVING
select vehicles.name as vehicle_name, count(*) from bookings inner join vehicles using(vehicle_id) group by vehicles.name having count(booking_id) > 2;