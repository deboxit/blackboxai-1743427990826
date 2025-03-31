-- Create citizens table
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

-- Create addresses table
CREATE TABLE IF NOT EXISTS addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT NOT NULL,
    house_no VARCHAR(50) NOT NULL,
    ward_no VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    vp_municipality VARCHAR(100),
    taluka VARCHAR(100),
    district VARCHAR(100) NOT NULL,
    assembly_constituency VARCHAR(100),
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(6) NOT NULL,
    telephone VARCHAR(15),
    email VARCHAR(100),
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (citizen_id) REFERENCES citizens(id) ON DELETE CASCADE
);

-- Create family_members table
CREATE TABLE IF NOT EXISTS family_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    age INT NOT NULL,
    occupation VARCHAR(100),
    relationship VARCHAR(50) NOT NULL,
    aadhar_no VARCHAR(12),
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (citizen_id) REFERENCES citizens(id) ON DELETE CASCADE
);

-- Create documents table
CREATE TABLE IF NOT EXISTS documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT NOT NULL,
    document_type VARCHAR(100) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    upload_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    remarks TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (citizen_id) REFERENCES citizens(id) ON DELETE CASCADE
);

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Administrator','Field_Assistant','BDO','Scheme_In_Charge','UDC','HC','Account_Person','Deputy_Director','Director','Master_User') NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    is_active TINYINT(1) DEFAULT 1,
    created_at DATETIME,
    updated_at DATETIME
);