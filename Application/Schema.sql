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
CREATE TABLE spaces (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    owner_id UUID NOT NULL,
    summary TEXT NOT NULL,
    locality TEXT NOT NULL,
    administrative_area TEXT NOT NULL,
    country TEXT NOT NULL,
    postal_code TEXT NOT NULL,
    thoroughfare TEXT NOT NULL,
    premise TEXT NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    space_type TEXT NOT NULL
);
CREATE TABLE reservations (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    space_id UUID NOT NULL,
    start_datetime TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    end_datetime TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
CREATE TABLE reviews (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    space_id UUID NOT NULL,
    author UUID NOT NULL,
    body TEXT NOT NULL
);
ALTER TABLE reservations ADD CONSTRAINT reservations_ref_space_id FOREIGN KEY (space_id) REFERENCES spaces (id) ON DELETE NO ACTION;
ALTER TABLE reservations ADD CONSTRAINT reservations_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE reviews ADD CONSTRAINT reviews_ref_author FOREIGN KEY (author) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE reviews ADD CONSTRAINT reviews_ref_space_id FOREIGN KEY (space_id) REFERENCES spaces (id) ON DELETE NO ACTION;
ALTER TABLE spaces ADD CONSTRAINT spaces_ref_owner_id FOREIGN KEY (owner_id) REFERENCES users (id) ON DELETE NO ACTION;
