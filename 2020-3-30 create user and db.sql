create database books;
create user books;
create user 'books'@'localhost' identified by 'books';
grant all privileges on books.* to 'books'@'localhost';