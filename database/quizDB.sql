-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for quiz_db
CREATE DATABASE IF NOT EXISTS `quiz_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `quiz_db`;

-- Dumping structure for table quiz_db.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table quiz_db.admin: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES
	(1, 'admin@gmail.com', '12345');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table quiz_db.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `quiz_id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL,
  `option_id` int(30) NOT NULL,
  `is_right` tinyint(1) NOT NULL COMMENT ' 1 = right, 0 = wrong',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.answers: ~2 rows (approximately)
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`id`, `user_id`, `quiz_id`, `question_id`, `option_id`, `is_right`, `date_updated`) VALUES
	(5, 12, 2, 4, 32, 1, '2020-09-07 16:59:14'),
	(6, 12, 2, 5, 38, 1, '2020-09-07 16:59:14');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table quiz_db.faculty
CREATE TABLE IF NOT EXISTS `faculty` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.faculty: ~0 rows (approximately)
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` (`id`, `user_id`, `subject`, `date_updated`) VALUES
	(2, 6, 'Software Design', '2021-06-19 18:28:01');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;

-- Dumping structure for table quiz_db.history
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `score` int(5) NOT NULL,
  `total_score` int(5) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.history: ~0 rows (approximately)
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`id`, `quiz_id`, `user_id`, `score`, `total_score`, `date_updated`) VALUES
	(3, 2, 12, 4, 4, '2020-09-07 16:59:14');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;

-- Dumping structure for table quiz_db.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `qid` int(30) NOT NULL,
  `order_by` int(11) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.questions: ~8 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `question`, `qid`, `order_by`, `date_updated`) VALUES
	(4, 'What is the first step in the software development lifecycle?', 2, 0, '2021-06-19 18:31:39'),
	(5, 'What does RAD stand for?', 2, 0, '2021-06-19 18:31:57'),
	(6, 'Which of the following does not relate to Evolutionary Process Model?', 2, 0, '2021-06-20 02:33:47'),
	(7, 'Which of the following is not a UML diagram?', 2, 0, '2021-06-20 02:51:16'),
	(8, 'Sequence diagram is ... oriented.', 2, 0, '2021-06-20 02:53:37'),
	(9, 'If x âˆˆ N and x is prime, then x is ________ set.', 3, 0, '2021-06-20 03:17:31'),
	(10, 'A linear equation in three variables represents a?', 3, 0, '2021-06-20 03:21:34'),
	(11, 'Singular matrix are?', 3, 0, '2021-06-20 03:22:22'),
	(12, 'By factorizing the expression 2bx + 4by - 3ax -6ay, the answer must be', 3, 0, '2021-06-20 03:23:36'),
	(13, 'If -4x + 5y is subtracted from 3x + 2y then the answer will be', 3, 0, '2021-06-20 03:24:14');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table quiz_db.question_opt
CREATE TABLE IF NOT EXISTS `question_opt` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `option_txt` text NOT NULL,
  `question_id` int(30) NOT NULL,
  `is_right` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1= right answer',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.question_opt: ~40 rows (approximately)
/*!40000 ALTER TABLE `question_opt` DISABLE KEYS */;
INSERT INTO `question_opt` (`id`, `option_txt`, `question_id`, `is_right`, `date_updated`) VALUES
	(53, 'Rapid Application Document', 5, 0, '2021-06-20 02:49:18'),
	(54, 'Rapid Application Development', 5, 1, '2021-06-20 02:49:18'),
	(55, 'Relative Application Development', 5, 0, '2021-06-20 02:49:18'),
	(56, 'None of the above', 5, 0, '2021-06-20 02:49:18'),
	(65, 'Preliminary Investigation and Analysis', 4, 1, '2021-06-20 02:52:20'),
	(66, 'System Testing', 4, 0, '2021-06-20 02:52:20'),
	(67, 'Coding', 4, 0, '2021-06-20 02:52:20'),
	(68, 'System Design', 4, 0, '2021-06-20 02:52:20'),
	(77, 'Incremental Model', 6, 0, '2021-06-20 02:52:37'),
	(78, 'Concurrent Development Model', 6, 0, '2021-06-20 02:52:37'),
	(79, 'WINWIN Spiral Model', 6, 0, '2021-06-20 02:52:37'),
	(80, 'All of the above', 6, 1, '2021-06-20 02:52:37'),
	(81, 'Class diagram', 7, 0, '2021-06-20 02:52:44'),
	(82, 'Object Diagram', 7, 0, '2021-06-20 02:52:44'),
	(83, 'Interface diagram', 7, 1, '2021-06-20 02:52:44'),
	(84, 'Use case model', 7, 0, '2021-06-20 02:52:44'),
	(89, 'Time', 8, 1, '2021-06-20 02:53:42'),
	(90, 'Class', 8, 0, '2021-06-20 02:53:42'),
	(91, 'Activity', 8, 0, '2021-06-20 02:53:42'),
	(92, 'None of these', 8, 0, '2021-06-20 02:53:42'),
	(101, 'Finite set', 9, 0, '2021-06-20 03:17:39'),
	(102, 'Not a set', 9, 0, '2021-06-20 03:17:39'),
	(103, 'Infinite set', 9, 1, '2021-06-20 03:17:39'),
	(104, 'Empty set', 9, 0, '2021-06-20 03:17:39'),
	(109, 'flat objects', 10, 0, '2021-06-20 03:21:41'),
	(110, 'line', 10, 0, '2021-06-20 03:21:41'),
	(111, 'planes', 10, 1, '2021-06-20 03:21:41'),
	(112, 'Both A and C', 10, 0, '2021-06-20 03:21:41'),
	(117, 'non-invertible', 11, 1, '2021-06-20 03:22:26'),
	(118, 'invertible', 11, 0, '2021-06-20 03:22:26'),
	(119, 'Both non-invertible and invertible', 11, 0, '2021-06-20 03:22:26'),
	(120, 'None Of the above', 11, 0, '2021-06-20 03:22:26'),
	(125, '(2b + 3a)(x - 2y)', 12, 0, '2021-06-20 03:23:42'),
	(126, '(2b - 3a)(x + 2y)', 12, 1, '2021-06-20 03:23:42'),
	(127, '(2a- 3b)(3x - 2y)', 12, 0, '2021-06-20 03:23:42'),
	(128, '(2a + 3b)(2x - 4y)', 12, 0, '2021-06-20 03:23:42'),
	(141, '3x + 6y', 13, 0, '2021-06-20 03:25:01'),
	(142, '2x + 5y', 13, 0, '2021-06-20 03:25:01'),
	(143, 'x - 3y', 13, 1, '2021-06-20 03:25:01'),
	(144, 'x + 3y', 13, 0, '2021-06-20 03:25:01');
/*!40000 ALTER TABLE `question_opt` ENABLE KEYS */;

-- Dumping structure for table quiz_db.quiz_list
CREATE TABLE IF NOT EXISTS `quiz_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `qpoints` int(11) NOT NULL DEFAULT '1',
  `user_id` int(20) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.quiz_list: ~0 rows (approximately)
