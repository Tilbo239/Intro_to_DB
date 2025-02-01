
-- Create database 'alx_book_store'

CREATE DATABASE IF NOT EXISTS alx_book_store ;

-- Create a table named `Books` if it doesn't exist

CREATE TABLE IF NOT EXISTS Books (
  book_id INT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT,
  price DOUBLE,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

--  Create a table named `Authors` if it doesn't exist

CREATE TABLE IF NOT EXISTS Authors (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(215)
);

--  Create a table named `Customers` if it doesn't exist

CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(215),
  email VARCHAR(215) NOT NULL UNIQUE,
  address TEXT,
);

-- Create a table named `Orders` if it doesn't exist

CREATE TABLE IF NOT EXISTS Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create a table named `Order_Details` if it doesn't exist

CREATE TABLE IF NOT EXISTS Order_Details (
  order_detail_id INT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);