-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: application
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cl_pages`
--

DROP TABLE IF EXISTS cl_pages;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE cl_pages (
  id_page int(4) NOT NULL AUTO_INCREMENT,
  slug varchar(100) CHARACTER SET utf8 NOT NULL,
  title varchar(100) COLLATE utf8_bin NOT NULL,
  is_active tinyint(4) DEFAULT '1',
  id_creator int(11) NOT NULL,
  dt_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_editor int(11) DEFAULT NULL,
  dt_edited datetime DEFAULT NULL,
  PRIMARY KEY (id_page)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_pages`
--

LOCK TABLES cl_pages WRITE;
/*!40000 ALTER TABLE cl_pages DISABLE KEYS */;
INSERT INTO cl_pages VALUES (5,'about','About',1,100000,'2018-02-26 00:20:01',NULL,NULL),(6,'home','Home',1,100000,'2018-02-26 00:20:01',NULL,NULL),(7,'swagger','Swagger',1,100000,'2018-02-26 00:20:01',NULL,NULL),(8,'access-control','Access Control',1,100000,'2018-02-26 00:20:01',NULL,NULL),(9,'test-info','Testing Information',1,100000,'2018-02-26 00:20:01',NULL,NULL);
/*!40000 ALTER TABLE cl_pages ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cl_rules`
--

DROP TABLE IF EXISTS cl_rules;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE cl_rules (
  id_rule int(4) NOT NULL AUTO_INCREMENT,
  id_page int(4) NOT NULL,
  title varchar(100) CHARACTER SET utf8 NOT NULL,
  description varchar(500) COLLATE utf8_bin DEFAULT NULL,
  is_active tinyint(4) DEFAULT '1',
  id_creator int(11) NOT NULL,
  dt_created datetime NOT NULL,
  id_editor int(11) DEFAULT NULL,
  dt_edited datetime DEFAULT NULL,
  PRIMARY KEY (id_rule)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_rules`
--

LOCK TABLES cl_rules WRITE;
/*!40000 ALTER TABLE cl_rules DISABLE KEYS */;
/*!40000 ALTER TABLE cl_rules ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_employee`
--

DROP TABLE IF EXISTS pages_employee;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE pages_employee (
  id_page int(4) NOT NULL,
  id_employee int(11) NOT NULL,
  rules varchar(100) COLLATE utf8_bin DEFAULT NULL,
  is_active varchar(45) COLLATE utf8_bin DEFAULT '1',
  PRIMARY KEY (id_page,id_employee)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_employee`
--

LOCK TABLES pages_employee WRITE;
/*!40000 ALTER TABLE pages_employee DISABLE KEYS */;
INSERT INTO pages_employee VALUES (5,102525,'1,3','1'),(5,102526,'4,5','1'),(5,107021,'1,2','1'),(5,108520,'1,4,8','1'),(6,100656,'1,2','1'),(8,100656,'1,2,3,4','1');
/*!40000 ALTER TABLE pages_employee ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_position`
--

DROP TABLE IF EXISTS pages_position;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE pages_position (
  id_page int(4) NOT NULL,
  id_position int(4) NOT NULL,
  rules varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  is_active int(11) DEFAULT '1',
  PRIMARY KEY (id_page,id_position)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_position`
--

LOCK TABLES pages_position WRITE;
/*!40000 ALTER TABLE pages_position DISABLE KEYS */;
INSERT INTO pages_position VALUES (5,73,'5,8,9',1),(5,80,'1,9',1),(5,1234,'12',1),(6,73,'1,4',1);
/*!40000 ALTER TABLE pages_position ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_log`
--

DROP TABLE IF EXISTS permissions_log;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE permissions_log (
  id_log int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(250) DEFAULT NULL,
  id_creator int(11) DEFAULT NULL,
  dt_created datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_log)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_log`
--

LOCK TABLES permissions_log WRITE;
/*!40000 ALTER TABLE permissions_log DISABLE KEYS */;
INSERT INTO permissions_log VALUES (1,'Add permission to page 5 for position  with rules ()',100000,'2018-02-25 19:42:12'),(2,'Add permission to page 5 for position 21 with rules ()',100000,'2018-02-25 19:50:07'),(3,'Add permission to page 5 for position 21 with rules (2, 4,8)',100000,'2018-02-25 19:51:52'),(4,'Add permission to page 5 for employee 102525 with rules (1,2,3)',100000,'2018-02-25 19:53:25'),(5,'Add permission to page 5 for employee 102525 with rules ()',100000,'2018-02-25 19:53:34'),(6,'Add permission to page 5 for position 21 with rules (1)',100000,'2018-02-25 19:57:41'),(7,'Add permission to page 5 for position 21 with rules (1)',100000,'2018-02-25 19:57:46'),(8,'Add permission to page 5 for employee 102525 with rules (4,5)',100000,'2018-02-25 19:58:11'),(9,'Add permission to page 5 for employee 102526 with rules (4,5)',100000,'2018-02-25 19:58:15'),(10,'Add permission to page 5 for position ertert with rules ()',100000,'2018-02-25 20:03:53'),(11,'Add permission to page 5 for position  with rules ()',100000,'2018-02-25 20:05:36'),(12,'Add permission to page 5 for position 45 with rules (8,9)',100000,'2018-02-25 20:06:45'),(13,'Add permission to page 5 for position 45 with rules (8,9,10)',100000,'2018-02-25 20:06:51'),(14,'Add permission to page 5 for employee 100656 with rules (1)',100000,'2018-02-25 20:08:32'),(15,'Add permission to page 5 for employee 100656 with rules (2)',100000,'2018-02-25 20:09:57'),(16,'Add permission to page 5 for employee 100656 with rules (234)',100000,'2018-02-25 20:10:23'),(17,'Add permission to page 5 for employee 100656 with rules ()',100000,'2018-02-25 20:11:33'),(18,'Add permission to page 5 for employee 100656 with rules (1)',100000,'2018-02-25 20:11:37'),(19,'Add permission to page 5 for employee 100656 with rules (1,2,3)',100000,'2018-02-25 20:11:58'),(20,'Add permission to page 5 for employee 100656 with rules (1)',100000,'2018-02-25 20:13:16'),(21,'Add permission to page 5 for employee 100656 with rules (1,2,3)',100000,'2018-02-25 20:13:47'),(22,'Add permission to page 5 for employee 100656 with rules (1,2,3)',100000,'2018-02-25 20:13:53'),(23,'Add permission to page 5 for employee 100656 with rules (1,2)',100000,'2018-02-25 20:14:25'),(24,'Add permission to page 5 for employee 107021 with rules (1,2)',100000,'2018-02-25 20:14:31'),(25,'Add permission to page 5 for employee 100656 with rules (1,3)',100000,'2018-02-25 20:14:47'),(26,'Add permission to page 5 for employee 102525 with rules (1,3)',100000,'2018-02-25 20:14:51'),(27,'Add permission to page 8 for employee 100656 with rules (1,2,3)',100000,'2018-02-25 20:24:14'),(28,'Add permission to page 8 for employee 100656 with rules (1,2,3,4)',100000,'2018-02-25 20:24:18'),(29,'Delete permission to page 5 for position 1',100000,'2018-02-25 21:04:57'),(30,'Delete permission to page 5 for employee 100656',100000,'2018-02-25 21:05:25'),(31,'Add permission to page 5 for position 50 with rules (1,5,8)',100000,'2018-02-25 21:06:03'),(32,'Delete permission to page 5 for position 21',100000,'2018-02-25 21:06:11'),(33,'Delete permission to page 5 for position 45',100000,'2018-02-25 21:06:20'),(34,'Delete permission to page 5 for position 50',100000,'2018-02-25 21:06:21'),(35,'Add permission to page 5 for position 73 with rules (5,8)',100000,'2018-02-25 21:06:33'),(36,'Add permission to page 5 for position 73 with rules (5,8,9)',100000,'2018-02-25 21:07:06'),(37,'Add permission to page 5 for position 1234 with rules (12)',100000,'2018-02-25 22:16:06'),(38,'Delete permission to page 5 for position 1234',100000,'2018-02-25 22:16:08'),(39,'Add permission to page 5 for position 1234 with rules (12)',100000,'2018-02-25 22:16:09'),(40,'Add permission to page 5 for position 1234 with rules (12)',100000,'2018-02-25 22:16:10'),(41,'Add permission to page 5 for position 1234 with rules (12)',100000,'2018-02-25 22:16:12');
/*!40000 ALTER TABLE permissions_log ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'application'
--

--
-- Dumping routines for database 'application'
--
/*!50003 DROP FUNCTION IF EXISTS GET_PAGE_PERM */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION GET_PAGE_PERM(page_id INT, emp_id INT, pos_id INT) RETURNS int(11)
BEGIN

