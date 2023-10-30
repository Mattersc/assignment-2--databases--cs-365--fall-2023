SELECT * FROM user_info;

-- create new entry in databade
INSERT INTO user_info (website, website_url, firstname, lastname, username, email, password, comment) VALUES
    ('Logitech', 'https://www.Logitech.com/', 'John', 'Muh', 'JoMuh', 'JohnM@gmail.com', AES_ENCRYPT('themuh', @key_str, @init_vector), 'Logitech account');

-- get password from Apple.com entry
SELECT AES_DECRYPT(password, 'matters') FROM user_info WHERE website_url = 'https://www.Apple.com';

-- get all related data
SELECT * FROM user_info WHERE website_url LIKE 'https://%';

-- change url
UPDATE user_info SET website_url = 'https://www.Facebook.com' WHERE username = 'JosephB';

-- change password 
UPDATE user_info SET password = AES_ENCRYPT('changedPassword', @key_str, @init_vector) WHERE website_url = 'https://www.Reddit.com';

-- remove url
DELETE FROM user_info WHERE website_url = 'https://www.Adobe.com';

-- remove password
DELETE FROM user_info WHERE password = AES_ENCRYPT('mrcool18', @key_str, @init_vector);
