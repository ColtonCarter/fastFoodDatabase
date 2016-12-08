

INSERT INTO `customers` (`customer_id`, `person_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

select * from customers;

INSERT INTO `emails` (`email_id`, `email_name`) VALUES
(1, 'AnnArling@gmail.com'),
(2, 'BobBernst@gmail.com'),
(3, 'CarlCern@gmail.com'),
(4, 'DerekDittmer@gmail.com'),
(5, 'EricEnlich@gmail.com'),
(6, 'FredFurguson@gmail.com'),
(7, 'GalGasort@gmail.com'),
(8, 'PropaneAndPropaneAccessories@gmail.com'),
(9, 'IanInck@gmail.com'),
(10, 'JoeJackson@gmail.com');

select * from emails;


INSERT INTO `employees` (`employee_id`, `date_hired`, `wage`, `person_id`, `postion_id`, `status_id`) VALUES
(1, '2015-11-17', '12.00', 6, 1, 1),
(2, '2016-10-26', '14.20', 7, 2, 2),
(3, '2016-10-04', '9.62', 8, 3, 1),
(4, '2016-11-18', '13.56', 9, 1, 2),
(5, '2016-05-18', '45.65', 10, 3, 1);

select * from employees;


INSERT INTO `employee_has_shifts` (`employee_id`, `shift_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3),
(4, 1),
(5, 1),
(5, 2),
(5, 3);

select * from employee_has_shifts;


INSERT INTO `invoices` (`invoice_id`, `invoice_time`, `employee_id`, `customer_id`) VALUES
(1, '2016-10-11 05:36:11', 1, 2),
(2, '2016-10-21 08:05:29', 2, 4),
(3, '2016-10-22 16:21:25', 2, 3),
(4, '2016-10-26 13:24:25', 3, 1),
(5, '2016-10-31 12:23:23', 4, 3);

select * from invoices;

INSERT INTO `invoice_has_products` (`order_id`, `product_id`, `product_quantity`) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 5, 56),
(3, 2, 2),
(4, 1, 2),
(5, 1, 12),
(5, 2, 23),
(5, 3, 11),
(5, 4, 22),
(5, 5, 45);

select * from invoice_has_products;

INSERT INTO `people` (`person_id`, `person_first_name`, `person_last_name`) VALUES
(1, 'Ann', 'Arling'),
(2, 'Bob', 'Bernst'),
(3, 'Carl', 'Cern'),
(4, 'Derek', 'Dittmer'),
(5, 'Eric', 'Enlich'),
(6, 'Fred', 'Furguson'),
(7, 'Gal', 'Gasort'),
(8, 'Hank', 'Hill'),
(9, 'Ian', 'Inck'),
(10, 'Joe', 'Jackson');

select * from people;

INSERT INTO `phones` (`phone_id`, `phone_area_code`, `phone_telephone_exchange`, `phone_assigned_number`, `person_id`) VALUES
(1, '630', '427', '5648', 1),
(2, '630', '231', '5648', 2),
(3, '630', '987', '1234', 3),
(4, '630', '963', '5648', 4),
(5, '847', '854', '3151', 5),
(6, '847', '468', '4848', 6),
(7, '847', '985', '4547', 7),
(8, '847', '888', '6546', 8),
(9, '847', '888', '5545', 9),
(10, '847', '622', '1234', 10);

select * from phones;

INSERT INTO `positions` (`position_id`, `position_name`) VALUES
(1, 'Manager'),
(2, 'Cashier'),
(3, 'Line Cook');


select * from positions;

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `product_price`) VALUES
(1, '5 pc Chicken Nugget', 'Crispy, Fried Golden all white meat chicken nuggets.', '2.99'),
(2, '16 oz soda pop', 'Crisp refreshingly cold soda pop.', '1.50'),
(3, 'House salad', 'Iceburg lettuce with tomatoes, cucumbers, cheese, croutons, and your choice of dressing.', '3.67'),
(4, 'medium fries', 'fries cooked to golden brown', '1.50'),
(5, '1/4 lb Cheeseburger', '1/4 lb burger with american cheese, pickle, onion, and lettuce', '3.00');

select * from products;


INSERT INTO `shifts` (`shift_id`, `shift_time`) VALUES
(1, '1st shift'),
(2, '2nd shift'),
(3, '3rd shift');

select * from shifts;

INSERT INTO `statuses` (`status_id`, `status_type`) VALUES
(1, 'Full Time'),
(2, 'Part Time');

select * from statuses;