SET @perm = 0;

IF(pos_id = 800) THEN
	SET @perm = 1;
ELSE
	SELECT count(*) INTO @perm FROM pages_employees WHERE id_page = page_id and id_employee = emp_id AND is_active = 1;
	IF(@perm = 0) THEN
		SELECT count(*) INTO @perm FROM pages_positions WHERE id_page = page_id and id_position = pos_id AND is_active = 1;
	END IF;
END IF;

RETURN @perm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS GET_RULE_PERM */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION GET_RULE_PERM(page_id INT, emp_id INT, pos_id INT) RETURNS int(11)
BEGIN

SET @perm = 0;

IF(pos_id = 800) THEN
	SET @perm = 1;
ELSE
	SELECT count(*) INTO @perm FROM rules_employees WHERE id_page = page_id and id_employee = emp_id AND is_active = 1;
	IF(@perm = 0) THEN
		SELECT count(*) INTO @perm FROM rules_positions WHERE id_page = page_id and id_position = pos_id AND is_active = 1;
	END IF;
END IF;

RETURN @perm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS ID_PAGE_GET */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost FUNCTION ID_PAGE_GET(slugS text) RETURNS int(11)
BEGIN
	RETURN (
		SELECT id_page
		FROM cl_pages
		WHERE slug = slugS LIMIT 1
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS SPLIT_STR_PARAM */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost FUNCTION SPLIT_STR_PARAM(x TEXT, delim VARCHAR(12),pos INT) RETURNS text CHARSET utf8
RETURN REPLACE
	(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
	LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
	delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS sp_perm_check */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE sp_perm_check(IN case_in INT, IN data_in text, IN editor_id INT)
BEGIN

DECLARE GET_PAGES INT DEFAULT 1;
DECLARE GET_RULES INT DEFAULT 2;
DECLARE SET_PAGE INT DEFAULT 3;

DECLARE GET_ALL_PAGES INT DEFAULT 5;
DECLARE GET_ALL_RULES INT DEFAULT 6;
DECLARE GET_ALL_PAGES_PERM_POS INT DEFAULT 7;
DECLARE GET_ALL_PAGES_PERM_EMP INT DEFAULT 8;
DECLARE GET_ALL_RULES_PERM_POS INT DEFAULT 9;
DECLARE GET_ALL_RULES_PERM_EMP INT DEFAULT 10;

CASE

WHEN case_in = GET_ALL_PAGES THEN

	SELECT
		p.id_page,
		p.title,
		p.slug
    FROM cl_pages p;

WHEN case_in = GET_ALL_RULES THEN

	SET @id_page = SPLIT_STR_PARAM(data_in, "|-|",1);

	SELECT
		r.id_rule,
        r.title,
        r.description
    FROM cl_rules r
    where id_page = @id_page;

WHEN case_in = GET_ALL_PAGES_PERM_POS THEN

	SET @id_page = SPLIT_STR_PARAM(data_in, "|-|",1);

    SELECT
    id_position,
    is_active,
    rules
    FROM pages_position WHERE id_page = @id_page;

WHEN case_in = GET_ALL_PAGES_PERM_EMP THEN

	SET @id_page = SPLIT_STR_PARAM(data_in, "|-|",1);

    SELECT
    id_employee,
    is_active,
    rules
    FROM pages_employee WHERE id_page = @id_page;


WHEN case_in = GET_PAGES THEN

	SET @slug = SPLIT_STR_PARAM(data_in, "|-|",1);
    SET @emp_id = SPLIT_STR_PARAM(data_in, "|-|",2);
    SET @pos_id = SPLIT_STR_PARAM(data_in, "|-|",3);

	SELECT
		p.id_page,
		p.title,
		p.slug
    FROM cl_pages p
    where id_page = ID_PAGE_GET(@slug) AND GET_PAGE_PERM(p.id_page, @emp_id, @pos_id) > 0;

WHEN case_in = GET_RULES THEN

	SET @id_page = SPLIT_STR_PARAM(data_in, "|-|",1);

	SELECT
		r.id_rule,
        r.title,
        r.description
    FROM cl_rules r
    where id_page = @id_page AND GET_RULE_PERM(r.id_rule, @emp_id, @pos_id) > 0;

WHEN case_in = SET_PAGE THEN

	SET @id_action = SPLIT_STR_PARAM(data_in, "|-|",1);
    SET @id_type = SPLIT_STR_PARAM(data_in, "|-|",2);
    SET @id_page = SPLIT_STR_PARAM(data_in, "|-|",3);
    SET @rules = SPLIT_STR_PARAM(data_in, "|-|",4);
    SET @identifier = SPLIT_STR_PARAM(data_in, "|-|",5);

    IF(@id_action = 1 ) THEN

		IF(@id_type = 1 ) THEN
			INSERT INTO pages_employee (id_page, id_employee, rules)
			VALUES(@id_page, @identifier, @rules) ON DUPLICATE KEY UPDATE rules = @rules;

            INSERT INTO permissions_log (action, id_creator)
            VALUES(CONCAT("Add permission to page ",@id_page," for employee ",@identifier, " with rules (", @rules,")"), editor_id);
		ELSE
			INSERT INTO pages_position (id_page, id_position, rules)
			VALUES(@id_page, @identifier, @rules) ON DUPLICATE KEY UPDATE rules = @rules;

            INSERT INTO permissions_log (action, id_creator)
            VALUES(CONCAT("Add permission to page ",@id_page," for position ",@identifier, " with rules (", @rules,")"), editor_id);
		END IF;

	ELSEIF (@id_action = 2 ) THEN

		IF(@id_type = 1 ) THEN
			DELETE FROM pages_employee where id_page = @id_page and id_employee = @identifier;
            INSERT INTO permissions_log (action, id_creator)
            VALUES(CONCAT("Delete permission to page ",@id_page," for employee ",@identifier), editor_id);
		ELSE
			DELETE FROM pages_position where id_page = @id_page and id_position = @identifier;
            INSERT INTO permissions_log (action, id_creator)
            VALUES(CONCAT("Delete permission to page ",@id_page," for position ",@identifier), editor_id);
		END IF;

    END IF;

    SELECT 1;

END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-25 22:24:41
