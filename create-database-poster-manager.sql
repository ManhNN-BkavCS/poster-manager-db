CREATE DATABASE poster_manager;

USE poster_manager;

CREATE TABLE IF NOT EXISTS `users` (
    `id` VARCHAR(50) NOT NULL PRIMARY KEY , -- default uuid()
    `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
    `age` INT ,
    `gender` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ,
    `phone_number` VARCHAR(13) NOT NULL UNIQUE ,
    `email` VARCHAR(255) NOT NULL UNIQUE ,
    `password` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `posters` (
    `id` VARCHAR(50) NOT NULL PRIMARY KEY , -- default uuid()
    `user_id` VARCHAR(50) NOT NULL ,
    `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
    `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0 ,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE IF NOT EXISTS `images` (
    `id` VARCHAR(50) NOT NULL PRIMARY KEY , -- default uuid()
    `poster_id` VARCHAR(50) NOT NULL ,
    `image_url` VARCHAR(255) NOT NULL ,
    FOREIGN KEY (`poster_id`) REFERENCES `posters` (`id`) 
);

CREATE TABLE IF NOT EXISTS `comments` (
    `id` VARCHAR(50) NOT NULL PRIMARY KEY , -- default uuid()
    `poster_id` VARCHAR(50) NOT NULL ,
    `user_id` VARCHAR(50) NOT NULL ,
    `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0 ,
    FOREIGN KEY (`poster_id`) REFERENCES `posters` (`id`) ,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);
