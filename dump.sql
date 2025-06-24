CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounting`
--

DROP TABLE IF EXISTS `accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `old_value` varchar(45) DEFAULT NULL,
  `new_value` varchar(45) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `products_id` int NOT NULL,
  `emploees_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_accounting_products_idx` (`products_id`),
  KEY `fk_accounting_emploees1_idx` (`emploees_id`),
  CONSTRAINT `fk_accounting_emploees1` FOREIGN KEY (`emploees_id`) REFERENCES `emploees` (`id`),
  CONSTRAINT `fk_accounting_products` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting`
--

LOCK TABLES `accounting` WRITE;
/*!40000 ALTER TABLE `accounting` DISABLE KEYS */;
INSERT INTO `accounting` VALUES (1,'Заказ в процессе','Продан за 1000.00 руб.','2025-06-06 13:57:23',10,1,1),(2,'Старая цена: 150 руб.','Новая цена: 1250 руб.','2025-06-06 14:20:41',0,1,1),(3,'Старое название: пломбир','Новое название: МАгнат','2025-06-06 14:21:12',0,1,1),(4,'Старое название: Магнат','Новое название: лорд','2025-06-06 14:28:26',0,1,1),(5,'Старое название: лорд','Новое название: Снегр','2025-06-06 14:38:29',0,1,1),(6,'Старое название: Снегр','Новое название: снежок','2025-06-06 14:39:51',0,1,1),(7,'Старое название: снежок','Новое название: пломбирок','2025-06-06 14:40:47',0,1,1),(8,'Пополнен склад','куплен за 25000.00 руб.','2025-06-11 11:04:46',20,1,1),(9,'заказ оформлен','Продан за 25000.00 руб.','2025-06-11 11:06:16',20,1,1),(10,'Пополнен склад','куплен за 12500.00 руб.','2025-06-11 14:42:44',10,1,1),(11,'Пополнен склад','куплен за 23750.00 руб.','2025-06-22 11:49:18',19,1,1),(12,'Пополнен склад','куплен за 23750.00 руб.','2025-06-22 11:49:45',19,1,1),(13,'Старая цена: 1250 руб.','Новая цена: 1000 руб.','2025-12-20 11:53:33',0,1,1),(14,'Старая цена: 1000 руб.','Новая цена: 500 руб.','2025-12-20 11:54:30',0,1,1),(15,'Старая цена: 100 руб.','Новая цена: 1000 руб.','2025-12-20 11:54:30',0,2,1),(17,'Старая цена: 1000 руб.','Новая цена: 800 руб.','2025-06-23 14:43:36',0,2,1),(18,'Пополнен склад','куплен за 1200.00 руб.','2025-06-23 15:52:17',3,1,1),(19,'Пополнен склад','куплен за 1200.00 руб.','2025-06-23 15:52:49',3,1,1),(20,'Пополнен склад','куплен за 1600.00 руб.','2025-06-23 15:53:07',4,1,1),(21,'Пополнен склад','куплен за 16000.00 руб.','2025-06-23 15:53:49',40,1,1),(22,'Старая цена: 800 руб.','Новая цена: 640 руб.','2025-06-24 10:40:06',0,2,1),(23,'Старая цена: 640 руб.','Новая цена: 512 руб.','2025-06-24 12:06:31',0,2,1),(24,'заказ оформлен','Продан за 1536.00 руб.','2025-06-24 12:13:10',3,2,1),(25,'заказ оформлен','Продан за 1536.00 руб.','2025-06-24 12:14:20',3,2,1),(26,'заказ оформлен','Продан за 6000.00 руб.','2025-06-24 12:14:40',30,3,1),(27,'заказ оформлен','Продан за 3000.00 руб.','2025-06-24 12:18:07',10,4,1),(28,'Пополнен склад','куплен за 400.00 руб.','2025-06-24 15:39:55',1,1,1),(29,'заказ оформлен','Продан за 400.00 руб.','2025-06-24 15:40:38',1,1,1);
/*!40000 ALTER TABLE `accounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emploees`
--

DROP TABLE IF EXISTS `emploees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emploees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `post` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emploees`
--

LOCK TABLES `emploees` WRITE;
/*!40000 ALTER TABLE `emploees` DISABLE KEYS */;
INSERT INTO `emploees` VALUES (1,'билли','херингтон',100,'продавец'),(2,'джон','сина',1000,'администратор');
/*!40000 ALTER TABLE `emploees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expirations`
--

DROP TABLE IF EXISTS `expirations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expirations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `was_order` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `dey_deleys` int DEFAULT NULL,
  `price_was` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `price_become` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_expiration_date_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_expiration_date_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expirations`
--

LOCK TABLES `expirations` WRITE;
/*!40000 ALTER TABLE `expirations` DISABLE KEYS */;
INSERT INTO `expirations` VALUES (14,1,3,'2025-06-23','2025-12-23',182,400,NULL,NULL),(15,1,3,'2025-06-23','2025-12-23',182,400,NULL,NULL),(16,1,3,'2025-06-23','2025-12-23',182,400,NULL,NULL),(17,1,4,'2025-06-23','2025-12-23',182,400,NULL,NULL),(18,1,40,'2025-06-23','2025-12-23',182,400,NULL,NULL),(19,1,1,'2025-06-24','2025-12-24',183,400,NULL,NULL);
/*!40000 ALTER TABLE `expirations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `last_sales`
--

