use sirisha;

CREATE TABLE U_SERS (
  user_id INT PRIMARY KEY,
  email_domain VARCHAR(255),
  country VARCHAR(255),
  postal VARCHAR(255),
  mobile_app VARCHAR(50),
  sign_up_at TIMESTAMP
);


INSERT INTO U_SERS(user_id, email_domain, country, postal, mobile_app, sign_up_at)
VALUES
  (1, 'sirisha@example.com', 'USA', '12345', 'mobile-user', '2023-06-01 10:00:00'),
  (2, 'praveen@example.com', 'Canada', 'A1A 1A1','mobile-user', '2023-06-02 11:30:00'),
  (3, 'prem@example.com', 'USA', '67890', 'mobile-user', '2023-06-03 09:15:00'),
  (4, 'lavanya@example.com', 'UK', '54321','mobile- user', '2023-06-04 15:45:00');

  
select * from U_SERS;

INSERT INTO U_SERS(user_id, email_domain, country, postal, mobile_app, sign_up_at)
VALUES
  (5, 'siri@example.com', 'USA', '12345', 'mobile-user', '2023-06-01 10:00:00');
  
  CREATE TABLE progress (
  user_id INT,
  learn_cpp INT,
  learn_sql INT,
  learn_html INT,
  learn_javascript INT,
  learn_java INT,
  FOREIGN KEY (user_id) REFERENCES  U_SERS(user_id)
);
  INSERT INTO progress (user_id, learn_cpp, learn_sql, learn_html, learn_javascript, learn_java)
VALUES
  (1, 1, 0, 1, 1, 0),
  (2, 1, 1, 0, 0, 1),
  (3, 0, 1, 1, 0, 1),
  (4, 1, 1, 1, 1, 1),
  (5, 1, 1, 1, 1, 1);
  
SELECT email_domain, COUNT(*) AS count
FROM U_SERS
WHERE email_domain LIKE '%.edu'
GROUP BY email_domain
ORDER BY count DESC
LIMIT 25;

SELECT COUNT(*) AS count
FROM U_SERS
WHERE email_domain LIKE '%.edu' AND country = 'New York';

SELECT COUNT(*) AS count
FROM U_SERS
WHERE mobile_app = 'mobile-user';

SELECT DATE_FORMAT(sign_up_at, '%Y-%m-%d %H:00:00') AS hour,
   COUNT(*) AS sign_up_count
FROM U_SERS
GROUP BY hour
ORDER BY hour;

SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM U_SERS u
JOIN progress p ON u.user_id = p.user_id
WHERE u.email_domain LIKE '%.edu';

update U_SERS set  country = 'New York' where user_id = 1;

SELECT u.user_id, u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM U_SERS u
JOIN progress p ON u.user_id = p.user_id
WHERE u.country = 'New York';

update U_SERS set  country = 'Chicago' where user_id = 2;

SELECT u.user_id, u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM U_SERS u
JOIN progress p ON u.user_id = p.user_id
WHERE u.country = 'Chicago';


