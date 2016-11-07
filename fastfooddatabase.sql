-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2016 at 10:07 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastfooddatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `person_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `customer_trigger` BEFORE UPDATE ON `customer` FOR EACH ROW BEGIN
IF NEW.person_id != OLD.person_id THEN
SET NEW.person_id = OLD. person_id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `email_id` int(11) NOT NULL,
  `email_name` varchar(45) NOT NULL,
  `email_domain` varchar(15) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email_id`, `email_name`, `email_domain`, `person_id`) VALUES
(1, 'AnnArling', 'gmail', 1),
(2, 'BobBernst', 'gmail', 2),
(3, 'CarlCern', 'gmail', 3),
(4, 'DerekDittmer', 'gmail', 4),
(5, 'EricEnlich', 'gmail', 5),
(6, 'FredFurguson', 'gmail', 6),
(7, 'GalGasort', 'gmail', 7),
(8, 'PropaneAndPropaneAccessories', 'gmail', 8),
(9, 'IanInck', 'gmail', 9),
(10, 'JoeJackson', 'gmail', 10);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `date_hired` date NOT NULL,
  `wage` decimal(7,2) NOT NULL,
  `person_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `date_hired`, `wage`, `person_id`, `position_id`, `status_id`) VALUES
(1, '2015-11-17', '12.00', 6, 1, 1),
(2, '2016-10-26', '14.20', 7, 2, 2),
(3, '2016-10-04', '9.62', 8, 3, 1),
(4, '2016-11-18', '13.56', 9, 1, 2),
(5, '2016-05-18', '45.65', 10, 3, 1);

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `employee_trigger` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
IF NEW.position_id <> OLD.position_id THEN
SET NEW.wage = OLD.wage * 1.25;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_shift`
--

CREATE TABLE `employee_has_shift` (
  `employee_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_has_shift`
--

INSERT INTO `employee_has_shift` (`employee_id`, `shift_id`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_time` datetime NOT NULL,
  `employee_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_time`, `employee_id`, `customer_id`) VALUES
(1, '2016-10-11 05:36:11', 1, 2),
(2, '2016-10-21 08:05:29', 2, 4),
(3, '2016-10-22 16:21:25', 2, 3),
(4, '2016-10-26 13:24:25', 3, 1),
(5, '2016-10-31 12:23:23', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_has_product`
--

CREATE TABLE `order_has_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_has_product`
--

INSERT INTO `order_has_product` (`order_id`, `product_id`, `product_quantity`) VALUES
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

--
-- Triggers `order_has_product`
--
DELIMITER $$
CREATE TRIGGER `order_has_product_trigger` BEFORE UPDATE ON `order_has_product` FOR EACH ROW BEGIN
IF product_quantity <= 0 THEN SET
NEW.product_quantity = 10;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `person_first_name` varchar(35) NOT NULL,
  `person_last_name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `person_first_name`, `person_last_name`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `phone_id` int(11) NOT NULL,
  `phone_area_code` varchar(3) NOT NULL,
  `phone_telephone_exchange` varchar(3) NOT NULL,
  `phone_assigned_number` varchar(4) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`phone_id`, `phone_area_code`, `phone_telephone_exchange`, `phone_assigned_number`, `person_id`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`) VALUES
(1, 'Manager'),
(2, 'Cashier'),
(3, 'Line Cook');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_description` varchar(140) NOT NULL,
  `product_price` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_price`) VALUES
(1, '5 pc Chicken Nugget', 'Crispy, Fried Golden all white meat chicken nuggets.', '2.99'),
(2, '16 oz soda pop', 'Crisp refreshingly cold soda pop.', '1.50'),
(3, 'House salad', 'Iceburg lettuce with tomatoes, cucumbers, cheese, croutons, and your choice of dressing.', '3.67'),
(4, 'medium fries', 'fries cooked to golden brown', '1.50'),
(5, '1/4 lb Cheeseburger', '1/4 lb burger with american cheese, pickle, onion, and lettuce', '3.00');

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `product_trigger` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN
IF NEW.product_Name <> OLD.product_name THEN
SET NEW.product_name = OLD.product_name;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `shift_time` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `shift_time`) VALUES
(1, '1st shift'),
(2, '2nd shift'),
(3, '3rd shift');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_type`) VALUES
(1, 'Full Time'),
(2, 'Part Time');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  ADD KEY `fk_Customer_Person1_idx` (`person_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  ADD KEY `fk_Email_Person1_idx` (`person_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  ADD KEY `fk_Employee_Person1_idx` (`person_id`),
  ADD KEY `fk_Employee_Position1_idx` (`position_id`),
  ADD KEY `fk_Employee_status1_idx` (`status_id`);

--
-- Indexes for table `employee_has_shift`
--
ALTER TABLE `employee_has_shift`
  ADD PRIMARY KEY (`employee_id`,`shift_id`),
  ADD KEY `fk_Employee_has_shift_shift1_idx` (`shift_id`),
  ADD KEY `fk_Employee_has_shift_Employee1_idx` (`employee_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  ADD KEY `fk_Order_Employee1_idx` (`employee_id`),
  ADD KEY `fk_Order_Customer1_idx` (`customer_id`);

--
-- Indexes for table `order_has_product`
--
ALTER TABLE `order_has_product`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `fk_Order_has_Product_Product1_idx` (`product_id`),
  ADD KEY `fk_Order_has_Product_Order_idx` (`order_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `customer_id_UNIQUE` (`person_id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`phone_id`),
  ADD UNIQUE KEY `phone_id_UNIQUE` (`phone_id`),
  ADD KEY `fk_Phone_Person1_idx` (`person_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`),
  ADD UNIQUE KEY `position_id_UNIQUE` (`position_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`),
  ADD UNIQUE KEY `shift_id_UNIQUE` (`shift_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_id_UNIQUE` (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `phone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_Customer_Person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `fk_Email_Person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_Employee_Person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Employee_Position1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Employee_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_has_shift`
--
ALTER TABLE `employee_has_shift`
  ADD CONSTRAINT `fk_Employee_has_shift_Employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Employee_has_shift_shift1` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Order_Employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_has_product`
--
ALTER TABLE `order_has_product`
  ADD CONSTRAINT `fk_Order_has_Product_Order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Order_has_Product_Product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `fk_Phone_Person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
