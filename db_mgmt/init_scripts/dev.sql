-- Create the api service account role
CREATE ROLE super_user_role SUPERUSER CREATEDB CREATEROLE;

-- DB level privs
GRANT ALL ON DATABASE postgres TO postgres;

-- Add users to roles
GRANT postgres TO super_user_role;

--
-- Needs to run after prisma reset
--
-- Schema & table level privs
GRANT USAGE ON SCHEMA public TO postgres;

GRANT CREATE ON SCHEMA public TO postgres;

GRANT ALL ON ALL TABLES IN SCHEMA public TO postgres;

GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO postgres;

-- API privs
GRANT USAGE ON SCHEMA public TO postgres;

GRANT ALL ON ALL TABLES IN SCHEMA public TO postgres;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT
SELECT
, INSERT, UPDATE, DELETE ON TABLES TO postgres;

