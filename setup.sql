-- drop password database if it already exists, then create new password database
DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

-- set encryption to AES-256-CBC
SET block_encryption_mode = 'aes-256-cbc';

-- generate key from my last name
SET @key_str = UNHEX(SHA2('matters', 256));

-- create init vector
SET @init_vector = RANDOM_BYTES(16);

-- use the passwords database
USE passwords;

-- create a table for storing info
CREATE TABLE user_info (
    account_id INT AUTO_INCREMENT,
    website VARCHAR(255) NOT NULL,
    website_url VARCHAR(255) NOT NULL,
    firstname VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL,
    username VARCHAR(25) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password BLOB NOT NULL,
    comment TEXT,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (account_id)
);

-- insert data into  table
INSERT INTO user_info (website, website_url, firstname, lastname, username, email, password, comment)
  VALUES
     ('Google', 'https://www.Google.com', 'Joe', 'Byron', 'JosephB', 'JoeB@gmail.com', AES_ENCRYPT('Itiswhatitis', @key_str, @init_vector), 'google account'),
     ('Github', 'https://www.Github.com', 'Vadim', 'Vasily', 'vadimism', 'Vadim@gmail.com', AES_ENCRYPT('mrcool18', @key_str, @init_vector), 'github account'),
     ('Youtube', 'https://www.Youtube.com', 'Hyder', 'Prigo', 'hyderP', 'hydes@gmail.com', AES_ENCRYPT('Iamsupersmart', @key_str, @init_vector), 'youtube account'),
     ('Spotify', 'https://www.Spotify.com', 'Leroy', 'Jenkins', 'Leeeeeroy', 'Jenkins@gmail.com', AES_ENCRYPT('leeeeeeeeeroy', @key_str, @init_vector), 'spotify account'),
     ('Instagram', 'https://www.Instagram.com', 'Thomas', 'Jarnathan', 'TommyB', 'Tomms@gmail.com', AES_ENCRYPT('thatguy', @key_str, @init_vector), 'insta account'),
     ('faceit', 'https://www.faceit.com', 'Carter', 'Matters', 'Matt', 'MrMatt@gmail.com', AES_ENCRYPT('Muh1984', @key_str, @init_vector), 'faceit account'),
     ('Adobe', 'https://www.Adobe.com', 'Frank', 'Bismuth', 'FrankyB', 'BismuthFrank@gmail.com', AES_ENCRYPT('bismuthbronze', @key_str, @init_vector), 'adobe account'),
     ('Reddit', 'https://www.Reddit.com', 'Steve', 'Irwin', 'Stevie', 'SteveIrwin@gmail.com', AES_ENCRYPT('StingraysAreDumb', @key_str, @init_vector), 'reddit account'),
     ('Wikipedia', 'https://www.Wikipedia.com', 'Ken', 'Joe', 'Kenny', 'KenSouth@gmail.com', AES_ENCRYPT('YouGuyskilledKenny', @key_str, @init_vector), 'wikipedia account'),
     ('Apple', 'https://www.Apple.com', 'Ricky', 'Bobby', '2FirstNames', 'RickyBobby@gmail.com', AES_ENCRYPT('ifyournotfirstyourlast', @key_str, @init_vector), 'apple account')
;