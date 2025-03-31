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