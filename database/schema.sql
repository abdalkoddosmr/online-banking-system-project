CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    user_type VARCHAR(50) NOT NULL
);

CREATE TABLE Accounts (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    balance DECIMAL(10, 2) DEFAULT 0.00,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    from_account_id INT,
    to_account_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (from_account_id) REFERENCES Accounts(account_id),
    FOREIGN KEY (to_account_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    merchant_id INT,
    buyer_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (merchant_id) REFERENCES Users(user_id),
    FOREIGN KEY (buyer_id) REFERENCES Users(user_id)
);