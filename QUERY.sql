CREATE DATABASE football_ticket_booking_system;

-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup Template
-- DESCRIPTION: Pseudo-DDL Template for Table Creation & Data Insertion
-- INSTRUCTIONS: Replace 'TYPE' and the constraint placeholders with your own
--               actual data types, relational keys, and check criteria.
-- =========================================================================
  
-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;


-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
  user_id serial PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  email varchar(100) NOT NULL UNIQUE,
  role varchar(25) CHECK ( role IN ('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
)


-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
  match_id serial PRIMARY KEY,
  fixture varchar(100) NOT NULL,
  tournament_category varchar(50) NOT NULL,
  base_ticket_price int NOT NULL,
  match_status varchar(25)
    CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
  booking_id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES Users(user_id),
  match_id int NOT NULL REFERENCES Matches(match_id),
  seat_number varchar(20),
  payment_status varchar(20) 
    CHECK (payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
  total_cost int NOT NULL
);