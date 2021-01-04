-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 10, 2013 at 10:44 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- create Database `ofs`;
   
   use ofs;
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE IF NOT EXISTS `buyer` (
  `buyerid` int(10) NOT NULL,
  `bname` varchar(20) NOT NULL,
  `addr` varchar(20) NOT NULL,
  `city` varchar(10) NOT NULL,
  `state` varchar(10) NOT NULL,
  `country` varchar(10) NOT NULL,
  `zip` int(10) NOT NULL,
  `phno` bigint(10) NOT NULL UNIQUE,
  
  `email` varchar(20) NOT NULL UNIQUE,
  `pswd` varchar(20) NOT NULL,
  PRIMARY KEY (`buyerid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyerid`, `bname`, `addr`, `city`, `state`, `country`, `zip`, `phno`, `email`, `pswd`) VALUES
(195, 'Anirudh', '4/10 Mallapur', 'Hyderabad', 'Telangana', 'India', 500003,7032402265, 'andy@gmail.com', 'andyjul25');


-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payid` int(10) NOT NULL,
  `paytype` varchar(20) NOT NULL,
  `cardno` int(20) NOT NULL,
  `scode` int(20) NOT NULL,
  `productid` int(10) NOT NULL,
  `buyerid` int(10) NOT NULL,
  `buyername` varchar(20) NOT NULL,
  `amt` int(20) NOT NULL,
  `addr` varchar(30) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`payid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payid`, `paytype`, `cardno`, `scode`, `productid`,`buyerid`, `buyername`, `amt`,`addr`, `date`) VALUES
(119, 'CreditCard', 123456, 123,104, 195, 'Anirudh',67.88,'4/10 Mallapur', '12-08-2017');


-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `prodid` int(10) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `ptype` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY (`prodid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodid`, `pname`, `ptype`, `price`, `qty`) VALUES
(101, 'IndianOil(p)', 'petrol', 67.88, 10),
(102, 'BharathPetroleum(p)', 'petrol', 68.04, 15),
(103, 'HP(p)', 'petrol', 68.24, 20),
(104, 'Reliance(p)', 'petrol', 66.91, 35),
(105, 'IndianOil(d)', 'diesel', 57.08, 50),
(106, 'BharathPetroleum(d)', 'diesel', 58.03, 70),
(107, 'HP(d)', 'diesel', 58.24, 5),
(109, 'Reliance(d)', 'diesel', 56.91, 20),
(111, 'HP(l)', 'lpg', 32.04, 20),
(112, 'CNG(l)', 'lpg', 32.04, 20),
(110,'Reliance(l)','lpg',32.91,67),
(113, 'Castrol', 'oil', 185, 20),
(114, 'TotalQuartz', 'oil', 170, 20),
(115, 'ShellHelix', 'oil', 190, 20),
(116, 'ServoGear', 'oil', 199, 20);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
