BEGIN;
--
-- Create model User
--
CREATE TABLE "jockboAuth_user" ("id" serial NOT NULL PRIMARY KEY, "password" varchar(128) NOT NULL, "last_login" timestamp with time zone NULL, "email" varchar(255) NOT NULL UNIQUE, "nickname" varchar(30) NOT NULL, "university" varchar(100) NOT NULL, "is_active" boolean NOT NULL, "is_admin" boolean NOT NULL);
CREATE INDEX "jockboAuth_user_email_00162392_like" ON "jockboAuth_user" ("email" varchar_pattern_ops);
COMMIT;
