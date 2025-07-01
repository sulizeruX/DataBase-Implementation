-- Table 1: Servers 
CREATE TABLE Servers ( 
    server_id INT PRIMARY KEY, 
    server_name VARCHAR(50), 
    region VARCHAR(50) 
); 
INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west'); 
-- Table 2: Alerts 
CREATE TABLE Alerts ( 
    alert_id INT PRIMARY KEY, 
    server_id INT, 
    alert_type VARCHAR(50), 
    severity VARCHAR(20) 
); 
INSERT INTO Alerts VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case) 
-- Table 3: AI Models 
CREATE TABLE AI_Models ( 
    model_id INT PRIMARY KEY, 
    model_name VARCHAR(50), 
    use_case VARCHAR(50) 
); 
INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 
-- Table 4: ModelDeployments 
CREATE TABLE ModelDeployments ( 
    deployment_id INT PRIMARY KEY, 
    server_id INT, 
    model_id INT, 
    deployed_on DATE 
); 
 
INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12');  

--Task 1
SELECT alert_type, server_name
from Servers
Inner JOIN Alerts ON Alerts.server_id = Servers.server_id;

--Task 2
SELECT server_name, alert_type
FROM Servers
Left JOIN Alerts on Alerts.server_id = Servers.server_id;

--Task 3
SELECT server_name, alert_type
FROM Servers
Right JOIN Alerts on Alerts.server_id = Servers.server_id;

--Task 4
SELECT server_name, alert_type
FROM Servers
Full Outer JOIN Alerts on Alerts.server_id = Servers.server_id;

--Task 5
SELECT *
FROM Servers
Cross JOIN AI_Models;

--Task 6
Select alert_type, server_name
FROM Alerts
Inner JOIN Servers ON Servers.server_id = Alerts.server_id
Where Alerts.severity = 'critical';

--Task 7
Select server_name
FROM Servers
Left JOIN ModelDeployments on ModelDeployments.server_id = Servers.server_id
Left JOIN AI_Models ON AI_Models.model_id = ModelDeployments.model_id
Where model_name IS NULL;

--Task 8
SELECT server_name
FROM Servers
Full JOIN ModelDeployments ON ModelDeployments.server_id = Servers.server_id
Where CHARINDEX('eu', region) != 0;