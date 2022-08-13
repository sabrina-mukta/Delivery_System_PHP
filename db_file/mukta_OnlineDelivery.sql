-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2022 at 01:48 PM
-- Server version: 5.7.38-cll-lve
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enamdev_onlineDelivery`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`enamdev`@`localhost` PROCEDURE `deliveryperson` (IN `name` VARCHAR(200), IN `designation` VARCHAR(200), IN `mobile` INT(15), IN `email` VARCHAR(100), IN `presentaddress` VARCHAR(100), IN `nationalid` VARCHAR(100), IN `picture` VARCHAR(100))  BEGIN
INSERT INTO delivery_person(`name`,`designation`,`mobile`,`email`,`present_address`,`national_id`,`picture`) VALUES(name, designation, mobile, email, presentaddress, nationalid, picture);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `companysettings`
--

CREATE TABLE `companysettings` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(15) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `language_id` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companysettings`
--

INSERT INTO `companysettings` (`company_id`, `company_name`, `address`, `email`, `phone`, `logo`, `language_id`) VALUES
(1, 'Fast Delivery Project', '34 Purana Paltan, Noor jahan sharif plaza,Dhaka', 'fastdelivery@deliverfast.com', 1856487596, 'fastdeli.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(15) NOT NULL,
  `address` varchar(150) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `merchant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `email`, `phone`, `address`, `payment_method`, `merchant_id`) VALUES
(1, 'Rimon', 'rimon@gmail.com', 1650569636, 'mirpur', 'Bikas', 1),
(2, 'Rabby ', 'rabby@gmail.com', 1520236965, 'polton', 'Bikas', 1),
(3, 'Abujur', 'abujor@gmail.com', 1680562696, 'Kollanpur', 'Bikas', 1),
(4, 'Yousuf', 'Yousuf@gmail.com', 1620548596, 'Shahbag', 'Bikas', 1),
(5, 'Mukta', 'Mukta@gmail.com', 1650247896, 'mirpur', 'Cash On', 1),
(6, 'Banna', 'Banna@gmail.com', 1420568696, 'Badda', 'Cash On', 1),
(7, 'Enam', 'inamgazi21@gmail.com', 1620562696, 'Gazipur', 'Cash On', 1),
(8, 'Nayeem', 'Nayeem@gmail.com', 1620457852, 'mirpur', 'Cash On', 1),
(9, 'Mosharaf', 'Mosharaf@gmail.com', 1547896301, 'Badda', 'Cash On', 1),
(10, 'Shihab', 'Shihab@gmail.com', 1620457859, 'Komlapur', 'Cash On', 1),
(11, 'Rabby Ahmed', 'rabby@gmail.com', 1537171748, 'mir5pur-14, Dhaka', 'Cash On', 4),
(12, 'Yousuf Ahmed', 'yusuf@gmail.com', 1723321817, 'Purana Paltan, Dhaka', 'Bikas', 4),
(13, 'Enam Gazi', 'enam@gmail.com', 1535896412, 'Gazipur', 'Nagad', 4),
(14, 'Nayem islam', 'nayem@email.com', 2147483647, 'Uttar Badda', 'Bikas', 4),
(15, 'Sabrina Sultana Mukta', 'sabrinapwad34@gmail.com', 1537171747, 'senpara, Mirpur, Dhaka', 'Nagad', 4),
(16, 'Mariam Akter', 'mariam@gmail.com', 1625369874, 'mirpur, Dhaka', 'Cash On', 4),
(17, 'Abuzar ', 'abuzar@gmail.com', 1538596254, 'mirpur, Dhaka', 'Bikas', 4),
(18, 'Bidda ', 'bidda@gmail.com', 1723258741, 'Shewrapara, Dhaka', 'Bikas', 4),
(19, 'Banna ', 'banna@gmail.com', 1753698741, 'Kazipara, Dhaka', 'Cash On', 4),
(20, 'Shihab', 'shihab@gmail.com', 1762589741, 'Airport, Dhaka', 'Nagad', 4),
(23, 'mukta', 'mukta@gmail.com', 1537171747, 'dhaka', 'Cash On', 4),
(24, 'sabrina', 'sabrinapwad34@gmail.com', 1537171747, 'dhaka', 'nagad', 15369874),
(25, '', '', 0, '', 'Payment Method', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer_invoice`
--

CREATE TABLE `customer_invoice` (
  `iid` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `row_len` int(11) NOT NULL,
  `customer_ID` int(11) NOT NULL,
  `marchant_ID` int(11) NOT NULL,
  `delivery_ID` int(11) NOT NULL DEFAULT '0',
  `package_id` int(30) NOT NULL,
  `Create_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery_date` date NOT NULL,
  `delivery_location` varchar(200) NOT NULL,
  `picup_date` date NOT NULL,
  `pickup_location` varchar(150) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_phone` int(15) NOT NULL,
  `remarks` varchar(200) NOT NULL DEFAULT 'All Everything ok',
  `product_name` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,0) NOT NULL,
  `total` decimal(11,0) NOT NULL,
  `subtotal` decimal(11,0) NOT NULL,
  `total_delivery_charge` decimal(11,0) NOT NULL,
  `grand_total` decimal(11,0) NOT NULL,
  `paid_amount` decimal(11,0) NOT NULL,
  `dues_amount` decimal(11,0) NOT NULL DEFAULT '0',
  `delivery_status` varchar(100) NOT NULL DEFAULT '0',
  `collection_status` varchar(100) NOT NULL DEFAULT 'Panding',
  `marchant_payment_status` varchar(100) NOT NULL DEFAULT 'Panding'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_invoice`
--

INSERT INTO `customer_invoice` (`iid`, `invoice_id`, `row_len`, `customer_ID`, `marchant_ID`, `delivery_ID`, `package_id`, `Create_Date`, `delivery_date`, `delivery_location`, `picup_date`, `pickup_location`, `receiver_name`, `receiver_phone`, `remarks`, `product_name`, `qty`, `price`, `total`, `subtotal`, `total_delivery_charge`, `grand_total`, `paid_amount`, `dues_amount`, `delivery_status`, `collection_status`, `marchant_payment_status`) VALUES
(1, 1, 3, 4, 4, 0, 1, '2022-06-28 12:00:20', '2022-06-02', 'Mirpur', '2022-06-04', 'mirpur 10', 'Manik', 1865425896, '', 'USB Pandrive', 2, '850', '1700', '2850', '80', '2930', '2500', '430', '0', 'Panding', 'Panding'),
(2, 1, 3, 4, 4, 0, 1, '2022-06-28 12:00:20', '2022-06-02', 'Mirpur', '2022-06-04', 'mirpur 10', 'Manik', 1865425896, '', 'Gaming Mouse', 2, '350', '700', '2850', '80', '2930', '2500', '430', '0', 'Panding', 'Panding'),
(3, 1, 3, 4, 4, 0, 1, '2022-06-28 12:00:20', '2022-06-02', 'Mirpur', '2022-06-04', 'mirpur 10', 'Manik', 1865425896, '', 'Keyboard', 1, '450', '450', '2850', '80', '2930', '2500', '430', '0', 'Panding', 'Panding'),
(14, 2, 2, 1, 1, 2, 1, '2022-06-29 10:45:58', '2022-06-29', 'Mirpur', '2022-07-01', 'Mirpur', 'Rimon', 1865425599, '', 'Apple', 10, '180', '1800', '2400', '80', '2480', '2480', '0', 'On Going', 'Panding', 'Not Paid'),
(15, 2, 2, 1, 1, 2, 1, '2022-06-29 10:45:58', '2022-06-29', 'Mirpur', '2022-07-01', 'Mirpur', 'Rimon', 1865425599, '', 'Mengo', 5, '120', '600', '2400', '80', '2480', '2480', '0', 'On Going', 'Panding', 'Not Paid'),
(16, 3, 2, 2, 1, 0, 3, '2022-06-29 09:24:48', '2022-06-29', 'Mirpur', '2022-07-04', 'Mirpur', 'Rabby', 1620457836, '', 'Apple', 5, '150', '750', '1470', '60', '1530', '1500', '30', '0', 'Panding', 'Panding'),
(17, 3, 2, 2, 1, 0, 3, '2022-06-29 09:24:48', '2022-06-29', 'Mirpur', '2022-07-04', 'Mirpur', 'Rabby', 1620457836, '', 'Orange', 4, '180', '720', '1470', '60', '1530', '1500', '30', '0', 'Panding', 'Panding'),
(18, 4, 2, 3, 1, 0, 1, '2022-06-29 10:30:32', '2022-06-29', 'Kollanpur', '2022-07-05', 'Kollanpur', 'Abujor', 1720562696, '', 'ssd', 2, '1800', '3600', '11600', '80', '11680', '11000', '680', '0', 'Panding', 'Paid'),
(19, 4, 2, 3, 1, 0, 1, '2022-06-29 10:30:32', '2022-06-29', 'Kollanpur', '2022-07-05', 'Kollanpur', 'Abujor', 1720562696, '', 'ram', 5, '1600', '8000', '11600', '80', '11680', '11000', '680', '0', 'Panding', 'Paid'),
(20, 5, 2, 4, 1, 0, 3, '2022-06-29 09:31:17', '2022-06-29', 'Mirpur', '2022-07-06', 'Mirpur', 'Yousuf', 1620547836, '', 'Monitor', 5, '16000', '80000', '125000', '60', '125060', '125060', '0', '0', 'Panding', 'Panding'),
(21, 5, 2, 4, 1, 0, 3, '2022-06-29 09:31:17', '2022-06-29', 'Mirpur', '2022-07-06', 'Mirpur', 'Yousuf', 1620547836, '', 'pc', 3, '15000', '45000', '125000', '60', '125060', '125060', '0', '0', 'Panding', 'Panding'),
(22, 6, 2, 5, 1, 0, 1, '2022-06-29 10:30:38', '2022-06-29', 'Mirpur', '2022-07-04', 'Kollanpur', 'Mukta', 1620458563, '', 'polo shirts', 2, '1560', '3120', '11370', '80', '11450', '11000', '450', '0', 'Panding', 'Paid'),
(23, 6, 2, 5, 1, 0, 1, '2022-06-29 10:30:38', '2022-06-29', 'Mirpur', '2022-07-04', 'Kollanpur', 'Mukta', 1620458563, '', 'shirts', 5, '1650', '8250', '11370', '80', '11450', '11000', '450', '0', 'Panding', 'Paid'),
(24, 7, 2, 6, 1, 0, 2, '2022-06-29 09:36:28', '2022-06-29', 'Kollanpur', '2022-07-07', '', 'Banna', 1620568636, '', 'Casual shirt', 2, '2000', '4000', '8800', '70', '8870', '8800', '70', '0', 'Panding', 'Panding'),
(25, 7, 2, 6, 1, 0, 2, '2022-06-29 09:36:28', '2022-06-29', 'Kollanpur', '2022-07-07', '', 'Banna', 1620568636, '', 'Casual shows', 2, '2400', '4800', '8800', '70', '8870', '8800', '70', '0', 'Panding', 'Panding'),
(26, 7, 1, 11, 4, 0, 1, '2022-06-29 09:38:09', '2022-06-02', 'mirpur', '2022-07-08', 'badda', 'Rabby ', 1537171748, '', 'noodles', 2, '500', '1000', '1000', '80', '1080', '500', '580', '0', 'Panding', 'Panding'),
(27, 8, 1, 12, 4, 0, 2, '2022-06-29 09:39:47', '2022-06-08', 'mirpur', '2022-06-15', 'Airport', 'Yousuf Ahmed', 1723321817, '', 'Barger', 5, '300', '1500', '1500', '70', '1570', '1000', '570', '0', 'Panding', 'Panding'),
(28, 8, 2, 7, 1, 0, 3, '2022-06-29 09:39:48', '2022-06-29', 'Gazipur', '2022-07-03', 'Mirpur', 'Enam', 1620562696, '', 'polo shirts', 2, '1500', '3000', '6120', '60', '6180', '6000', '180', '0', 'Panding', 'Panding'),
(29, 8, 2, 7, 1, 0, 3, '2022-06-29 09:39:48', '2022-06-29', 'Gazipur', '2022-07-03', 'Mirpur', 'Enam', 1620562696, '', 'Casual shirt', 2, '1560', '3120', '6120', '60', '6180', '6000', '180', '0', 'Panding', 'Panding'),
(30, 9, 2, 9, 1, 0, 3, '2022-06-29 09:40:59', '2022-06-29', 'Mirpur', '2022-07-05', 'Kollanpur', 'Shihab', 1620545852, '', 'polo shirts', 3, '1500', '4500', '169500', '60', '169560', '160000', '9560', '0', 'Panding', 'Panding'),
(31, 9, 2, 9, 1, 0, 3, '2022-06-29 09:40:59', '2022-06-29', 'Mirpur', '2022-07-05', 'Kollanpur', 'Shihab', 1620545852, '', 'Monitor', 11, '15000', '165000', '169500', '60', '169560', '160000', '9560', '0', 'Panding', 'Panding'),
(32, 10, 2, 8, 1, 0, 2, '2022-06-29 09:42:12', '2022-06-29', 'Mirpur', '2022-07-04', 'Kollanpur', 'Rabby', 1520452586, '', 'polo shirts', 5, '1200', '6000', '13500', '70', '13570', '13000', '570', '0', 'Panding', 'Panding'),
(33, 10, 2, 8, 1, 0, 2, '2022-06-29 09:42:12', '2022-06-29', 'Mirpur', '2022-07-04', 'Kollanpur', 'Rabby', 1520452586, '', ' shirt', 5, '1500', '7500', '13500', '70', '13570', '13000', '570', '0', 'Panding', 'Panding'),
(34, 11, 2, 9, 1, 0, 3, '2022-06-29 09:43:45', '2022-06-29', 'Mirpur', '2022-07-06', 'Kollanpur', 'Banna', 1620457852, '', ' shirts', 5, '1200', '6000', '11200', '60', '11260', '11000', '260', '0', 'Panding', 'Panding'),
(35, 11, 2, 9, 1, 0, 3, '2022-06-29 09:43:45', '2022-06-29', 'Mirpur', '2022-07-06', 'Kollanpur', 'Banna', 1620457852, '', 'Casual shirt', 4, '1300', '5200', '11200', '60', '11260', '11000', '260', '0', 'Panding', 'Panding'),
(36, 9, 3, 13, 4, 0, 3, '2022-06-29 09:44:36', '2022-06-11', 'shewrapara', '2022-06-21', 'Kazipara', 'Enam', 1535896412, '', 'cake', 2, '1000', '2000', '4550', '60', '4610', '4000', '610', '0', 'Panding', 'Panding'),
(37, 9, 3, 13, 4, 0, 3, '2022-06-29 09:44:36', '2022-06-11', 'shewrapara', '2022-06-21', 'Kazipara', 'Enam', 1535896412, '', 'pasta', 3, '250', '750', '4550', '60', '4610', '4000', '610', '0', 'Panding', 'Panding'),
(38, 9, 3, 13, 4, 0, 3, '2022-06-29 09:44:36', '2022-06-11', 'shewrapara', '2022-06-21', 'Kazipara', 'Enam', 1535896412, '', 'soup', 3, '600', '1800', '4550', '60', '4610', '4000', '610', '0', 'Panding', 'Panding'),
(39, 12, 2, 14, 4, 0, 2, '2022-06-29 09:46:45', '2022-06-16', 'mirpur', '2022-07-01', 'gazi[ur', 'nayem', 1538936987, '', 'chicken fry', 5, '100', '500', '950', '70', '1020', '1020', '0', '0', 'Panding', 'Panding'),
(40, 12, 2, 14, 4, 0, 2, '2022-06-29 09:46:45', '2022-06-16', 'mirpur', '2022-07-01', 'gazi[ur', 'nayem', 1538936987, '', 'burger', 3, '150', '450', '950', '70', '1020', '1020', '0', '0', 'Panding', 'Panding'),
(41, 12, 2, 4, 1, 0, 3, '2022-06-29 09:49:24', '2022-06-29', 'Mirpur', '2022-07-07', 'polton', 'Yousuf', 1620457852, '', 'Casual shirt', 3, '1200', '3600', '5850', '60', '5910', '5000', '910', '0', 'Panding', 'Panding'),
(42, 12, 2, 4, 1, 0, 3, '2022-06-29 09:49:24', '2022-06-29', 'Mirpur', '2022-07-07', 'polton', 'Yousuf', 1620457852, '', 'Pent', 3, '750', '2250', '5850', '60', '5910', '5000', '910', '0', 'Panding', 'Panding'),
(43, 13, 2, 15, 4, 0, 3, '2022-06-29 10:24:08', '2022-06-14', 'mirpur', '2022-06-23', 'paltan', 'sabrina', 1537171747, '', 'kabab', 3, '250', '750', '1650', '60', '1710', '1500', '210', '0', 'Panding', 'Not Paid'),
(44, 13, 2, 15, 4, 0, 3, '2022-06-29 10:24:08', '2022-06-14', 'mirpur', '2022-06-23', 'paltan', 'sabrina', 1537171747, '', 'grill', 3, '300', '900', '1650', '60', '1710', '1500', '210', '0', 'Panding', 'Not Paid'),
(45, 13, 2, 8, 1, 0, 0, '2022-06-29 10:24:08', '2022-06-29', 'Mirpur', '2022-07-04', 'polton', 'Rimon', 1620578540, '', ' shirts', 12, '1400', '16800', '19200', '80', '19280', '19000', '280', '0', 'Panding', 'Not Paid'),
(46, 13, 2, 8, 1, 0, 0, '2022-06-29 10:24:08', '2022-06-29', 'Mirpur', '2022-07-04', 'polton', 'Rimon', 1620578540, '', 'polo shirts', 2, '1200', '2400', '19200', '80', '19280', '19000', '280', '0', 'Panding', 'Not Paid'),
(47, 14, 1, 16, 4, 0, 2, '2022-06-29 09:57:38', '2022-06-20', 'savar', '2022-06-27', 'magbazar', 'mariam akter', 1538596541, '', 'barger', 5, '200', '1000', '1000', '70', '1070', '1000', '70', '0', 'Panding', 'Panding'),
(48, 15, 2, 17, 4, 0, 2, '2022-06-29 10:02:04', '2022-06-02', 'shahbag', '2022-06-09', 'malibag', 'abuzar', 1785695412, '', 'barger', 3, '200', '600', '1500', '70', '1570', '1570', '0', '0', 'Panding', 'Panding'),
(49, 15, 2, 17, 4, 0, 2, '2022-06-29 10:02:04', '2022-06-02', 'shahbag', '2022-06-09', 'malibag', 'abuzar', 1785695412, '', 'noodles', 3, '300', '900', '1500', '70', '1570', '1570', '0', '0', 'Panding', 'Panding'),
(50, 16, 2, 2, 1, 0, 1, '2022-06-29 10:26:39', '2022-06-01', 'mirout', '2022-06-15', 'mirout', 'rabby', 125869454, '', 'Pandrive', 5, '350', '1750', '2950', '80', '3030', '2500', '530', '0', 'Panding', 'Panding'),
(51, 16, 2, 2, 1, 0, 1, '2022-06-29 10:26:39', '2022-06-01', 'mirout', '2022-06-15', 'mirout', 'rabby', 125869454, '', 'usb cable', 4, '300', '1200', '2950', '80', '3030', '2500', '530', '0', 'Panding', 'Panding');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_person`
--

CREATE TABLE `delivery_person` (
  `delivery_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `mobile` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `present_address` varchar(200) NOT NULL,
  `national_id` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_person`
--

INSERT INTO `delivery_person` (`delivery_id`, `name`, `designation`, `mobile`, `email`, `present_address`, `national_id`, `picture`, `creation_date`) VALUES
(2, 'Abu Zar', 'Bike Delivery Boy', 1756985421, 'abuzar@gmail.com', 'Kollan pur', '5665878653', 'Abu Zar.png', '2022-06-12 04:50:41'),
(4, ' Hasanul Banna ', 'Cycle Delivery Boy', 1521415290, 'banna@gmail.com', 'Dhaka', '45213256412', ' Hasanul.jpg', '2022-06-06 09:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `marchant_info`
--

CREATE TABLE `marchant_info` (
  `marchant_id` int(11) NOT NULL,
  `marchant_name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(15) NOT NULL,
  `marchant_bank_account` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0=Nothing, 1=LegalMerchant '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marchant_info`
--

INSERT INTO `marchant_info` (`marchant_id`, `marchant_name`, `user_name`, `password`, `email`, `phone`, `marchant_bank_account`, `status`) VALUES
(1, 'Point', 'pluspoint', 'e629c89f4e189fe75e07ebf2578a9eef', 'sdfsf@gamil.com', 1998457758, '345435-4354-454', 1),
(3, 'Md. Abdur Rahim', 'pingbd', 'e741d13ba79fdded0dd3f655815f57ec', 'ceo@pingbd.com', 1979666696, '106.111.1023', 1),
(4, 'Pizza', 'pizzaburg', 'bdb987e2f7ae8250db6dbb2809f01f1b', 'pizza@emil.com', 1856475961, '34534534-45345-345', 1);

-- --------------------------------------------------------

--
-- Table structure for table `marchant_order`
--

CREATE TABLE `marchant_order` (
  `order_id` int(11) NOT NULL,
  `marchant_id` varchar(1) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `phone` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `delivery_charge` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marchant_order`
--

INSERT INTO `marchant_order` (`order_id`, `marchant_id`, `customer_name`, `phone`, `email`, `product_name`, `qty`, `unit_price`, `total_price`, `delivery_charge`, `grand_total`) VALUES
(1, '1', 'vidda', 1521489789, 'vidda@gmail.com', 'T-shirt', 5, 1000, 5000, 100, 5100),
(2, '2', 'sakib', 1741005973, 'sakib@gmail.com', 'hard disk', 10, 4000, 40000, 100, 40100),
(3, '3', 'rasel', 1951201040, 'rasel@gmail.com', 'computer', 5, 50000, 250000, 500, 250500),
(4, '4', 'rakib', 135121450, 'rakib@gmail.com', 'notebook', 10, 25000, 250000, 500, 250500),
(5, '5', 'mamun', 1753050907, 'mamun', 'laptop', 5, 100000, 500000, 500, 500500);

-- --------------------------------------------------------

--
-- Table structure for table `marchant_payment`
--

CREATE TABLE `marchant_payment` (
  `payment_id` int(11) NOT NULL,
  `payment_amount` decimal(10,0) NOT NULL,
  `payment_date` datetime NOT NULL,
  `total_invoice` varchar(200) NOT NULL,
  `marchant_ID` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marchant_payment`
--

INSERT INTO `marchant_payment` (`payment_id`, `payment_amount`, `payment_date`, `total_invoice`, `marchant_ID`, `payment_status`) VALUES
(1, '1000', '2022-05-03 01:54:24', '3', 1, 'ok'),
(2, '1000', '2022-05-03 01:54:24', '3', 2, 'ok'),
(3, '500', '2022-07-02 01:54:24', '3', 3, 'ok'),
(4, '800', '2022-04-12 02:02:02', '2', 4, 'pending'),
(5, '300', '2022-02-15 02:05:17', '4', 5, 'ok'),
(6, '400', '2021-09-22 02:06:34', '5', 6, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `order_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_status` varchar(20) NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(200) NOT NULL,
  `package_duration` varchar(200) NOT NULL,
  `package_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_name`, `package_duration`, `package_price`) VALUES
(1, 'Mega Package', '1-30 Days', 80),
(2, 'Family Package', '1-20', 70),
(3, 'Mini Package', '1-10', 60);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` int(15) NOT NULL,
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '0=Nothing, 1=Admin, 2=Subadmin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`, `email`, `mobile`, `user_type`) VALUES
(1, 'tahmidtuhin', 'df4050ebe58266e1250f7dad57a241e6', 'mrjabed601@gmail.com', 34234324, 0),
(2, 'enamgazi', '7354d80a9f60ac91cc3b9eb31d7366a4', 'tahmid.tuhin.3@gmail.com', 467863453, 0),
(3, 'sabrinamukta', 'cb5130e6eb0ea1a813f69e2b71b6ee12', 'hc@ncfhn', 456486463, 0),
(4, 'yousufali', '774e7c9a71e64eebdef7ad2eb36dd041', 'asdfsdf@gmail.com', 23435453, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `type_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companysettings`
--
ALTER TABLE `companysettings`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `merchant_id` (`merchant_id`);

--
-- Indexes for table `customer_invoice`
--
ALTER TABLE `customer_invoice`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `marchant_ID` (`marchant_ID`),
  ADD KEY `delivery_ID` (`delivery_ID`);

--
-- Indexes for table `delivery_person`
--
ALTER TABLE `delivery_person`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `marchant_info`
--
ALTER TABLE `marchant_info`
  ADD PRIMARY KEY (`marchant_id`);

--
-- Indexes for table `marchant_order`
--
ALTER TABLE `marchant_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `marchant_id` (`marchant_id`);

--
-- Indexes for table `marchant_payment`
--
ALTER TABLE `marchant_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `marchant_ID` (`marchant_ID`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_id` (`order_id`,`invoice_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `user_type` (`user_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companysettings`
--
ALTER TABLE `companysettings`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customer_invoice`
--
ALTER TABLE `customer_invoice`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `delivery_person`
--
ALTER TABLE `delivery_person`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marchant_info`
--
ALTER TABLE `marchant_info`
  MODIFY `marchant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `marchant_order`
--
ALTER TABLE `marchant_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marchant_payment`
--
ALTER TABLE `marchant_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
