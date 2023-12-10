-- P1 : database and tables creation 
CREATE DATABASE book_my_show;

USE book_my_show;

CREATE TABLE theatres (
    theatre_id INT PRIMARY KEY,
    theatre_name VARCHAR(255),
    location VARCHAR(255)
);

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(255),
    genre VARCHAR(255),
    language VARCHAR(255),
    format_type VARCHAR(10)
);

CREATE TABLE shows (
    show_id INT PRIMARY KEY,
    movie_id INT,
    theatre_id INT,
    show_date DATE,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    show_id INT,
    booking_date DATE,
    user_id INT,
    num_tickets INT,
    FOREIGN KEY (show_id) REFERENCES shows(show_id),
		FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- Insert Sample Data Into Tables

-- Inserting Theatre Data
INSERT INTO theatres (theatre_id,theatre_name,location) VALUES (1, 'PVR Icon', 'Hyderabad, TA');

-- Inserting Movie Data
INSERT INTO movies (movie_id, movie_name, genre, language, format_type) VALUES 
    (1, 'Inception', 'Sci-Fi', 'English', '2D'),
    (2, 'The Dark Night', 'Action', 'English', '3D');

-- Inserting Shows Data for 7 Days
INSERT INTO shows (show_id, movie_id, theatre_id, show_date, start_time, end_time) VALUES
    (1, 1, 1, '2023-12-01', '18:00:00', '20:30:00'),
    (2, 2, 1, '2023-12-01', '19:30:00', '22:00:00'),
    (3, 1, 1, '2023-12-02', '17:00:00', '19:30:00'),
    (4, 2, 1, '2023-12-02', '20:00:00', '22:30:00'),
    (5, 1, 1, '2023-12-03', '18:30:00', '21:00:00'),
    (6, 2, 1, '2023-12-03', '19:00:00', '21:30:00'),
    (7, 1, 1, '2023-12-04', '16:30:00', '19:00:00'),
    (8, 2, 1, '2023-12-04', '21:00:00', '23:30:00'),
    (9, 1, 1, '2023-12-05', '18:00:00', '20:30:00'),
    (10, 2, 1, '2023-12-05', '20:30:00', '23:00:00'),
    (11, 1, 1, '2023-12-06', '17:30:00', '20:00:00'),
    (12, 2, 1, '2023-12-06', '19:00:00', '21:30:00'),
    (13, 1, 1, '2023-12-07', '18:00:00', '20:30:00'),
    (14, 2, 1, '2023-12-07', '20:30:00', '23:00:00');

-- Inserting Users Data
INSERT INTO users (user_id, user_name, email, phone_number) VALUES
    (1, 'Raja Varra', 'raja.va12@gmail.com', '777-456-7890'),
    (2, 'Krishna Murthy', 'kmurthy@gmail.com', '987-654-3210'),
    (3, 'Meghana Rao', 'maggirao123@gmail.com', '896-789-0123');

-- Inserting Bookings Data
INSERT INTO bookings (booking_id, show_id, booking_date, user_id, num_tickets) VALUES
    (1, 1, '2023-12-01', 1, 3),
    (2, 2, '2023-12-01', 2, 2),
    (3, 3, '2023-12-02', 3, 4);

-- P2: Write a query to list down all the shows on a given date at a given theatre along with their respective show timings.

SELECT shows.show_id, movies.movie_name,movies.format_type, shows.start_time, shows.end_time  FROM shows
JOIN movies ON shows.movie_id = movies.movie_id
WHERE shows.show_date = '2023-12-01' AND shows.theatre_id = 1;
