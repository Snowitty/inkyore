-- create database
CREATE DATABASE IF NOT EXISTS inkyore_db;

-- use database
USE inkyore_db;

-- user
CREATE TABLE IF NOT EXISTS user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  avatar VARCHAR(255),
  email VARCHAR(100),
  role ENUM('admin', 'author') NOT NULL DEFAULT 'author'
  );

-- article
CREATE TABLE IF NOT EXISTS article (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  content TEXT,
  cover_image VARCHAR(255),
  directory_id INT,
  creator_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (directory_id) REFERENCES directory(id),
  FOREIGN KEY (creator_id) REFERENCES user(id)
  );

-- directory
CREATE TABLE IF NOT EXISTS directory (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  creator_id INT NOT NULL,
  directory_image VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (creator_id) REFERENCES user(id)
  );

-- attachment
CREATE TABLE IF NOT EXISTS attachment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  filename VARCHAR(255) NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  uploader_id INT NOT NULL,
  uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (uploader_id) REFERENCES user(id)
  );

-- page
CREATE TABLE IF NOT EXISTS page (
  id INT AUTO_INCREMENT PRIMARY KEY,
  page_name VARCHAR(100) NOT NULL,
  content TEXT,
  creator_id INT NOT NULL,
  cover_image VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (creator_id) REFERENCES user(id)
  );

-- tag
CREATE TABLE IF NOT EXISTS tag (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(50) NOT NULL,
  creator_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (creator_id) REFERENCES user(id)
  );

-- article-tag
CREATE TABLE IF NOT EXISTS article_tag (
  article_id INT,
  tag_id INT,
  PRIMARY KEY (article_id, tag_id),
  FOREIGN KEY (article_id) REFERENCES article(id),
  FOREIGN KEY (tag_id) REFERENCES tag(id)
  );