DROP TABLE IF EXISTS `last_sales`;
/*!50001 DROP VIEW IF EXISTS `last_sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `last_sales` AS SELECT 
 1 AS `total_revenue`,
 1 AS `employees`,
 1 AS `month_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `suppliers_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_supliers1_idx` (`suppliers_id`),
  CONSTRAINT `fk_products_supliers1` FOREIGN KEY (`suppliers_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'пломбирок',400,1),(2,'снежок',512,1),(3,'морозик',200,2),(4,'пингвиненок',300,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_before_update` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    -- Объявляем все переменные в начале триггера
    DECLARE old_suppliers_name VARCHAR(100);
    DECLARE new_suppliers_name VARCHAR(100);
    DECLARE v_default_employee INT DEFAULT 1; -- Укажите ID администратора или NULL
    
    -- Изменение цены
    IF NEW.price != OLD.price THEN
        INSERT INTO accounting (old_value, new_value, time, products_id, emploees_id, amount)
        VALUES (
            CONCAT('Старая цена: ', OLD.price, ' руб.'),
            CONCAT('Новая цена: ', NEW.price, ' руб.'),
            NOW(),
            NEW.id,
            v_default_employee,
            0 -- Для изменений цены amount=0
        );
    END IF;
    
    -- Изменение названия
    IF NEW.title != OLD.title THEN
        INSERT INTO accounting (old_value, new_value, time, products_id, emploees_id, amount)
        VALUES (
            CONCAT('Старое название: ', OLD.title),
            CONCAT('Новое название: ', NEW.title),
            NOW(),
            NEW.id,
            v_default_employee,
            0
        );
    END IF;
    
    -- Изменение поставщика
    IF NEW.suppliers_id != OLD.suppliers_id THEN
        -- Получаем имена поставщиков
        SELECT name INTO old_suppliers_name FROM suppliers WHERE id = OLD.suppliers_id;
        SELECT name INTO new_suppliers_name FROM suppliers WHERE id = NEW.suppliers_id;
        
        INSERT INTO accounting (old_value, new_value, time, products_id, emploees_id, amount)
        VALUES (
            CONCAT('Старый поставщик: ', IFNULL(old_suppliers_name, 'не указан')),
            CONCAT('Новый поставщик: ', IFNULL(new_suppliers_name, 'не указан')),
            NOW(),
            NEW.id,
            v_default_employee,
            0
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_products1_idx` (`products_id`),
  CONSTRAINT `fk_stock_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'пломбирок',150,1),(2,'снежок',94,2),(3,'морозик',170,3),(4,'пингвиненок',290,4);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_company` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'снег','олег',2134),(2,'мороз','дима',2314),(3,'лед','вася',1344);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `product_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `product_price`(product_id INT) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE product_price DECIMAL(10,2);
    
    SELECT price INTO product_price 
    FROM products 
    WHERE id = product_id;
    
    RETURN product_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_products`(
  in p_employee_id INT,
  in p_product_id INT,
  in p_amount INT
)
BEGIN

DECLARE v_stock_amount INT;
DECLARE v_product_name VARCHAR(255);
 DECLARE v_product_price DECIMAL(10,2); -- Добавляем переменную для цены
    DECLARE v_total_price DECIMAL(10,2); -- Переменная для общей суммы
DECLARE v_expiration_date date; -- Переменная для общей суммы
declare v_deleys_day int;

start transaction;

SET SQL_SAFE_UPDATES = 0;

SELECT s.amount, p.title, p.price 
    INTO v_stock_amount, v_product_name, v_product_price
    FROM stock s
    JOIN products p ON s.products_id = p.id
    WHERE s.products_id = p_product_id;

    SELECT title, amount INTO v_product_name, v_stock_amount 
    FROM stock
    WHERE stock.id = p_product_id;
    
    IF NOT EXISTS (SELECT 1 FROM emploees WHERE emploees.id = p_employee_id) THEN
    select 'Не существует такого работника!';
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Несуществует такого работника!';
END IF;

IF NOT EXISTS (SELECT 1 FROM products WHERE products.id = p_product_id) THEN
    select 'Не существует такого товара у поставщика!';
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Несуществует такого товара у поставщика!';
END IF;
    
  update stock
    set amount = amount + p_amount
    where stock.products_id = p_product_id;
    
    SET v_total_price = v_product_price * p_amount;
    
    SET v_expiration_date = NOW() + INTERVAL 6 MONTH;
    
    set v_deleys_day = DATEDIFF(v_expiration_date, NOW());
    
    insert into expirations (stock_id, quantity, was_order, expiration_date, dey_deleys)
    values(p_product_id, p_amount, NOW(),  v_expiration_date, v_deleys_day);
    
	UPDATE expirations 
    join stock on stock_id = stock.id
    join products on stock.products_id = products.id
    SET expirations.price_was = products.price;
    
    INSERT INTO accounting (old_value, new_value, time, amount, products_id, emploees_id)
        VALUES ('Пополнен склад', CONCAT('куплен за ', v_total_price, ' руб.'), NOW(), p_amount, p_product_id, p_employee_id);

select 'Склад пополнен за : ' + v_total_price as 'Склад пополнен за : ';

SET SQL_SAFE_UPDATES = 1;
commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `artem_wolf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `artem_wolf`()
BEGIN
SET SQL_SAFE_UPDATES = 0;
    -- Начало транзакции
    START TRANSACTION;
    
    -- Сначала обновляем складские остатки
    UPDATE stock s
    JOIN expirations e ON s.id = e.stock_id
    SET s.amount = s.amount - e.quantity
    WHERE e.dey_deleys = 0;
    
    -- Затем удаляем просроченные записи
    DELETE FROM expirations WHERE dey_deleys = 0;
    
    -- Фиксация транзакции
    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `discount_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `discount_products`()
BEGIN
SET SQL_SAFE_UPDATES = 0;
UPDATE expirations 
    join stock on stock_id = stock.id
    join products on stock.products_id = products.id
    SET expirations.price_was = products.price;

  UPDATE expirations
  SET dey_deleys = DATEDIFF(expiration_date, CURDATE())
  WHERE id > 0;
 
 update expirations
join stock on stock_id = stock.id
join products on stock.products_id = products.id
 set discount = 20,
     price_become = price_was * (1 - 20 / 100),
     products.price = price_was * (1 - 20 / 100)
 where dey_deleys <= 7 and expirations.stock_id = products.id and discount is null;
 
SELECT * FROM mydb.expirations;
SET SQL_SAFE_UPDATES = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procces_sales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procces_sales`(
  in p_employee_id INT,
  in p_product_id INT,
  in p_amount INT
)
BEGIN

 DECLARE v_stock_amount INT;
DECLARE v_product_name VARCHAR(255);
 DECLARE v_product_price DECIMAL(10,2); -- Добавляем переменную для цены
    DECLARE v_total_price DECIMAL(10,2); -- Переменная для общей суммы

start transaction;

SELECT s.amount, p.title, p.price 
    INTO v_stock_amount, v_product_name, v_product_price
    FROM stock s
    JOIN products p ON s.products_id = p.id
    WHERE s.products_id = p_product_id;


  -- Получаем текущее количество товара на складе и его название
    SELECT title, amount INTO v_product_name, v_stock_amount 
    FROM stock
    WHERE stock.id = p_product_id;
    
    
    
    
  if v_stock_amount < p_amount then
    select 'Недостаточно товара на складе';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недостаточно товара на складе';
  end if;
    
    IF NOT EXISTS (SELECT 1 FROM emploees WHERE emploees.id = p_employee_id) THEN
    select 'Несуществует такого работника!';
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Несуществует такого работника!';
END IF;

IF NOT EXISTS (SELECT 1 FROM products WHERE products.id = p_product_id) THEN
    select 'Несуществует такого товара!';
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Несуществует такого товара!';
END IF;
    
  update stock
    set amount = amount - p_amount
    where stock.products_id = p_product_id;
    
    SET v_total_price = v_product_price * p_amount;
    
    
    INSERT INTO accounting (old_value, new_value, time, amount, products_id, emploees_id)
        VALUES ('заказ оформлен', CONCAT('Продан за ', v_total_price, ' руб.'), NOW(), p_amount, p_product_id, p_employee_id);

select 'Продано за : ' + v_total_price as 'Продано за : ';

commit;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `last_sales`
--

/*!50001 DROP VIEW IF EXISTS `last_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_sales` AS select sum((`p`.`price` * `cl`.`amount`)) AS `total_revenue`,count(distinct `cl`.`emploees_id`) AS `employees`,date_format(`cl`.`time`,'%Y-%m') AS `month_year` from (`accounting` `cl` join `products` `p` on((`cl`.`products_id` = `p`.`id`))) where ((`cl`.`new_value` like 'Продан за%') and (date_format(`cl`.`time`,'%Y-%m') = '2025-06')) group by date_format(`cl`.`time`,'%Y-%m') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 20:01:32
