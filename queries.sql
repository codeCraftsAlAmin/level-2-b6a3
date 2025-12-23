-- create users table
create type user_role as enum('Admin', 'Customer');

create table
  users (
    user_id serial primary key, varchar(50) not null,
    name varchar(50) not null,
    email varchar(100) unique not null,
    password text not null,
    phone varchar(20) not null,
    role user_role not null
  );

-- create vehicles table
create type
  vehicle_type as enum('car', 'bike', 'truck');

create type
  status_type as enum('available', 'rented', 'maintenance');

create table
  vehicles (
    vehicle_id serial primary key,
    name varchar(50) not null,
    type vehicle_type not null,
    model int not null,
    registration_number varchar(50) unique not null,
    rental_price int not null,
    status status_type not null
  );

-- create bookings table
create type
  booking_status as enum('pending', 'confirmed', 'completed', 'cancelled');

create table
  bookings (
    booking_id serial primary key,
    user_id int references users (user_id),
    vehicle_id int references vehicles (vehicle_id),
    start_date date not null,
    end_date date not null,
    status booking_status not null,
    total_cost int not null
  );

-- Query 1: JOIN
select booking_id, users.name as customer_name, vehicles.name as vehicle_name, start_date, end_date, bookings.status from bookings inner join users using(user_id) inner join vehicles using(vehicle_id);

-- Query 2: EXISTS
select * from vehicles where not exists(select 1 from bookings where bookings.vehicle_id = vehicles.vehicle_id);

-- Query 3: WHERE
select * from vehicles where status='available' and vehicles.type='car';

-- Query 4: GROUP BY and HAVING
select vehicles.name as vehicle_name, count(*) from bookings inner join vehicles using(vehicle_id) group by vehicles.name having count(booking_id) > 2;