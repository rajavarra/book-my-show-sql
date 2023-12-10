# Book My Show Database

This repository contains the SQL scripts for creating the database schema for BookMyShow, an online ticketing platform for booking movie shows.

## Database Structure

| Tables_in_book_my_show |
| ---------------------- |
| bookings               |
| movies                 |
| shows                  |
| theatres               |
| users                  |

## Theaters Table

| Field        | Type         | Null | Key | Default | Extra |
| ------------ | ------------ | ---- | --- | ------- | ----- |
| theatre_id   | int          | NO   | PRI | NULL    |       |
| theatre_name | varchar(255) | YES  |     | NULL    |       |
| location     | varchar(255) | YES  |     | NULL    |       |

## Movies Table

| Field       | Type         | Null | Key | Default | Extra |
| ----------- | ------------ | ---- | --- | ------- | ----- |
| movie_id    | int          | NO   | PRI | NULL    |       |
| movie_name  | varchar(255) | YES  |     | NULL    |       |
| genre       | varchar(255) | YES  |     | NULL    |       |
| language    | varchar(255) | YES  |     | NULL    |       |
| format_type | varchar(10)  | YES  |     | NULL    |       |

## Shows Table

| Field      | Type | Null | Key | Default | Extra |
| ---------- | ---- | ---- | --- | ------- | ----- |
| show_id    | int  | NO   | PRI | NULL    |       |
| movie_id   | int  | YES  | MUL | NULL    |       |
| theatre_id | int  | YES  | MUL | NULL    |       |
| show_date  | date | YES  |     | NULL    |       |
| start_time | time | YES  |     | NULL    |       |
| end_time   | time | YES  |     | NULL    |       |

## Users Table

| Field        | Type         | Null | Key | Default | Extra |
| ------------ | ------------ | ---- | --- | ------- | ----- |
| user_id      | int          | NO   | PRI | NULL    |       |
| user_name    | varchar(255) | YES  |     | NULL    |       |
| email        | varchar(255) | YES  |     | NULL    |       |
| phone_number | varchar(20)  | YES  |     | NULL    |       |

## Bookings Table

| Field        | Type | Null | Key | Default | Extra |
| ------------ | ---- | ---- | --- | ------- | ----- |
| booking_id   | int  | NO   | PRI | NULL    |       |
| show_id      | int  | YES  | MUL | NULL    |       |
| booking_date | date | YES  |     | NULL    |       |
| user_id      | int  | YES  | MUL | NULL    |       |
| num_tickets  | int  | YES  |     | NULL    |       |

### P2-Query results

| show_id | movie_name     | format_type | start_time | end_time |
| ------- | -------------- | ----------- | ---------- | -------- |
| 1       | Inception      | 2D          | 18:00:00   | 20:30:00 |
| 2       | The Dark Night | 3D          | 19:30:00   | 22:00:00 |
