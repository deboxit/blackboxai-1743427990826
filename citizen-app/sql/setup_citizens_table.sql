CREATE TABLE IF NOT EXISTS citizens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    surname VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    father_name VARCHAR(100) NOT NULL,
    mother_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    nationality VARCHAR(50) DEFAULT 'Indian',
    marital_status ENUM('Married', 'Unmarried'),
    obc_sc_st_cert VARCHAR(50),
    obc_sc_st_date DATE,
    aadhar_no VARCHAR(12) UNIQUE NOT NULL,
    created_at DATETIME,
    updated_at DATETIME
);