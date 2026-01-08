create database Hackathon;
use Hackathon;

create table Creator(
	creator_id VARCHAR(5) primary key,
    creator_name VARCHAR(100) not null,
    creator_email VARCHAR(100) not null unique,
    creator_phone VARCHAR(15) not null unique,
    creator_platform VARCHAR(50) not null
);

create table Studio(
	studio_id VARCHAR(5) primary key,
    studio_name VARCHAR(100) not null,
    studio_location VARCHAR(100) not null,
    hourly_price DECIMAL(10,2) not null,
    studio_status VARCHAR(20) not null
);

create table LiveSession(
	session_id INT primary key AUTO_INCREMENT,
    creator_id VARCHAR(5) not null,
    studio_id VARCHAR(5) not null,
    session_date DATE not null,
    duration_hours INT not null,
    
    foreign key(creator_id) references Creator(creator_id),
    foreign key(studio_id) references Studio(studio_id)
);

create table Payment(
	payment_id INT primary key AUTO_INCREMENT,
    session_id INT not null,
    payment_method VARCHAR(50) not null,
    payment_amount DECIMAL(10,2) not null,
    payment_date DATE not null,
    
    foreign key(session_id) references LiveSession(session_id)
);

INSERT INTO Creator(creator_id, creator_name, creator_email, creator_phone, creator_platform) VALUES
('CR01','Nguyen Van A', 'a@live.com', '0901111111', 'Tiktok'),
('CR02','Tran Thi B', 'b@live.com', '0902222222', 'Youtube'),
('CR03','Le Minh C', 'c@live.com', '0903333333', 'Facebook'),
('CR04','Pham Thi D', 'd@live.com', '0904444444', 'Tiktok'),
('CR05','Vu Hoang E', 'e@live.com', '0905555555', 'Shopee live');

INSERT INTO Studio(studio_id, studio_name, studio_location, hourly_price, studio_status) VALUES
('ST01','Studio A', 'Ha Noi', 20.00, 'Available'),
('ST02','Studio B', 'HCM', 25.00, 'Available'),
('ST03','Studio C', 'Danang', 30.00, 'Booked'),
('ST04','Studio D', 'Ha Noi', 22.00, 'Available'),
('ST05','Studio E', 'Can Tho', 18.00, 'Maintenance');

INSERT INTO LiveSession(creator_id, studio_id, session_date, duration_hours) VALUES
('CR01', 'ST01', '2025-05-01', 3),
('CR02', 'ST02', '2025-05-02', 4),
('CR03', 'ST03', '2025-05-03', 2),
('CR04', 'ST04', '2025-05-04', 5),
('CR05', 'ST05', '2025-05-05', 1);

INSERT INTO Payment(session_id, payment_method, payment_amount, payment_date) VALUES
(1, 'Cash', 60.00, '2025-05-01'),
(2, 'Credit Card', 100.00, '2025-05-02'),
(3, 'Bank Transfer', 60.00, '2025-05-03'),
(4, 'Credit Card', 110.00, '2025-05-04'),
(5, 'Cash', 25.00, '2025-05-05');

update Creator set creator_platform = "YouTube" where creator_id = 'CR03';
update Studio set studio_status = 'Available' AND hourly_price *0.9 where studio_id = 'ST05';
delete from Payment where payment_method = 'Cash' AND payment_date < 2025-05-03;


select * from Studio 
where studio_status = 'Available' AND hourly_price > 20;

select creator_name, creator_phone from Creator
where creator_platform = 'Tiktok';

select studio_id, studio_name, hourly_price from Studio
order by hourly_price desc;

select * from Payment
where payment_method = 'Credit Card'
LIMIT 3;

select creator_id, creator_name from Creator
LIMIT 2 OFFSET 2;


















