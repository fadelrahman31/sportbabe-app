CREATE TABLE "User" (
  "id" varchar PRIMARY KEY,
  "nama" varchar,
  "email" varchar,
  "password" varchar,
  "phone" varchar,
  "registered_at" timestamp
);

CREATE TABLE "Bebep" (
  "id" varchar PRIMARY KEY,
  "user_id" varchar,
  "balance" numeric
);

CREATE TABLE "Venue" (
  "id" varchar PRIMARY KEY,
  "image_path" varchar,
  "name" varchar,
  "category" varchar,
  "address" varchar,
  "price_per_hour" numeric,
  "open_hour" varchar,
  "close_hour" varchar,
  "registered_at" varchar
);

CREATE TABLE "Booking" (
  "id" varchar PRIMARY KEY,
  "user_id" varchar,
  "venue_id" varchar,
  "start_hour" varchar,
  "end_hour" varchar,
  "total_price" varchar,
  "booked_at" timestamp,
  "isFinished" boolean
);

CREATE TABLE "AvailableHour" (
  "id" varchar PRIMARY KEY,
  "venue_id" varchar,
  "hour" varchar,
  "available" boolean
);

CREATE TABLE "BookingHistory" (
  "id" varchar PRIMARY KEY,
  "user_id" varchar,
  "booking_id" varchar
);

ALTER TABLE "Bebep" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Booking" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Booking" ADD FOREIGN KEY ("venue_id") REFERENCES "Venue" ("id");

ALTER TABLE "AvailableHour" ADD FOREIGN KEY ("venue_id") REFERENCES "Venue" ("id");

ALTER TABLE "BookingHistory" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "BookingHistory" ADD FOREIGN KEY ("booking_id") REFERENCES "Booking" ("id");
