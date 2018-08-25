-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.23 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных aeroport
CREATE DATABASE IF NOT EXISTS `aeroport` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aeroport`;

-- Дамп структуры для таблица aeroport.airports
CREATE TABLE IF NOT EXISTS `airports` (
  `code_airport` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_airport` char(255) DEFAULT NULL,
  `airport_placement` char(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code_airport`),
  KEY `name_of_airport` (`name_of_airport`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.airports: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` (`code_airport`, `name_of_airport`, `airport_placement`) VALUES
	(1, 'Algera Phitilia', 'Italy'),
	(2, 'Amsterdam Spiphol', 'Netherlands'),
	(3, 'Bryansk', 'Russia'),
	(4, 'Vilnews', 'Lithuania'),
	(5, 'Bordo Merenyak', 'France'),
	(6, 'Luxembourg Phindel', 'Luxembourg'),
	(7, 'Aberdin Dais', 'England'),
	(8, 'Berlin Bradenbourg', 'Germany'),
	(9, 'Hong Kong', 'China'),
	(10, 'Dnipropetrovsk', 'Ukraine'),
	(11, 'Wece', 'Germany');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.categories_of_flights
CREATE TABLE IF NOT EXISTS `categories_of_flights` (
  `code_category` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_category` char(50) DEFAULT NULL,
  PRIMARY KEY (`code_category`),
  KEY `name_of_category` (`name_of_category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.categories_of_flights: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `categories_of_flights` DISABLE KEYS */;
INSERT INTO `categories_of_flights` (`code_category`, `name_of_category`) VALUES
	(3, 'charter'),
	(4, 'goods'),
	(1, 'inland'),
	(2, 'international'),
	(5, 'special');
/*!40000 ALTER TABLE `categories_of_flights` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.flighting_brigade
CREATE TABLE IF NOT EXISTS `flighting_brigade` (
  `code_flighting_brigade` int(11) NOT NULL AUTO_INCREMENT,
  `№_of_flighting_brigade` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_flighting_brigade`),
  KEY `№_of_flighting_brigade` (`№_of_flighting_brigade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.flighting_brigade: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `flighting_brigade` DISABLE KEYS */;
INSERT INTO `flighting_brigade` (`code_flighting_brigade`, `№_of_flighting_brigade`) VALUES
	(4, 232),
	(5, 253),
	(7, 335),
	(9, 357),
	(1, 567),
	(6, 654),
	(2, 753),
	(8, 754),
	(10, 789),
	(3, 994);
/*!40000 ALTER TABLE `flighting_brigade` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.flights
CREATE TABLE IF NOT EXISTS `flights` (
  `code_flight` int(255) NOT NULL AUTO_INCREMENT,
  `bort_numb_of_plane` int(255) DEFAULT NULL,
  `category` char(50) DEFAULT NULL,
  `code_of_ticket` int(11) DEFAULT NULL,
  `take_off_time` time DEFAULT '00:00:00',
  `boarding_time` time DEFAULT '00:00:00',
  `time_of_flighting` time DEFAULT '00:00:00',
  `date_of_flighting` date DEFAULT NULL,
  `delay` set('Yes','No') DEFAULT NULL,
  `reason_of_delay` char(50) DEFAULT NULL,
  `time_of_delay` time NOT NULL DEFAULT '00:00:00',
  `send_airport` char(50) DEFAULT NULL,
  `coming_airport` char(50) DEFAULT NULL,
  `status__` set('Fulfilled','In process','Canceled') DEFAULT NULL,
  PRIMARY KEY (`code_flight`),
  KEY `FK_flights_airport` (`send_airport`),
  KEY `FK_flights_airport_2` (`coming_airport`),
  KEY `FK_flights_planes` (`bort_numb_of_plane`),
  KEY `FK_flights_categories_of_flights` (`category`),
  KEY `FK_flights_reason_of_delay` (`reason_of_delay`),
  KEY `code_of_ticket` (`code_of_ticket`),
  CONSTRAINT `FK_flights_reason_of_delay` FOREIGN KEY (`reason_of_delay`) REFERENCES `reason_of_delay` (`name_of_delay`),
  CONSTRAINT `FK_flights_airport` FOREIGN KEY (`send_airport`) REFERENCES `airports` (`name_of_airport`),
  CONSTRAINT `FK_flights_airport_2` FOREIGN KEY (`coming_airport`) REFERENCES `airports` (`name_of_airport`),
  CONSTRAINT `FK_flights_categories_of_flights` FOREIGN KEY (`category`) REFERENCES `categories_of_flights` (`name_of_category`),
  CONSTRAINT `FK_flights_log_of_tickets` FOREIGN KEY (`code_of_ticket`) REFERENCES `log_of_tickets` (`code_log_ticket`),
  CONSTRAINT `FK_flights_planes` FOREIGN KEY (`bort_numb_of_plane`) REFERENCES `planes` (`code_plane`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.flights: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` (`code_flight`, `bort_numb_of_plane`, `category`, `code_of_ticket`, `take_off_time`, `boarding_time`, `time_of_flighting`, `date_of_flighting`, `delay`, `reason_of_delay`, `time_of_delay`, `send_airport`, `coming_airport`, `status__`) VALUES
	(1, 1, 'international', 1, '10:24:32', '13:44:52', '03:20:20', '2016-09-10', 'No', 'no reason', '00:00:00', 'Hong Kong', 'Aberdin Dais', 'Fulfilled'),
	(2, 2, 'inland', 2, '08:15:10', '09:30:10', '01:15:00', '2017-01-28', 'Yes', 'weather', '00:34:45', 'Aberdin Dais', 'Berlin Bradenbourg', 'In process'),
	(3, 3, 'international', 3, '09:20:14', '13:52:26', '04:32:12', '2017-01-15', 'No', 'no reason', '00:00:00', 'Bordo Merenyak', 'Algera Phitilia', 'Fulfilled'),
	(4, 4, 'special', 4, '12:34:40', '14:24:00', '02:50:40', '2016-12-25', 'Yes', 'technical malfunction', '00:24:25', 'Berlin Bradenbourg', 'Luxembourg Phindel', 'Fulfilled'),
	(5, 5, 'charter', 5, '14:56:59', '19:56:59', '05:00:00', '2017-02-10', 'Yes', 'weather', '00:43:16', 'Algera Phitilia', 'Bryansk', 'Fulfilled'),
	(6, 6, 'goods', 6, '06:22:12', '16:56:33', '10:34:21', '2017-02-05', 'No', 'no reason', '00:00:00', 'Vilnews', 'Hong Kong', 'In process'),
	(7, 7, 'international', 7, '15:10:02', '19:50:58', '04:40:56', '2017-03-28', 'No', 'no reason', '00:00:00', 'Luxembourg Phindel', 'Vilnews', 'Fulfilled'),
	(8, 8, 'international', 8, '17:15:32', '01:50:59', '08:35:27', '2017-02-15', 'Yes', 'technical malfunction', '00:17:45', 'Amsterdam Spiphol', 'Dnipropetrovsk', 'Canceled'),
	(9, 9, 'international', 9, '19:40:20', '22:57:40', '03:17:20', '2017-01-19', 'No', 'no reason', '00:00:00', 'Bryansk', 'Berlin Bradenbourg', 'Fulfilled'),
	(10, 10, 'special', 10, '21:34:47', '02:34:47', '05:00:00', '2017-03-28', 'No', 'no reason', '00:00:00', 'Dnipropetrovsk', 'Aberdin Dais', 'Canceled');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `code_gender` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_gender` char(50) DEFAULT NULL,
  PRIMARY KEY (`code_gender`),
  KEY `name_of_gender` (`name_of_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='pol';

-- Дамп данных таблицы aeroport.gender: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`code_gender`, `name_of_gender`) VALUES
	(2, 'Female'),
	(1, 'Male');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.log_of_tickets
CREATE TABLE IF NOT EXISTS `log_of_tickets` (
  `code_log_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `code_of_flight` int(11) DEFAULT NULL,
  `code_of_plane` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `owner's_code` int(11) DEFAULT NULL,
  `number_of_saled` int(11) DEFAULT NULL,
  `airport_of_send` char(50) DEFAULT NULL,
  `coming__airport` char(50) DEFAULT NULL,
  `№_of_placement` int(11) DEFAULT NULL,
  `date_of_buying` date DEFAULT NULL,
  `status_` set('Purchased','Booked','Returned') DEFAULT NULL,
  PRIMARY KEY (`code_log_ticket`),
  KEY `FK_log of tickets_flights` (`code_of_flight`),
  KEY `FK_log of tickets_passegers` (`owner's_code`),
  KEY `FK_log_of_tickets_airport` (`airport_of_send`),
  KEY `FK_log_of_tickets_planes` (`code_of_plane`),
  KEY `FK_log_of_tickets_price_of_tickets` (`cost`),
  KEY `FK_log_of_tickets_airports` (`coming__airport`),
  CONSTRAINT `FK_log_of_tickets_airports` FOREIGN KEY (`coming__airport`) REFERENCES `airports` (`name_of_airport`),
  CONSTRAINT `FK_log of tickets_flights` FOREIGN KEY (`code_of_flight`) REFERENCES `flights` (`code_flight`),
  CONSTRAINT `FK_log of tickets_passegers` FOREIGN KEY (`owner's_code`) REFERENCES `passegers` (`code_passg`),
  CONSTRAINT `FK_log_of_tickets_airport` FOREIGN KEY (`airport_of_send`) REFERENCES `airports` (`name_of_airport`),
  CONSTRAINT `FK_log_of_tickets_planes` FOREIGN KEY (`code_of_plane`) REFERENCES `planes` (`code_plane`),
  CONSTRAINT `FK_log_of_tickets_price_of_tickets` FOREIGN KEY (`cost`) REFERENCES `tickets(price)` (`cost_of_ticket_in_dollars`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.log_of_tickets: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `log_of_tickets` DISABLE KEYS */;
INSERT INTO `log_of_tickets` (`code_log_ticket`, `code_of_flight`, `code_of_plane`, `cost`, `owner's_code`, `number_of_saled`, `airport_of_send`, `coming__airport`, `№_of_placement`, `date_of_buying`, `status_`) VALUES
	(1, 1, 1, 449, 1, 1, 'Hong Kong', 'Aberdin Dais', 44, '2016-09-05', 'Purchased'),
	(2, 2, 2, 600, 2, 1, 'Aberdin Dais', 'Berlin Bradenbourg', 156, '2017-01-11', 'Booked'),
	(3, 3, 3, 500, 3, 1, 'Bordo Merenyak', 'Algera Phitilia', 55, '2017-01-12', 'Purchased'),
	(4, 4, 4, 789, 4, 1, 'Berlin Bradenbourg', 'Luxembourg Phindel', 56, '2016-12-20', 'Purchased'),
	(5, 5, 5, 1200, 5, 1, 'Algera Phitilia', 'Bryansk', 23, '2017-02-02', 'Purchased'),
	(6, 6, 6, 991, 6, 1, 'Vilnews', 'Hong Kong', 12, '2017-02-01', 'Purchased'),
	(7, 7, 7, 789, 7, 1, 'Luxembourg Phindel', 'Vilnews', 99, '2017-03-20', 'Booked'),
	(8, 8, 8, 949, 8, 1, 'Amsterdam Spiphol', 'Dnipropetrovsk', 44, '2017-02-10', 'Returned'),
	(9, 9, 9, 699, 9, 1, 'Bryansk', 'Berlin Bradenbourg', 77, '2017-01-11', 'Booked'),
	(10, 10, 10, 1000, 10, 1, 'Dnipropetrovsk', 'Aberdin Dais', 123, '2017-03-24', 'Returned');
/*!40000 ALTER TABLE `log_of_tickets` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.passegers
CREATE TABLE IF NOT EXISTS `passegers` (
  `code_passg` int(11) NOT NULL AUTO_INCREMENT,
  `ser_numb_passp` char(10) DEFAULT 'NOT NULL',
  `Full name` char(50) DEFAULT 'NOT NULL',
  `gender` char(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `№_of_flight` int(11) DEFAULT NULL,
  `№_of_placement` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_passg`),
  KEY `№_of_flight` (`№_of_flight`),
  KEY `ser_numb_passp` (`ser_numb_passp`),
  KEY `FK_passegers_gender` (`gender`),
  CONSTRAINT `FK_passegers_gender` FOREIGN KEY (`gender`) REFERENCES `gender` (`name_of_gender`),
  CONSTRAINT `FK__flights` FOREIGN KEY (`№_of_flight`) REFERENCES `flights` (`code_flight`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.passegers: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `passegers` DISABLE KEYS */;
INSERT INTO `passegers` (`code_passg`, `ser_numb_passp`, `Full name`, `gender`, `age`, `№_of_flight`, `№_of_placement`) VALUES
	(1, 'AO 221111', 'Kamyaniy Sergey Vladimirovich', 'Male', 24, 5, 44),
	(2, 'AO 234242', 'Loboda Bogdan Olexandrovich', 'Male', 34, 6, 156),
	(3, 'AO 328481', 'Polyakova Yuliya Mikolaevna', 'Female', 22, 2, 55),
	(4, 'AO 332244', 'Elnikova Valeria Vitaliivna', 'Female', 33, 1, 56),
	(5, 'AO 345677', 'Bondarenko Dmytro Panasovich', 'Male', 45, 3, 23),
	(6, 'AO 356905', 'Yakovenko Volodimir Yuriyovich', 'Male', 27, 7, 12),
	(7, 'AO 423842', 'Cherkaschenko Nikita Yuriyovich', 'Male', 54, 8, 99),
	(8, 'AO 432824', 'Zakharchenko Yuri Anatoliyovich', 'Male', 22, 9, 44),
	(9, 'AO 567890', 'Zelenskaya Anastasiya Sergiivna', 'Female', 19, 4, 77),
	(10, 'AO 764583', 'Andreev Olexandr Vitalievich', 'Male', 20, 10, 123);
/*!40000 ALTER TABLE `passegers` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.planes
CREATE TABLE IF NOT EXISTS `planes` (
  `code_plane` int(11) NOT NULL AUTO_INCREMENT,
  `airport_of_origin` char(50) DEFAULT NULL,
  `airport_arrival_time` date DEFAULT NULL,
  `year_of_operation` int(11) DEFAULT NULL,
  `number_of_flights` int(11) DEFAULT NULL,
  `technical_inspection` set('Yes','No') DEFAULT NULL,
  `date_of_technical_inspaction` date DEFAULT NULL,
  `number_of_repairs` int(11) DEFAULT NULL,
  `date_of_the_last_repair` date DEFAULT NULL,
  `number_of_flights_before_repair` int(11) DEFAULT NULL,
  `plane_model` char(50) DEFAULT NULL,
  `№_of_flighting_brigade` int(11) DEFAULT NULL,
  `№_of_service_brigade` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_plane`),
  KEY `FK_planes_airport` (`airport_of_origin`),
  KEY `FK_planes_planes_models` (`plane_model`),
  KEY `FK_planes_flighting_brigade` (`№_of_flighting_brigade`),
  KEY `FK_planes_service_brigade` (`№_of_service_brigade`),
  CONSTRAINT `FK_planes_airport` FOREIGN KEY (`airport_of_origin`) REFERENCES `airports` (`name_of_airport`),
  CONSTRAINT `FK_planes_flighting_brigade` FOREIGN KEY (`№_of_flighting_brigade`) REFERENCES `flighting_brigade` (`№_of_flighting_brigade`),
  CONSTRAINT `FK_planes_planes_models` FOREIGN KEY (`plane_model`) REFERENCES `planes_models` (`name_of_model`),
  CONSTRAINT `FK_planes_service_brigade` FOREIGN KEY (`№_of_service_brigade`) REFERENCES `service_brigade` (`№_of_service_brigade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.planes: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` (`code_plane`, `airport_of_origin`, `airport_arrival_time`, `year_of_operation`, `number_of_flights`, `technical_inspection`, `date_of_technical_inspaction`, `number_of_repairs`, `date_of_the_last_repair`, `number_of_flights_before_repair`, `plane_model`, `№_of_flighting_brigade`, `№_of_service_brigade`) VALUES
	(1, 'Hong Kong', '2016-09-12', 2, 56, 'Yes', '2017-01-11', 1, '2017-01-10', 34, 'A-310', 232, 57),
	(2, 'Aberdin Dais', '2016-10-02', 1, 34, 'Yes', '2017-02-10', 3, '2017-02-22', 22, 'Airbus A320', 253, 107),
	(3, 'Bordo Merenyak', '2017-01-10', 3, 33, 'Yes', '2017-02-15', 3, '2017-02-14', 21, 'Airbus A321', 335, 111),
	(4, 'Berlin Bradenbourg', '2017-03-14', 1, 27, 'Yes', '2017-01-23', 2, '2017-01-22', 19, 'Airbus A330', 357, 121),
	(5, 'Algera Phitilia', '2017-05-22', 2, 40, 'Yes', '2017-02-17', 1, '2017-02-16', 20, 'Boing-737', 567, 123),
	(6, 'Vilnews', '2017-03-20', 2, 30, 'Yes', '2017-02-23', 1, '2017-02-22', 15, 'Boing-747', 654, 307),
	(7, 'Luxembourg Phindel', '2016-12-04', 3, 32, 'Yes', '2017-02-26', 1, '2017-02-22', 18, 'Boing-777', 753, 532),
	(8, 'Amsterdam Spiphol', '2016-10-02', 1, 30, 'Yes', '2017-02-27', 2, '2017-02-26', 23, 'Sukhoy SuperJet 100', 754, 722),
	(9, 'Bryansk', '2016-11-19', 3, 25, 'Yes', '2017-03-05', 3, '2017-03-04', 16, 'TU-144', 789, 745),
	(10, 'Dnipropetrovsk', '2017-02-16', 4, 23, 'Yes', '2017-03-06', 1, '2017-03-05', 20, 'TU-154', 994, 993);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.planes_models
CREATE TABLE IF NOT EXISTS `planes_models` (
  `code_model` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_model` char(50) NOT NULL DEFAULT '0',
  `quantity_of_passg_places` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code_model`),
  KEY `name_of_model` (`name_of_model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.planes_models: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `planes_models` DISABLE KEYS */;
INSERT INTO `planes_models` (`code_model`, `name_of_model`, `quantity_of_passg_places`) VALUES
	(1, 'TU-154', 203),
	(2, 'TU-144', 187),
	(3, 'Boing-737', 158),
	(4, 'Boing-777', 402),
	(5, 'Boing-747', 356),
	(6, 'A-310', 400),
	(7, 'Airbus A330', 241),
	(8, 'Airbus A321', 195),
	(9, 'Airbus A320', 170),
	(10, 'Sukhoy SuperJet 100', 87);
/*!40000 ALTER TABLE `planes_models` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.position
CREATE TABLE IF NOT EXISTS `position` (
  `code_position` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_position` char(50) DEFAULT NULL,
  PRIMARY KEY (`code_position`),
  KEY `name_of_position` (`name_of_position`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.position: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` (`code_position`, `name_of_position`) VALUES
	(3, 'Airborne mechanic'),
	(9, 'Chief mechanical engineer'),
	(1, 'Crew commander'),
	(8, 'Electrician'),
	(2, 'First assistant'),
	(7, 'Mechanic'),
	(5, 'Navigator'),
	(6, 'Refueler'),
	(11, 'Security crew commander'),
	(10, 'Secutiry crew'),
	(4, 'Stewardess');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.professions
CREATE TABLE IF NOT EXISTS `professions` (
  `prof_code` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_prof` char(50) DEFAULT NULL,
  PRIMARY KEY (`prof_code`),
  KEY `name_of_prof` (`name_of_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.professions: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` (`prof_code`, `name_of_prof`) VALUES
	(5, 'Mechanic'),
	(3, 'Navigator'),
	(1, 'Pilot'),
	(6, 'Security'),
	(4, 'Stewardess');
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.reason_of_delay
CREATE TABLE IF NOT EXISTS `reason_of_delay` (
  `code_delay` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_delay` char(50) DEFAULT NULL,
  PRIMARY KEY (`code_delay`),
  KEY `name_of_delay` (`name_of_delay`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.reason_of_delay: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `reason_of_delay` DISABLE KEYS */;
INSERT INTO `reason_of_delay` (`code_delay`, `name_of_delay`) VALUES
	(3, 'no reason'),
	(2, 'technical malfunction'),
	(1, 'weather');
/*!40000 ALTER TABLE `reason_of_delay` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.salaries
CREATE TABLE IF NOT EXISTS `salaries` (
  `code_salary` int(11) NOT NULL AUTO_INCREMENT,
  `size_salary_dollars` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_salary`),
  KEY `size_salary_dollars` (`size_salary_dollars`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.salaries: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` (`code_salary`, `size_salary_dollars`) VALUES
	(1, 3000),
	(2, 5000),
	(3, 7000),
	(4, 10000),
	(5, 12000),
	(6, 14000),
	(7, 15000),
	(8, 20000),
	(9, 22000),
	(10, 23000);
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.service_brigade
CREATE TABLE IF NOT EXISTS `service_brigade` (
  `code_service_brigade` int(11) NOT NULL AUTO_INCREMENT,
  `№_of_service_brigade` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_service_brigade`),
  KEY `№_of_service_brigade` (`№_of_service_brigade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.service_brigade: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `service_brigade` DISABLE KEYS */;
INSERT INTO `service_brigade` (`code_service_brigade`, `№_of_service_brigade`) VALUES
	(6, 57),
	(9, 107),
	(8, 111),
	(1, 121),
	(3, 123),
	(2, 307),
	(10, 532),
	(4, 722),
	(7, 745),
	(5, 993);
/*!40000 ALTER TABLE `service_brigade` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.staffs
CREATE TABLE IF NOT EXISTS `staffs` (
  `code_staff` int(11) NOT NULL AUTO_INCREMENT,
  `surnname` char(50) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  `patronymic` char(50) DEFAULT NULL,
  `gender_` char(50) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `work_experience` int(3) DEFAULT NULL,
  `body_check` date DEFAULT NULL,
  `addres` char(100) DEFAULT NULL,
  `childhoods` set('Yes','No') DEFAULT NULL,
  `number_of_childs` int(11) DEFAULT NULL,
  `position` char(50) DEFAULT NULL,
  `profession` char(50) DEFAULT NULL,
  `№_service_brigade` int(255) DEFAULT NULL,
  `№_flighting_brigade` int(255) DEFAULT NULL,
  `salary_in_dollars` int(11) DEFAULT NULL,
  `code_of_flight` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_staff`),
  KEY `FK__gender` (`gender_`),
  KEY `FK_staffs_salaries` (`salary_in_dollars`),
  KEY `FK_staffs_position` (`position`),
  KEY `FK_staffs_professions` (`profession`),
  KEY `FK_staffs_service_brigade` (`№_service_brigade`),
  KEY `FK_staffs_flighting_brigade` (`№_flighting_brigade`),
  KEY `code_of_flight` (`code_of_flight`),
  CONSTRAINT `FK_staffs_flighting_brigade` FOREIGN KEY (`№_flighting_brigade`) REFERENCES `flighting_brigade` (`№_of_flighting_brigade`),
  CONSTRAINT `FK_staffs_flights` FOREIGN KEY (`code_of_flight`) REFERENCES `flights` (`code_flight`),
  CONSTRAINT `FK_staffs_gender` FOREIGN KEY (`gender_`) REFERENCES `gender` (`name_of_gender`),
  CONSTRAINT `FK_staffs_position` FOREIGN KEY (`position`) REFERENCES `position` (`name_of_position`),
  CONSTRAINT `FK_staffs_professions` FOREIGN KEY (`profession`) REFERENCES `professions` (`name_of_prof`),
  CONSTRAINT `FK_staffs_salaries` FOREIGN KEY (`salary_in_dollars`) REFERENCES `salaries` (`size_salary_dollars`),
  CONSTRAINT `FK_staffs_service_brigade` FOREIGN KEY (`№_service_brigade`) REFERENCES `service_brigade` (`№_of_service_brigade`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.staffs: ~15 rows (приблизительно)
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` (`code_staff`, `surnname`, `name`, `patronymic`, `gender_`, `age`, `work_experience`, `body_check`, `addres`, `childhoods`, `number_of_childs`, `position`, `profession`, `№_service_brigade`, `№_flighting_brigade`, `salary_in_dollars`, `code_of_flight`) VALUES
	(1, 'Petrov', 'Ivan', 'Andriyovich', 'Male', 32, 3, '2017-01-12', 'Kyiv', 'Yes', 2, 'Navigator', 'Navigator', 57, 232, 12000, 1),
	(2, 'Oblachna', 'Irina', 'Vitaliivna', 'Female', 25, 1, '2017-01-11', 'Dnipro', 'No', 0, 'Stewardess', 'Stewardess', 107, 253, 3000, 2),
	(3, 'Bokoviy', 'Volodimir', 'Sergiyovich', 'Male', 39, 7, '2016-12-27', 'Kharkiv', 'Yes', 1, 'Crew commander', 'Pilot', 111, 335, 23000, 3),
	(4, 'Samsonov', 'Andriy', 'Vladimirovich', 'Male', 29, 2, '2016-11-21', 'Dnipro', 'Yes', 3, 'Electrician', 'Mechanic', 121, 357, 14000, 4),
	(5, 'Kutkovetsky', 'Volodimir', 'Valeriovich', 'Male', 27, 2, '2017-01-10', 'Zvenigorodka', 'Yes', 3, 'First assistant', 'Pilot', 123, 567, 15000, 5),
	(6, 'Krutov', 'Roman', 'Olexandrovich', 'Male', 30, 3, '2016-09-28', 'Moscow', 'No', 0, 'Refueler', 'Mechanic', 307, 654, 12000, 6),
	(7, 'Kocherga', 'Sergiy', 'Andriyovich', 'Male', 34, 4, '2017-02-09', 'Dnipro', 'No', 0, 'Airborne mechanic', 'Mechanic', 532, 753, 20000, 7),
	(8, 'Shevchenko', 'Sergiy', 'Anatoelievich', 'Male', 26, 1, '2016-08-05', 'Lviv', 'Yes', 1, 'Mechanic', 'Mechanic', 722, 754, 7000, 8),
	(9, 'Malov', 'Vladislav', 'Vladislavovich', 'Male', 28, 2, '2017-03-01', 'Kriviy Righ', 'No', 0, 'Security crew commander', 'Security', 745, 789, 10000, 9),
	(10, 'Sushkevich', 'Anatolyi', 'Sergiyovich', 'Male', 33, 4, '2017-03-27', 'Dnipro', 'Yes', 2, 'Secutiry crew', 'Security', 993, 994, 5000, 10),
	(11, 'Sonchenko', 'Boris', 'Nikolayovich', 'Male', 25, 3, '2017-04-06', 'Dnipro', 'No', 0, 'Electrician', 'Mechanic', 111, 253, 14000, 3),
	(12, 'Pupkin', 'Vasiliy', 'Borisovich', 'Male', 24, 1, '2017-05-11', 'Lviv', 'No', 0, 'Refueler', 'Mechanic', 111, 335, 12000, 3),
	(13, 'Belovol', 'Anastasia', 'Olegovna', 'Female', 27, 2, '2017-02-12', 'Kyiv', 'Yes', 1, 'Stewardess', 'Stewardess', 307, 654, 3000, 6),
	(14, 'Rybalov', 'Andriy', 'Yuriyovich', 'Male', 30, 3, '2016-12-23', 'Dnipro', 'No', 0, 'Electrician', 'Mechanic', 57, 232, 14000, 1),
	(15, 'Rudenko', 'Maxim', 'Valeriovich', 'Male', 28, 2, '2017-01-09', 'Kryviy Righ', 'No', 0, 'Secutiry crew', 'Security', 722, 754, 5000, 8);
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.the_baggage
CREATE TABLE IF NOT EXISTS `the_baggage` (
  `code_bagg` int(11) NOT NULL AUTO_INCREMENT,
  `the_weight(kh)` int(11) DEFAULT NULL,
  `the_owner` char(10) DEFAULT NULL,
  PRIMARY KEY (`code_bagg`),
  KEY `FK_the_baggage_passegers` (`the_owner`),
  CONSTRAINT `FK_the_baggage_passegers` FOREIGN KEY (`the_owner`) REFERENCES `passegers` (`ser_numb_passp`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.the_baggage: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `the_baggage` DISABLE KEYS */;
INSERT INTO `the_baggage` (`code_bagg`, `the_weight(kh)`, `the_owner`) VALUES
	(1, 5, 'AO 221111'),
	(2, 3, 'AO 764583'),
	(3, 6, 'AO 345677'),
	(4, 4, 'AO 423842'),
	(5, 2, 'AO 332244'),
	(6, 7, 'AO 234242'),
	(7, 10, 'AO 328481'),
	(8, 11, 'AO 356905'),
	(9, 5, 'AO 432824'),
	(10, 9, 'AO 567890');
/*!40000 ALTER TABLE `the_baggage` ENABLE KEYS */;

-- Дамп структуры для таблица aeroport.tickets(price)
CREATE TABLE IF NOT EXISTS `tickets(price)` (
  `code_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `cost_of_ticket_in_dollars` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_ticket`),
  KEY `cost_of_ticket_in_dollars` (`cost_of_ticket_in_dollars`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы aeroport.tickets(price): ~10 rows (приблизительно)
/*!40000 ALTER TABLE `tickets(price)` DISABLE KEYS */;
INSERT INTO `tickets(price)` (`code_ticket`, `cost_of_ticket_in_dollars`) VALUES
	(1, 449),
	(2, 500),
	(3, 600),
	(4, 699),
	(5, 789),
	(6, 899),
	(7, 949),
	(8, 991),
	(9, 1000),
	(10, 1200);
/*!40000 ALTER TABLE `tickets(price)` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