/*!40000 ALTER TABLE `quiz_list` DISABLE KEYS */;
INSERT INTO `quiz_list` (`id`, `title`, `qpoints`, `user_id`, `date_updated`) VALUES
	(2, 'Pre-Test (Software Design)', 2, 6, '2021-06-19 18:29:44'),
	(3, 'math', 1, 6, '2021-06-20 02:47:29');
/*!40000 ALTER TABLE `quiz_list` ENABLE KEYS */;

-- Dumping structure for table quiz_db.quiz_student_list
CREATE TABLE IF NOT EXISTS `quiz_student_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.quiz_student_list: ~2 rows (approximately)
/*!40000 ALTER TABLE `quiz_student_list` DISABLE KEYS */;
INSERT INTO `quiz_student_list` (`id`, `quiz_id`, `user_id`, `date_updated`) VALUES
	(5, 2, 12, '2020-09-07 15:05:58'),
	(6, 2, 13, '2020-09-07 15:05:58'),
	(7, 3, 12, '2021-06-20 02:47:53');
/*!40000 ALTER TABLE `quiz_student_list` ENABLE KEYS */;

-- Dumping structure for table quiz_db.students
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(30) NOT NULL,
  `level_section` varchar(100) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.students: ~2 rows (approximately)
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`id`, `user_id`, `level_section`, `date_updated`) VALUES
	(3, 12, 'FSKTM', '2021-06-20 03:05:45');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

-- Dumping structure for table quiz_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = admin, 2= faculty , 3 = student',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table quiz_db.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
	(1, 'Administrator', 1, 'admin', '12345', 1, '2021-06-19 18:23:21'),
	(6, 'Lecturer', 2, 'lecturer', '12345', 1, '2021-06-19 18:27:00'),
	(12, 'Student', 3, 'student', '12345', 1, '2021-06-19 18:27:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
