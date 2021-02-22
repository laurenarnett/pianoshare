-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    username TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE pianos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL
);
