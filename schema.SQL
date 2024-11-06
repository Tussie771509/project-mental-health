CREATE TABLE Location (
location_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
region VARCHAR(100),
population INT
);

CREATE TABLE Demographics (
demographic_id INT PRIMARY KEY AUTO_INCREMENT,
location_id INT,
age_group VARCHAR(50),
income_level VARCHAR(50),
FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Mental_Health_Indicator (
indicator_id INT PRIMARY KEY AUTO_INCREMENT,
location_id INT,

name VARCHAR(100),
rate DECIMAL(5, 2),
FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Resource_Center (
resource_id INT PRIMARY KEY AUTO_INCREMENT,
location_id INT,
name VARCHAR(100),
type VARCHAR(100),
contact_info VARCHAR(100),
FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Service_Access (
access_id INT PRIMARY KEY AUTO_INCREMENT,
resource_id INT,
demographic_id INT,
service_date DATE,
service_type VARCHAR(100),
FOREIGN KEY (resource_id) REFERENCES Resource_Center(resource_id),
FOREIGN KEY (demographic_id) REFERENCES Demographics(demographic_id)
);

CREATE TABLE Policy (
policy_id INT PRIMARY KEY AUTO_INCREMENT,
location_id INT,
policy_name VARCHAR(100),
description TEXT,

implemented_date DATE,
FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
Data sample
-- Sample data for Location
INSERT INTO Location (name, region, population) VALUES
(&#39;City A&#39;, &#39;Region 1&#39;, 500000),
(&#39;City B&#39;, &#39;Region 2&#39;, 300000);

-- Sample data for Demographics
INSERT INTO Demographics (location_id, age_group, income_level) VALUES
(1, &#39;18-25&#39;, &#39;Low&#39;),
(1, &#39;26-40&#39;, &#39;Medium&#39;),
(2, &#39;18-25&#39;, &#39;Low&#39;);

-- Sample data for Mental_Health_Indicator
INSERT INTO Mental_Health_Indicator (location_id, name, rate) VALUES
(1, &#39;Depression Rate&#39;, 15.5),
(1, &#39;Suicide Rate&#39;, 2.3),
(2, &#39;Depression Rate&#39;, 18.0);

-- Sample data for Resource_Center
INSERT INTO Resource_Center (location_id, name, type, contact_info) VALUES
(1, &#39;Mental Health Clinic A&#39;, &#39;Clinic&#39;, &#39;contact@mhca.com&#39;),
(2, &#39;Support Group B&#39;, &#39;Support Group&#39;, &#39;contact@sgb.com&#39;);

-- Sample data for Service_Access
INSERT INTO Service_Access (resource_id, demographic_id, service_date, service_type) VALUES
(1, 1, &#39;2023-10-15&#39;, &#39;Counseling&#39;),

(2, 2, &#39;2023-10-16&#39;, &#39;Group Therapy&#39;);

-- Sample data for Policy
INSERT INTO Policy (location_id, policy_name, description, implemented_date) VALUES
(1, &#39;Mental Health Awareness Program&#39;, &#39;Increasing awareness and support for mental health.&#39;, &#39;2023-
01-01&#39;);