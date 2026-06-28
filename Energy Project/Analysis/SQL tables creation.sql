CREATE TABLE CONTINENT (
    continent_id INT PRIMARY KEY,
    continent_name VARCHAR(100) NOT NULL
);

CREATE TABLE COUNTRY (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    continent_id INT,
    FOREIGN KEY (continent_id) REFERENCES CONTINENT(continent_id)
);

CREATE TABLE ENERGY_CATEGORY (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE ACTIVITY (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(50) NOT NULL
);

CREATE TABLE ENERGY_RECORD (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    category_id INT,
    activity_id INT,
    record_year INT,
    energy_value DECIMAL(15, 4),
    FOREIGN KEY (country_id) REFERENCES COUNTRY(country_id),
    FOREIGN KEY (category_id) REFERENCES ENERGY_CATEGORY(category_id),
    FOREIGN KEY (activity_id) REFERENCES ACTIVITY(activity_id)
);