-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.53-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mona
--

CREATE DATABASE IF NOT EXISTS mona;
USE mona;

--
-- Definition of table `group_manager`
--

DROP TABLE IF EXISTS `group_manager`;
CREATE TABLE `group_manager` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `group_sig` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_manager`
--

/*!40000 ALTER TABLE `group_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_manager` ENABLE KEYS */;


--
-- Definition of table `log_details`
--

DROP TABLE IF EXISTS `log_details`;
CREATE TABLE `log_details` (
  `user_id` varchar(45) NOT NULL DEFAULT '',
  `file_name` varchar(45) NOT NULL DEFAULT '',
  `group_` varchar(45) NOT NULL DEFAULT '',
  `status_` varchar(45) NOT NULL DEFAULT '',
  `date_time` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_details`
--

/*!40000 ALTER TABLE `log_details` DISABLE KEYS */;
INSERT INTO `log_details` (`user_id`,`file_name`,`group_`,`status_`,`date_time`) VALUES 
 ('eswar','eswa11r.txt','Group1','Upload','2015-09-13 13:43:42'),
 ('eswar','eswa12r.txt','Group1','Upload','2015-09-13 13:44:19'),
 ('eswar','eswa12r.txt','Group1','Update','2015-09-13 13:45:38'),
 ('eswar','eswa11r.txt','Group1','Update','2015-09-13 13:46:04'),
 ('eswar','eswa11r.txt','Group1','Download','2015-09-13 13:46:51'),
 ('eswar','eswa12r.txt','Group1','Download','2015-09-13 13:46:54');
/*!40000 ALTER TABLE `log_details` ENABLE KEYS */;


--
-- Definition of table `make_group`
--

DROP TABLE IF EXISTS `make_group`;
CREATE TABLE `make_group` (
  `group_name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `make_group`
--

/*!40000 ALTER TABLE `make_group` DISABLE KEYS */;
INSERT INTO `make_group` (`group_name`) VALUES 
 ('Group1'),
 ('Group2'),
 ('Group3');
/*!40000 ALTER TABLE `make_group` ENABLE KEYS */;


--
-- Definition of table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `username` varchar(46) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `group_` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(45) NOT NULL DEFAULT '',
  `mobile` varchar(45) NOT NULL DEFAULT '',
  `place` varchar(45) NOT NULL DEFAULT '',
  `status` varchar(45) NOT NULL DEFAULT '',
  `gr_sig` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`username`,`password`,`group_`,`email`,`mobile`,`place`,`status`,`gr_sig`) VALUES 
 ('a1','a1','Group2','maran.rit@gmail.com','34535','gdfg','YES','wA2KPuI89ks='),
 ('a2','a2','Group2','maran.rit@gmail.com','6757','hfgh','YES','wA2KPuI89ks='),
 ('e1','e1','Group3','maran.rit@gmail.com','6546','gfdg','NO','ymekgZc9Rdc='),
 ('e2','e2','Group3','maran.rit@gmail.com','676576576','hghfh','NO','ymekgZc9Rdc='),
 ('eswar','eswar','Group1','eswarankaliappan67@gmail.com','9844641410','Bangalore','YES','z6NAMZ5/PeE='),
 ('m1','m1','Group1','maran.rit@gmail.com','456','hgfh','YES','z6NAMZ5/PeE='),
 ('m2','m2','Group1','maran.rit@gmail.com','6546','gfh','NO','z6NAMZ5/PeE='),
 ('sanjeev','sanjeev','Group2','mindsoftbangalore@gmail.com','9844641410','Bangalore','YES','wA2KPuI89ks=');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;


--
-- Definition of table `upload`
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(45) NOT NULL DEFAULT '',
  `file_data` text NOT NULL,
  `date` varchar(45) NOT NULL DEFAULT '',
  `key_` varchar(45) NOT NULL DEFAULT '',
  `group_` varchar(45) NOT NULL DEFAULT '',
  `user_id` varchar(45) DEFAULT NULL,
  `s_key` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload`
--

/*!40000 ALTER TABLE `upload` DISABLE KEYS */;
INSERT INTO `upload` (`file_id`,`file_name`,`file_data`,`date`,`key_`,`group_`,`user_id`,`s_key`) VALUES 
 (1,'eswa11r.txt','WQ/raCNeTp74xwrGqmYX/tLGL9KOYdDA','2015/Sep/13 13:31:04','75wRzkWbbmLMz1FkyEQDsQ==','Group1','eswar',''),
 (2,'eswa12r.txt','Wp0ekWxQUZa9LbINUS5n7cl2X9ReJCSq2mxyXtWMEZOFQpw/GJ7DpVvA1nA1VHfpKm6CwRewvJWD\r\nvRfod/HwtXENEVHZ7t0T/poRT+hiHk/p3V3WUlSTIky8UA7A5LFjppcsMMhv+uF88mUon3Xmqd9V\r\nuqfNab85enXRkA9HGOh11zuhfcHerjMVwdtkNYdDhxa9EMGUBesAG/P04tqiHAhOO9FhXAxE7NEZ\r\nHAXnqecdQbKART02/UNwnH/gd9+YOgh3Zz8th6CJLaYx7HDmBG/ZoLolw3ZH+9y0m6g0o96ruLk+\r\nH9wVxTnjaRRojx5GGpMzCvIJlU324o59ukV9Yw==\r\n','2015/Sep/13 13:31:04','vY6FBrJvUCnMz1FkyEQDsQ==','Group1','eswar','c14tkdwf88epvnbn');
/*!40000 ALTER TABLE `upload` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
