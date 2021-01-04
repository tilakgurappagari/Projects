-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 15, 2018 at 01:16 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ftp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cloud`
--

CREATE TABLE IF NOT EXISTS `cloud` (
  `ip` varchar(45) NOT NULL,
  `user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `date_` varchar(45) DEFAULT NULL,
  `location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloud`
--

INSERT INTO `cloud` (`ip`, `user`, `password`, `status`, `date_`, `location`) VALUES
('ftp.drivehq.com', 'Thanay', 'thanay', 'Active', '2018-02-11 18:01:05', 'Chennai'),
('ftp.drivehq.com', 'anirudhkalakuntla', 'anirudh', 'Active', '2018-02-12 11:56:13', 'Banglore');

-- --------------------------------------------------------

--
-- Table structure for table `fileloc`
--

CREATE TABLE IF NOT EXISTS `fileloc` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `Chennai` int(11) DEFAULT NULL,
  `Bangalore` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fileloc`
--

INSERT INTO `fileloc` (`fid`, `Chennai`, `Bangalore`) VALUES
(1, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `req`
--

CREATE TABLE IF NOT EXISTS `req` (
  `user` varchar(33) NOT NULL,
  `email` varchar(44) NOT NULL,
  `owner` varchar(33) NOT NULL,
  `fname` varchar(33) NOT NULL,
  `fkey` varchar(12) NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `req`
--

INSERT INTO `req` (`user`, `email`, `owner`, `fname`, `fkey`, `status`) VALUES
('thanay', 'thanayvakity@gmail.com', 'tilak', 'jj.txt', 'K8UwJ', 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `user` varchar(45) NOT NULL,
  `filename` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `cloud` varchar(45) DEFAULT NULL,
  `date_` datetime DEFAULT NULL,
  `report` varchar(45) DEFAULT NULL,
  `location` varchar(30) NOT NULL,
  `data` varchar(50000) NOT NULL,
  `key_` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`user`, `filename`, `status`, `cloud`, `date_`, `report`, `location`, `data`, `key_`) VALUES
('tilak', 'jj.txt', 'Success', 'ftp.drivehq.com', '2018-02-12 12:02:44', 'Upload', 'Chennai', 'LbZD1c4ZKBs=', 'K8UwJ'),
('tilak', 'jj.txt', 'Success', 'ftp.drivehq.com', '2018-02-12 12:02:53', 'Upload', 'Banglore', 'LbZD1c4ZKBs=', 'K8UwJ'),
('thanay', 'hai.txt', 'Success', 'ftp.drivehq.com', '2018-02-12 13:49:38', 'Upload', 'Chennai', 'XOCYjTGf63E=', 'CPBMT'),
('thanay', 'hai.txt', 'Success', 'ftp.drivehq.com', '2018-02-12 13:49:46', 'Upload', 'Banglore', 'XOCYjTGf63E=', 'CPBMT');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `emailid` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `password`, `gender`, `age`, `emailid`, `date`, `phone`, `status`) VALUES
('thanay', 'thanay', 'male', '21', 'thanayvakity@gmail.com', '2018-02-12', '8121315656', 'accepted'),
('tilak', 'tilak', 'male', '21', 'tilak.gurappagari@gmail.com', '2018-02-01', '7036291035', 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `usermsgfileloc`
--

CREATE TABLE IF NOT EXISTS `usermsgfileloc` (
  `Uname` varchar(255) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usermsgfileloc`
--

INSERT INTO `usermsgfileloc` (`Uname`, `Message`) VALUES
('tilak', '             hello                       \r\n                                    \r\n                                    \r\n                                    \r\n                                    \r\n                                    ');
