-- Create Database
CREATE DATABASE BankDB;
USE BankDB;

-- Branches Table
CREATE TABLE Branches (
    branch_id INT identity(1,1) PRIMARY KEY,
    branch_name VARCHAR(100),
    address VARCHAR(255)
);

-- Customers Table
CREATE TABLE Customers (
    customer_id INT identity(1,1) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Accounts Table
CREATE TABLE Accounts (
    account_id INT identity(1,1) PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(50), -- Savings, Current, etc.
    balance DECIMAL(15, 2),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

-- Transactions Table
CREATE TABLE Transactions (
    transaction_id INT identity(1,1) PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50), -- Deposit, Withdrawal, Transfer
    amount DECIMAL(15, 2),
    transaction_date datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);