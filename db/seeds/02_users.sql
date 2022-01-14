-- users table seeds
INSERT INTO users (firstName, lastName, address, phone, email, password, is_employee)
VALUES
('labber', 'labber','Lighthouse Labs','123-456-7890','l@l.com', 'labber', true),
('Fatima', 'Siddique','Lighthouse Labs','548-490-0739','f@f.com', '123', true),
('Osman', 'Shakib', 'Lighthouse Labs','213-123-7890','o@o.com','123', true),
('Stellaris', 'Cano', 'Lighthouse Labs','647-704-8000','s@m.com','123', true),
('Test1', 'User1', '','111-222-3333','t@t.com','123', false),
('Test2', 'User2', '','222-444-3333','tt@tt.com','123', false);
