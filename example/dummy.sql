-- --------------------------------------------------------
-- Host:                         10.1.1.97
-- Server version:               5.5.41-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for web2
DROP DATABASE IF EXISTS `web2`;
CREATE DATABASE IF NOT EXISTS `web2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `web2`;


-- Dumping structure for table web2.ideas
DROP TABLE IF EXISTS `ideas`;
CREATE TABLE IF NOT EXISTS `ideas` (
  `ideaId` int(11) NOT NULL AUTO_INCREMENT,
  `ideaName` varchar(45) NOT NULL,
  `description` text,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`ideaId`),
  KEY `user_idx` (`createdBy`),
  CONSTRAINT `User` FOREIGN KEY (`createdBy`) REFERENCES `users` (`userId`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table web2.ideas: ~6 rows (approximately)
DELETE FROM `ideas`;
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
INSERT INTO `ideas` (`ideaId`, `ideaName`, `description`, `createdBy`, `createdAt`) VALUES
	(1, 'Create an idea exchange', 'It might be a cool idea to have a plattform to share and collaborate on ideas.', 1, '2015-04-30 09:40:42'),
	(2, 'Host a bicycle tour', 'Many students don\'t know much about Stuttgart, especially first semester. What do you think of hosting a bicycle once a year across Stuttgart?', 1, '2015-04-30 10:21:04'),
	(3, 'Rent/share bicycles', 'I experienced that a lot of people don\'t own a bicycle. In Stuttgart most ways can be traveled by bike. Do you think it\'s a good to provide bikes for students, especially between the university and student homes?', 1, '2015-04-30 10:25:53'),
	(4, 'Second hand bicycle market', 'A lot of people don\'t now what to do with their bikes after their study. A lot of bikes in student homes are owner-less. What do you think of a market where you can sell your old bike? All what\'s needed is room to store the bikes and some volunteers who manage the sale.', 1, '2015-04-30 10:31:14'),
	(5, 'Geniale Idee', 'cool idea', 1, '2015-04-30 13:11:11'),
	(6, 'Tolle Idee', 'Hier könnte ihre Werbung stehen.', 2, '2015-04-30 13:35:04');
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;


-- Dumping structure for table web2.post
DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `thread` int(11) NOT NULL,
  PRIMARY KEY (`postId`),
  KEY `postCreator` (`createdBy`),
  KEY `threadToPost` (`thread`),
  CONSTRAINT `postCreator` FOREIGN KEY (`createdBy`) REFERENCES `users` (`userId`) ON UPDATE NO ACTION,
  CONSTRAINT `threadToPost` FOREIGN KEY (`thread`) REFERENCES `threads` (`threadId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table web2.post: ~4 rows (approximately)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`postId`, `content`, `createdBy`, `createdAt`, `thread`) VALUES
	(1, 'Where do you want to store bicycles for sale?', 3, '2015-05-12 20:45:18', 1),
	(2, 'Don\'t know...', 1, '2015-05-12 20:45:43', 1),
	(3, 'Ich finde schon!', 2, '2015-05-13 11:35:25', 2),
	(4, 'Stimmt!', 2, '2015-05-13 12:03:36', 2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- Dumping structure for table web2.threads
DROP TABLE IF EXISTS `threads`;
CREATE TABLE IF NOT EXISTS `threads` (
  `threadId` int(11) NOT NULL AUTO_INCREMENT,
  `threadName` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `idea` int(11) NOT NULL,
  PRIMARY KEY (`threadId`),
  KEY `creator` (`createdBy`),
  KEY `idea` (`idea`),
  CONSTRAINT `creator` FOREIGN KEY (`createdBy`) REFERENCES `users` (`userId`) ON UPDATE NO ACTION,
  CONSTRAINT `idea` FOREIGN KEY (`idea`) REFERENCES `ideas` (`ideaId`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table web2.threads: ~2 rows (approximately)
DELETE FROM `threads`;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
INSERT INTO `threads` (`threadId`, `threadName`, `createdAt`, `createdBy`, `idea`) VALUES
	(1, 'Finding a room?', '2015-05-12 20:45:18', 3, 4),
	(2, 'Ist es nicht sogar eine geniale Idee?', '2015-05-13 11:35:25', 2, 6);
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;


-- Dumping structure for table web2.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `fullName` varchar(45) DEFAULT NULL,
  `faculty` varchar(50) DEFAULT NULL,
  `function` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table web2.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userId`, `userName`, `password`, `admin`, `fullName`, `faculty`, `function`) VALUES
	(1, 'user', 'pass', 0, 'user', 'IT', 'Student'),
	(2, 'user2', 'pass2', 0, 'user2', 'IT', 'Student'),
	(3, 'user3', 'pass3', 0, 'user3', 'IT', 'Lecturer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
