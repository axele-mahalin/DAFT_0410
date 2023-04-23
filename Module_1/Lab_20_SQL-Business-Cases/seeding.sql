USE lab_mysql;

INSERT INTO cars (VIN, manufacturer, model, year, color)
values
('3K096I9858', 'Peugeot', 'Hybrid 308', 2020, 'Red'), 
('ZM8G7BEUQZ', 'Toyota', 'Toyota Aygo X', 2019, 'Blue'), 
('RKXVNNIHLV', 'Audi', 'TT', 2018, 'White'), 
('HKNDGS7CU3', 'Opel', 'Corsa', 2017, 'Silver'), 
('DAM41UDN3C', 'Renault', 'Kangoo', 2016, 'Green');

INSERT INTO customers (customer_id, name, phone_number, email, address, city, state, country, postal_code)
values 
('50A0607234', 'Vassily Kandinsky', '+34 526 17 63 82', 'vassily.kandinsky@gmail.com', '54 Rue Centre Pompidou', 'Paris', 'Île-de-France', 'FRA', '75001'),
('10A0607234', 'Pablo Picasso', '+34 636 17 63 82', 'pablo.picasso@gmail.com', "Paseo de la Chopera, 14", 'Madrid', 'Madrid', 'SPA', '28045'), 
('20A0607234', 'Abraham Lincoln', '+1 305 907 7086', 'abraham.lincoln@gmail.com', '120 SW 8th St', 'Miami', 'Florida', 'USA', '33130'), 
('30A0607234', 'Napoléon Bonaparte', '-', 'napoleon.bonaparte@gmail.com', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'FRA', '75008');

INSERT INTO invoices (invoice_number, date, VIN, customer_name, staff_ID)
values
('855399038', '2018-08-22', 'ZM8G7BEUQZ', 'Pablo Picasso', '00001'),
('732166526', '2018-12-31', 'HKNDGS7CU3', 'Abraham Lincoln', '00003'),
('273135104', '2019-01-22', 'ZM8G7BEUQZ', 'Pablo Picasso', '00001'),
('250139104', '2023-01-25', 'RKXVNNIHLV', 'Vassily Kandinsky', '00003');

INSERT INTO salespersons (staff_id, name, store)
values
('00001', 'Petey Cruiser', 'Madrid'),
('00002', 'Anna Sthesia', 'Barcelona'),
('00003', 'Paul Molive', 'Berlin'),
('00004', 'Gail Forcewind', 'Paris');
