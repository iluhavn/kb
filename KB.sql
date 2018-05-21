-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.1.33-community - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.4.0.5190
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных kb
CREATE DATABASE IF NOT EXISTS `kb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `kb`;

-- Дамп структуры для таблица kb.komer4banki
CREATE TABLE IF NOT EXISTS `komer4banki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Наименование` char(50) DEFAULT NULL,
  `Адрес` char(80) DEFAULT NULL,
  `Вклад на год` float DEFAULT NULL,
  `Статус` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы kb.komer4banki: ~20 rows (приблизительно)
/*!40000 ALTER TABLE `komer4banki` DISABLE KEYS */;
INSERT INTO `komer4banki` (`id`, `Наименование`, `Адрес`, `Вклад на год`, `Статус`) VALUES
	(1, '21 век', '197110, Санкт-Петербург, Песочная набережная, дом 40, литера А, помещение 26-Н', 5.1, 'Частный'),
	(2, 'Абсолют банк', '127051, г. Москва, Цветной бульвар, д. 18', 7.5, 'Частный'),
	(3, 'Авангард', '115035, г. Москва, ул. Садовническая, д.12, стр. 1', 7, 'Частный'),
	(4, 'Аверс', '420111, г.Казань, ул.Мусы Джалиля, д.3', 5.25, 'Частный'),
	(5, 'Автовазбанк', '445021, Самарская обл., г.Тольятти, ул.Голосова, 26 А', 5, 'Частный'),
	(6, 'Автокредитбанк', '420081, г.Казань, пр-т А. Камалеева, д.16а', 6.75, 'Частный'),
	(7, 'Автоторгбанк', '123007, г. Москва, 1-я Магистральная улица, д. 13, стр. 2', 7, 'Частный'),
	(8, 'Агропромкредит', '140083, Московская область, г. Лыткарино, 5-й микрорайон, квартал 2, д. 13', 7.25, 'Частный'),
	(9, 'Агророс', '410017, г.Саратов, ул.Чернышевского, 90', 6.25, 'Частный'),
	(10, 'Агросоюз', '101000, г. Москва, Уланский пер., д. 13, стр. 1', 7, 'Частный'),
	(11, 'Азиатско-Тихоокеанский банк', '675000, Амурская обл., г. Благовещенск, ул.Амурская, 225', 7.5, 'Частный'),
	(12, 'АК БАРС', '420066, г.Казань, ул.Декабристов,1', 7.3, 'Государственный'),
	(13, 'Акибанк', '423818, Республика Татарстан, г.Набережные Челны, пр.Мира, д.88а', 6.75, 'Смешанный'),
	(14, 'Акрополь', '123557, г. Москва, ул. Грузинский вал, д.10, стр. 4', 7, 'Частный'),
	(15, 'Аксонбанк', '156961, г. Кострома, пр-т Мира, 55', 6.5, 'Частный'),
	(16, 'Актив банк', '430005, г.Саранск, ул.Коммунистическая, 52', 6.3, 'Частный'),
	(17, 'Акцент', '462431, Оренбургская обл., г. Орск, просп. Ленина, 75а', 6.2, 'Частный'),
	(18, 'Александровский', '191119, Санкт-Петербург, Загородный пр., 46, литер Б, корпус 2', 6.8, 'Частный'),
	(19, 'Алеф-банк', '117218, г. Москва, ул. Кржижановского, д. 21/33, корп. 1', 7.25, 'Частный'),
	(20, 'Альфа-банк', '107078, г. Москва, ул. Каланчевская, д. 27', 10, 'Частный');
/*!40000 ALTER TABLE `komer4banki` ENABLE KEYS */;

-- Дамп структуры для таблица kb.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы kb.status: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`, `Type`) VALUES
	(1, 'Государственный'),
	(2, 'Частный'),
	(3, 'Смешанный');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Дамп структуры для таблица kb.storage
CREATE TABLE IF NOT EXISTS `storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Банк` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_storage_komer4banki` (`Банк`),
  CONSTRAINT `FK_storage_komer4banki` FOREIGN KEY (`Банк`) REFERENCES `komer4banki` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы kb.storage: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` (`id`, `Банк`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
