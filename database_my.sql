CREATE TABLE `User` (
  `id` varchar(255) PRIMARY KEY,
  `nama` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `phone` varchar(255),
  `registered_at` timestamp
);

CREATE TABLE `Bebep` (
  `id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255),
  `balance` numeric
);

CREATE TABLE `Venue` (
  `id` varchar(255) PRIMARY KEY,
  `image_path` varchar(255),
  `name` varchar(255),
  `category` varchar(255),
  `address` varchar(255),
  `price_per_hour` numeric,
  `open_hour` varchar(255),
  `close_hour` varchar(255),
  `registered_at` varchar(255)
);

CREATE TABLE `Booking` (
  `id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255),
  `venue_id` varchar(255),
  `start_hour` varchar(255),
  `end_hour` varchar(255),
  `total_price` varchar(255),
  `booked_at` timestamp,
  `isFinished` boolean
);

CREATE TABLE `AvailableHour` (
  `id` varchar(255) PRIMARY KEY,
  `venue_id` varchar(255),
  `hour` varchar(255),
  `available` boolean
);

CREATE TABLE `BookingHistory` (
  `id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255),
  `booking_id` varchar(255)
);

ALTER TABLE `Bebep` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `Booking` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `Booking` ADD FOREIGN KEY (`venue_id`) REFERENCES `Venue` (`id`);

ALTER TABLE `AvailableHour` ADD FOREIGN KEY (`venue_id`) REFERENCES `Venue` (`id`);

ALTER TABLE `BookingHistory` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `BookingHistory` ADD FOREIGN KEY (`booking_id`) REFERENCES `Booking` (`id`);
