-- Create the main DB
CREATE DATABASE dub_system;

-- Create the api service account role
CREATE ROLE api_service_account NOSUPERUSER NOCREATEDB NOCREATEROLE;

CREATE ROLE db_service_account NOSUPERUSER NOCREATEDB NOCREATEROLE;

-- Lock down instance level access
REVOKE ALL ON DATABASE dub_system FROM public;

REVOKE ALL ON SCHEMA public FROM public;

-- Create users
CREATE USER ds_api;

CREATE USER ds_prisma;

CREATE USER ds_retool;

-- DB level privs
GRANT CONNECT ON DATABASE dub_system TO api_service_account;

GRANT ALL ON DATABASE dub_system TO db_service_account;

-- Add users to roles
GRANT api_service_account TO ds_api;

GRANT db_service_account TO ds_prisma;

GRANT api_service_account TO ds_retool;

--
-- Needs to run after prisma reset
--
-- Schema & table level privs
GRANT USAGE ON SCHEMA public TO db_service_account;

GRANT CREATE ON SCHEMA public TO db_service_account;

GRANT ALL ON ALL TABLES IN SCHEMA public TO db_service_account;

GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO db_service_account;

-- API privs
GRANT USAGE ON SCHEMA public TO api_service_account;

GRANT ALL ON ALL TABLES IN SCHEMA public TO api_service_account;

ALTER DEFAULT PRIVILEGES FOR ROLE api_service_account IN SCHEMA public GRANT
SELECT
, INSERT, UPDATE, DELETE ON TABLES TO api_service_account;

