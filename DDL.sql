DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_pw VARCHAR(100) NOT NULL,
    user_ph VARCHAR(20),
    user_fname VARCHAR(255),
    user_lname VARCHAR(255) NOT NULL,
    user_dob DATE NOT NULL,
    user_pp VARCHAR(255),
    user_bio TEXT
);

INSERT INTO users (user_name, user_email, user_pw, user_ph, user_fname, user_lname, user_dob, user_pp, user_bio)
VALUES
    ('username1', 'user1@example.com', 'password1', '1234567890', 'John', 'Doe', '1990-01-01', 'profilepic1.jpg', 'Bio for user 1'),
    ('username2', 'user2@example.com', 'password2', NULL, 'Jane', 'Smith', '1995-05-15', 'profilepic2.jpg', NULL),
    ('username3', 'user3@example.com', 'password3', '9876543210', 'Alice', 'Johnson', '1988-09-30', 'profilepic3.jpg', 'Bio for user 3'),
    ('username4', 'user4@example.com', 'password4', NULL, 'Bob', 'Williams', '1985-07-20', NULL, NULL),
    ('username5', 'user5@example.com', 'password5', '5551234567', NULL, 'Brown', '1992-03-10', 'profilepic5.jpg', 'Bio for user 5'),
    ('username6', 'user6@example.com', 'password6', '1112223333', 'Emma', 'Taylor', '1983-12-05', 'profilepic6.jpg', NULL),
    ('username7', 'user7@example.com', 'password7', NULL, 'Michael', 'Martinez', '1998-08-18', NULL, NULL),
    ('username8', 'user8@example.com', 'password8', '9998887777', 'Olivia', 'Garcia', '1991-06-25', 'profilepic8.jpg', 'Bio for user 8'),
    ('username9', 'user9@example.com', 'password9', '4445556666', 'William', 'Jones', '1980-04-12', NULL, NULL),
    ('username10', 'user10@example.com', 'password10', NULL, NULL, 'Lee', '1993-11-22', 'profilepic10.jpg', NULL);
