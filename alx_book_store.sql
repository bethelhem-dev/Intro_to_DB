-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- ==========================================
-- ✅ AUTHORS TABLE
-- ==========================================
CREATE TABLE AUTHORS (
    AUTHOR_ID INT PRIMARY KEY AUTO_INCREMENT,
    AUTHOR_NAME VARCHAR(215) NOT NULL
);

-- ==========================================
-- ✅ BOOKS TABLE
-- ==========================================
CREATE TABLE BOOKS (
    BOOK_ID INT PRIMARY KEY AUTO_INCREMENT,
    TITLE VARCHAR(130) NOT NULL,
    AUTHOR_ID INT NOT NULL,
    PRICE DOUBLE NOT NULL,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);

-- ==========================================
-- ✅ CUSTOMERS TABLE
-- ==========================================
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) UNIQUE NOT NULL,
    ADDRESS TEXT
);

-- ==========================================
-- ✅ ORDERS TABLE
-- ==========================================
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_ID INT NOT NULL,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- ==========================================
-- ✅ ORDER_DETAILS TABLE
-- ==========================================
CREATE TABLE ORDER_DETAILS (
    ORDERDETAILID INT PRIMARY KEY AUTO_INCREMENT,
    ORDER_ID INT NOT NULL,
    BOOK_ID INT NOT NULL,
    QUANTITY DOUBLE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
