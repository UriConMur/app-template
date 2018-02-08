CREATE DATABASE  IF NOT EXISTS `access_pages` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `access_pages`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: access_pages
-- ------------------------------------------------------
-- Server version	5.6.35

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

DROP TABLE IF EXISTS `cl_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cl_pages` (
  `id_page` int(4) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) CHARACTER SET utf8 NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `id_creator` int(11) NOT NULL,
  `dt_creator` datetime NOT NULL,
  `id_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cl_permits`
--

DROP TABLE IF EXISTS `cl_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cl_permits` (
  `id_perm` int(2) NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_creator` int(11) NOT NULL,
  `dt_creator` datetime NOT NULL,
  `id_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cl_sections`
--

DROP TABLE IF EXISTS `cl_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cl_sections` (
  `id_section` int(4) NOT NULL AUTO_INCREMENT,
  `id_page` int(4) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `id_creator` int(11) NOT NULL,
  `dt_creator` datetime NOT NULL,
  `id_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_section`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages_employee_permits`
--

DROP TABLE IF EXISTS `pages_employee_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_employee_permits` (
  `id_page` int(4) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_permits` int(2) NOT NULL,
  `id_creator` int(11) NOT NULL,
  `dt_creator` datetime NOT NULL,
  `id_last_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_page`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages_position_permits`
--

DROP TABLE IF EXISTS `pages_position_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_position_permits` (
  `id_page` int(4) NOT NULL,
  `id_position` int(4) NOT NULL,
  `id_permits` int(2) DEFAULT NULL,
  `id_creator` int(11) NOT NULL,
  `dt_creator` datetime NOT NULL,
  `id_last_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_page`,`id_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_employee_permits`
--

DROP TABLE IF EXISTS `sections_employee_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_employee_permits` (
  `id_section` int(4) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_permits` int(2) DEFAULT NULL,
  `id_creator` int(11) NOT NULL,
  `dt_creator` datetime NOT NULL,
  `id_last_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_section`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_position_permits`
--

DROP TABLE IF EXISTS `sections_position_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_position_permits` (
  `id_section` int(4) NOT NULL,
  `id_position` int(11) NOT NULL,
  `id_permits` int(2) DEFAULT NULL,
  `id_creator` int(11) NOT NULL,
  `dt_creator` datetime NOT NULL,
  `id_last_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_section`,`id_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'access_pages'
--

--
-- Dumping routines for database 'access_pages'
--
/*!50003 DROP FUNCTION IF EXISTS `ID_PAGE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ID_PAGE_GET`(slugS text) RETURNS int(11)
BEGIN
	RETURN (
		SELECT id_page
		FROM cl_pages 
		WHERE slug = slugS
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR_PARAM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR_PARAM`(x TEXT, delim VARCHAR(12),pos INT) RETURNS text CHARSET utf8
RETURN REPLACE
	(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
	LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
	delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pages_sections_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pages_sections_get`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE GET_PAGES INT DEFAULT 1;
DECLARE GET_PAGES_SECTIONS INT DEFAULT 2;
DECLARE GET_PERMITS INT DEFAULT 3;

CASE
	WHEN case_type = GET_PAGES THEN # 
		SELECT * FROM access_pages.cl_pages;
	WHEN case_type = GET_PAGES_SECTIONS THEN # 
		SELECT * FROM access_pages.cl_sections;
	WHEN case_type = GET_PERMITS THEN # 
		SELECT * FROM access_pages.cl_permits;
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pages_sections_set` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pages_sections_set`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE ADD_NEW_PAGE INT DEFAULT 1;
DECLARE ADD_NEW_SECTION INT DEFAULT 2;
DECLARE ADD_NEW_PERMITS INT DEFAULT 3;

CASE
	WHEN case_type = ADD_NEW_PAGE THEN # 
        SET @new_slug = SPLIT_STR_PARAM(data_value,"|-|",1);    
        SET @new_title = SPLIT_STR_PARAM(data_value,"|-|",2);
		INSERT INTO cl_pages
		(`slug`,
        `title`,
        `id_creator`,
		`dt_creator`,
        `id_modifier`,
		`dt_last_modifier`)
		VALUES
		(@new_slug,
        @new_title,
        id_modifier,
        NOW(),
        id_modifier,
        NOW());
	
	WHEN case_type = ADD_NEW_SECTION THEN # 
		SET @id_page = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @new_title = SPLIT_STR_PARAM(data_value,"|-|",2);
        
		INSERT INTO cl_sections
		(`id_page`,
        `title`,
        `id_creator`,
		`dt_creator`,
        `id_modifier`,
		`dt_last_modifier`)
		VALUES
		(@id_page,
        @new_title,
        id_modifier,
        NOW(),
        id_modifier,
        NOW());
        
	WHEN case_type = ADD_NEW_PERMITS THEN # 
		SET @id_permit = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @description = SPLIT_STR_PARAM(data_value,"|-|",2);
        
		INSERT INTO cl_permits
        (`id_perm`, 
        `description`,
        `id_creator`,
        `dt_creator`,
        `id_modifier`,
        `dt_last_modifier`) 
        VALUES 
        (@id_permit, 
        @description,
        id_modifier,
        NOW(),
        id_modifier,
        NOW());

END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_permits_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_permits_get`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE GET_PAGE_PERMIT INT DEFAULT 1;
DECLARE GET_SECTION_PERMIT INT DEFAULT 2;

CASE
	WHEN case_type = GET_PAGE_PERMIT THEN # Get page permissions 
        SET @id_page= ID_PAGE_GET(1,SPLIT_STR_PARAM(data_value,"|-|",1));
        SET @id_employee= SPLIT_STR_PARAM(data_value,"|-|",2);
        SET @id_position= SPLIT_STR_PARAM(data_value,"|-|",3);
        
        SET @position_permits = (
			SELECT id_permits 
			FROM pages_position_permits 
			WHERE id_page = @id_page AND id_position = @id_position
        );
        
        SET @employee_permits = (
			SELECT id_permits 
			FROM pages_employee_permits 
			WHERE id_page = @id_page AND id_employee = @id_employee
		);
        
        SELECT (
			IF (@position_permits != '',
				IF(@employee_permits !='',
					IF (@position_permits > @employee_permits,
						@position_permits,
                        @employee_permits),
                    @position_permits),
                @employee_permits               
            )    
		) as pp;
        
	WHEN case_type = GET_SECTION_PERMIT THEN # Get page permissions 
        SET @id_section= SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @id_employee= SPLIT_STR_PARAM(data_value,"|-|",2);
        SET @id_position= SPLIT_STR_PARAM(data_value,"|-|",3);
        
        SET @position_permits = (
			SELECT id_permits 
			FROM sections_position_permits 
			WHERE id_section = @id_section AND id_position = @id_position
        );
        
        SET @employee_permits = (
			SELECT id_permits 
			FROM sections_employee_permits 
			WHERE id_section = @id_section AND id_employee = @id_employee
		);
        
        SELECT (
			IF (@position_permits != '',
				IF(@employee_permits !='',
					IF (@position_permits > @employee_permits,
						@position_permits,
                        @employee_permits),
                    @position_permits),
                @employee_permits               
            )    
		) as pp;
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_permits_set` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_permits_set`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE SET_PAGE_EMPLOYEE INT DEFAULT 1;
DECLARE SET_PAGE_POSITION INT DEFAULT 2;
DECLARE SET_SECTION_EMPLOYEE INT DEFAULT 3;
DECLARE SET_SECTION_POSITION INT DEFAULT 4;

DECLARE MODIFY_PAGE_EMPLOYEE INT DEFAULT 5;
DECLARE MODIFY_PAGE_POSITION INT DEFAULT 6;
DECLARE MODIFY_SECTION_EMPLOYEE INT DEFAULT 7;
DECLARE MODIFY_SECTION_POSITION INT DEFAULT 8;

DECLARE DELETE_PAGE_EMPLOYEE INT DEFAULT 9;
DECLARE DELETE_PAGE_POSITION INT DEFAULT 10;
DECLARE DELETE_SECTION_EMPLOYEE INT DEFAULT 11;
DECLARE DELETE_SECTION_POSITION INT DEFAULT 12;

CASE
#---------------------------------------------------------------SET PERMITS
	WHEN case_type = SET_PAGE_EMPLOYEE THEN # Set permits to the page per employee
        SET @id_page = ID_PAGE_GET(SPLIT_STR_PARAM(data_value,'|+|',1));
        SET @all_id_employees = SPLIT_STR_PARAM(data_value,'|+|',2);
        SET @id_permits = SPLIT_STR_PARAM(data_value,'|+|',3);
		
        SET @iterator = 1;
		SET @id_employee = SPLIT_STR_PARAM(@all_id_employees,'|-|',@iterator);

		WHILE @id_employee DO
            INSERT INTO pages_employee_permits
			(id_page,
			id_employee,
			id_permits,
			id_creator,
			dt_creator,
			id_last_modifier,
			dt_last_modifier)
			VALUES
			(@id_page,
			@id_employee,
			@id_permits,
			id_modifier,
			NOW(),
			id_modifier,
			NOW());
            SET @iterator = @iterator + 1;
            SET @id_employee = SPLIT_STR_PARAM(@all_id_employees,'|-|',@iterator);
		END WHILE;
    
	WHEN case_type = SET_PAGE_POSITION THEN # Set permits to the page per position
        SET @id_page = ID_PAGE_GET(SPLIT_STR_PARAM(data_value,'|+|',1));
        SET @all_id_positions = SPLIT_STR_PARAM(data_value,'|+|',2);
        SET @id_permits = SPLIT_STR_PARAM(data_value,'|+|',3);
		
        SET @iterator = 1;
		SET @id_position = SPLIT_STR_PARAM(@all_id_positions,'|-|',@iterator);

		WHILE @id_position DO
            INSERT INTO pages_position_permits
			(id_page,
			id_position,
			id_permits,
			id_creator,
			dt_creator,
			id_last_modifier,
			dt_last_modifier)
			VALUES
			(@id_page,
			@id_position,
			@id_permits,
			id_modifier,
			NOW(),
			id_modifier,
			NOW());
            SET @iterator = @iterator + 1;
            SET @id_position = SPLIT_STR_PARAM(@all_id_positions,'|-|',@iterator);
		END WHILE;
		
	WHEN case_type = SET_SECTION_EMPLOYEE THEN  # Set permits to the section per employee
        SET @id_section = SPLIT_STR_PARAM(data_value,'|+|',1);
        SET @all_id_employees = SPLIT_STR_PARAM(data_value,'|+|',2);
        SET @id_permits = SPLIT_STR_PARAM(data_value,'|+|',3);
		
        SET @iterator = 1;
		SET @id_employee = SPLIT_STR_PARAM(@all_id_employees,'|-|',@iterator);

		WHILE @id_employee DO
            INSERT INTO sections_employee_permits
			(id_section,
			id_employee,
			id_permits,
			id_creator,
			dt_creator,
			id_last_modifier,
			dt_last_modifier)
			VALUES
			(@id_section,
			@id_employee,
			@id_permits,
			id_modifier,
			NOW(),
			id_modifier,
			NOW());
            SET @iterator = @iterator + 1;
            SET @id_employee = SPLIT_STR_PARAM(@all_id_employees,'|-|',@iterator);
		END WHILE;
        
	WHEN case_type = SET_SECTION_POSITION THEN # Set permits to the section per position
        SET @id_section = SPLIT_STR_PARAM(data_value,'|+|',1);
        SET @all_id_positions = SPLIT_STR_PARAM(data_value,'|+|',2);
        SET @id_permits = SPLIT_STR_PARAM(data_value,'|+|',3);
		
        SET @iterator = 1;
		SET @id_position = SPLIT_STR_PARAM(@all_id_positions,'|-|',@iterator);

		WHILE @id_position DO
            INSERT INTO sections_position_permits
			(id_section,
			id_position,
			id_permits,
			id_creator,
			dt_creator,
			id_last_modifier,
			dt_last_modifier)
			VALUES
			(@id_section,
			@id_position,
			@id_permits,
			id_modifier,
			NOW(),
			id_modifier,
			NOW());
            SET @iterator = @iterator + 1;
            SET @id_position = SPLIT_STR_PARAM(@all_id_positions,'|-|',@iterator);
		END WHILE;

#---------------------------------------------------------------MODIFY PERMITS
	WHEN case_type = MODIFY_PAGE_EMPLOYEE THEN #Modify the employee's permission to a page
        SET @id_page = ID_PAGE_GET(SPLIT_STR_PARAM(data_value,"|-|",1));
        SET @id_employee = SPLIT_STR_PARAM(data_value,"|-|",2);
        SET @news_permits = SPLIT_STR_PARAM(data_value,"|-|",3);
        
		UPDATE pages_employee_permits 
		SET 
		id_permits = @news_permits, 
        id_last_modifier = id_modifier, 
        dt_last_modifier = NOW()
		WHERE id_page = @id_page and id_employee = @id_employee;

	WHEN case_type = MODIFY_PAGE_POSITION THEN #Modify the position's permission to a page
		SET @id_page = ID_PAGE_GET(SPLIT_STR_PARAM(data_value,"|-|",1));
        SET @id_position = SPLIT_STR_PARAM(data_value,"|-|",2);
        SET @news_permits = SPLIT_STR_PARAM(data_value,"|-|",3);

		UPDATE pages_position_permits 
		SET 
		id_permits = @news_permits, 
        id_last_modifier = id_modifier, 
        dt_last_modifier = NOW()
		WHERE id_page = @id_page and id_position = @id_position;
        
	WHEN case_type = MODIFY_SECTION_EMPLOYEE THEN #Modify the employee's permission to a section
        SET @id_section = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @id_employee = SPLIT_STR_PARAM(data_value,"|-|",2);
        SET @news_permits = SPLIT_STR_PARAM(data_value,"|-|",3);

		UPDATE sections_employee_permits 
		SET 
		id_permits = @news_permits, 
        id_last_modifier = id_modifier, 
        dt_last_modifier = NOW() 
		WHERE id_section= @id_section and id_employee = @id_employee;

	WHEN case_type = MODIFY_SECTION_POSITION THEN #Modify the position's permission to a section
		SET @id_section = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @id_position = SPLIT_STR_PARAM(data_value,"|-|",2);
        SET @news_permits = SPLIT_STR_PARAM(data_value,"|-|",3);

		UPDATE sections_position_permits 
		SET 
		id_permits = @news_permits, 
        id_last_modifier = id_modifier, 
        dt_last_modifier = NOW() 
		WHERE id_section= @id_section and id_position = @id_position;

#---------------------------------------------------------------DELETE PERMITS
	WHEN case_type = DELETE_PAGE_EMPLOYEE THEN # Eliminate employee permits on page  
        SET @id_page = ID_PAGE_GET(SPLIT_STR_PARAM(data_value,"|-|",1));
        SET @id_employee = SPLIT_STR_PARAM(data_value,"|-|",2);

		DELETE FROM pages_employee_permits
		WHERE id_page = @id_page and id_employee = @id_employee;
        
	WHEN case_type = DELETE_PAGE_POSITION THEN # Eliminate position permits on page 
		SET @id_page = ID_PAGE_GET(SPLIT_STR_PARAM(data_value,"|-|",1));
        SET @id_position = SPLIT_STR_PARAM(data_value,"|-|",2);

		DELETE FROM pages_position_permits
		WHERE id_page = @id_page and id_position = @id_position;

	WHEN case_type = DELETE_SECTION_EMPLOYEE THEN #Eliminate employee permits on section
        SET @id_section = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @id_employee = SPLIT_STR_PARAM(data_value,"|-|",2);

		DELETE FROM sections_employee_permits 
		WHERE id_section = @id_section and id_employee = @id_employee;
        
	WHEN case_type = DELETE_SECTION_POSITION THEN #MEliminate position permits on section
		SET @id_section = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @id_position = SPLIT_STR_PARAM(data_value,"|-|",2);

		DELETE FROM sections_position_permits
		WHERE id_section = @id_section and id_position = @id_position;
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

-- Dump completed on 2018-02-08 14:55:50
