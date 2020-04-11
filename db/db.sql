CREATE TYPE "type" AS ENUM (
  'laptop',
  'mobile',
  'phone',
  'monitor',
  'TV',
  'other'
);

CREATE TYPE "status" AS ENUM (
  'ready_for_assignment',
  'assigned',
  'on_repair',
  'retired',
  'lost'
);

CREATE TYPE "role" AS ENUM (
  'admin',
  'employee'
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "full_name" char(255),
  "username" char(255),
  "created_at" datetime,
  "role" role
);

CREATE TABLE "assets" (
  "id" SERIAL PRIMARY KEY,
  "asset_type" int,
  "asset_status" status NOT NULL,
  "price" int DEFAULT 0,
  "vendor" char(255),
  "assigned_user" int,
  "change_date" datetime,
  "description" varchar
);

CREATE TABLE "requset" (
  "id" SERIAL PRIMARY KEY,
  "title" char(255) NOT NULL,
  "description" varchar NOT NULL,
  "asset_type" int,
  "asset" int,
  "author" int
);

CREATE TABLE "asset_type" (
  "id" SERIAL PRIMARY KEY,
  "label" char(255) NOT NULL,
  "description" varchar DEFAULT null
);

ALTER TABLE "assets" ADD FOREIGN KEY ("asset_type") REFERENCES "asset_type" ("id");

ALTER TABLE "assets" ADD FOREIGN KEY ("assigned_user") REFERENCES "users" ("id");

ALTER TABLE "requset" ADD FOREIGN KEY ("asset_type") REFERENCES "asset_type" ("id");

ALTER TABLE "requset" ADD FOREIGN KEY ("asset") REFERENCES "assets" ("id");

ALTER TABLE "requset" ADD FOREIGN KEY ("author") REFERENCES "users" ("id");
