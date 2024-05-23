-- SQL/insert_sample_data.sql

-- Insert sample users
INSERT INTO users (username, email, password, shopName, address, about) VALUES 
('user1', 'user1@example.com', 'password1', 'Shop 1', '123 Main St', 'About user1'),
('user2', 'user2@example.com', 'password2', 'Shop 2', '456 Elm St', 'About user2');

-- Insert sample posts
INSERT INTO posts (title, content, author) VALUES 
('First Post', 'This is the content of the first post', 'user1'),
('Second Post', 'This is the content of the second post', 'user2');
