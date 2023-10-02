-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: movie_magnet
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for actor',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT 'Name of actor',
  `birthdate` date NOT NULL COMMENT 'Birthdate of actor',
  `biography` text NOT NULL COMMENT 'Biography of actor',
  `profile_picture_url` varchar(100) NOT NULL DEFAULT '' COMMENT 'Profile picture url of actor',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) COMMENT='Actor detail who will act in movies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for director record.',
  `name` varchar(200) NOT NULL COMMENT 'Name of director',
  `birthdate` date NOT NULL COMMENT 'Birthdate of director',
  `biography` text NOT NULL COMMENT 'Biography of director',
  `profile_picture_url` varchar(200) NOT NULL COMMENT 'Profile picture url of director.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) COMMENT='Table to store directors details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'2023.10.01.11.04','initial db','SQL','V2023.10.01.11.04__initial_db.sql',1635152749,'root','2023-10-01 08:36:15',283,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the table',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Genre name',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated',
  PRIMARY KEY (`id`)
) COMMENT='Table to store genre list available in system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actors`
--

DROP TABLE IF EXISTS `movie_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_actors` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key of record',
  `movie_id` int NOT NULL COMMENT 'Movie in which actor is acted.',
  `actor_id` int NOT NULL COMMENT 'Actor who acted in movie',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_id_UNIQUE` (`movie_id`,`actor_id`),
  KEY `fk_movie_actor_x_actors_idx` (`actor_id`),
  CONSTRAINT `fk_movie_actor_x_actors` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  CONSTRAINT `fk_movie_actor_x_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) COMMENT='Table to store relation of movies and actors.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actors`
--

LOCK TABLES `movie_actors` WRITE;
/*!40000 ALTER TABLE `movie_actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_directors`
--

DROP TABLE IF EXISTS `movie_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_directors` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record.',
  `movie_id` int NOT NULL COMMENT 'Movie that is directed by director.',
  `director_id` int NOT NULL COMMENT 'Director who directed the movie.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_id_director_id_UNIQUE` (`movie_id`,`director_id`),
  KEY `fk_movie_directors_x_director_id_idx` (`director_id`),
  CONSTRAINT `fk_movie_directors_x_director_id` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`),
  CONSTRAINT `fk_movie_directors_x_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) COMMENT='Table for relation of movies with directors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_directors`
--

LOCK TABLES `movie_directors` WRITE;
/*!40000 ALTER TABLE `movie_directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record',
  `genre_id` int NOT NULL,
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT 'Title of movie',
  `release_date` date NOT NULL COMMENT 'Release date of movie',
  `director` varchar(500) NOT NULL DEFAULT '' COMMENT 'Director of movie',
  `duration` int NOT NULL DEFAULT '0' COMMENT 'Duration of movie in minutes',
  `description` text NOT NULL COMMENT 'Description of movie',
  `cover_image_url` varchar(500) NOT NULL DEFAULT '' COMMENT 'Url of cover image',
  `trailer_url` varchar(500) NOT NULL DEFAULT '' COMMENT 'Movie trailer image/video url',
  `average_user_rating` float NOT NULL DEFAULT '0' COMMENT 'Average user rating of movie.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  KEY `fk_movies_x_genre_id_idx` (`genre_id`),
  CONSTRAINT `fk_movies_x_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) COMMENT='Table to store movie details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record',
  `movie_id` int NOT NULL COMMENT 'Movie for which review is saved',
  `user_id` int NOT NULL COMMENT 'User who have provided the review.',
  `review_text` text NOT NULL COMMENT 'Review text provided by user.',
  `rating` int NOT NULL COMMENT 'Rating provided by user.',
  `review_date` date NOT NULL COMMENT 'Review date when user given the review.',
  `created_at` timestamp NOT NULL COMMENT 'Date time when record is created',
  `updated_at` timestamp NOT NULL COMMENT 'Date time when review is updated.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_id_user_id_UNIQUE` (`movie_id`,`user_id`),
  KEY `fk_review_x_user_id_idx` (`user_id`),
  CONSTRAINT `fk_review_x_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `fk_review_x_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) COMMENT='Table contains review details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorites`
--

DROP TABLE IF EXISTS `user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorites` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record',
  `user_id` int NOT NULL COMMENT 'User id from user table',
  `movie_id` int NOT NULL COMMENT 'Favorite movie id of user.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_movie_id_UNIQUE` (`user_id`,`movie_id`),
  KEY `fk_user_favorite_x_movie` (`movie_id`),
  CONSTRAINT `fk_user_favorite_x_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `fk_user_favorite_x_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record.',
  `username` varchar(500) NOT NULL DEFAULT '' COMMENT 'Username for user.',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT 'Email id of user.',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT 'Password of user.',
  `profile_picture_url` varchar(200) NOT NULL DEFAULT '' COMMENT 'Profile picture url',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) COMMENT='Table to store user details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlists`
--

DROP TABLE IF EXISTS `watchlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlists` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for watch list.',
  `movie_id` int NOT NULL COMMENT 'Movie that user wish to watch in future.',
  `user_id` int NOT NULL COMMENT 'User who want to watch movie in future.',
  `date_added` date NOT NULL COMMENT 'Date when user entered his watch list.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_id_user_id_UNIQUE` (`movie_id`,`user_id`)
) COMMENT='Table to store the list of movie that user can watch in future.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlists`
--

LOCK TABLES `watchlists` WRITE;
/*!40000 ALTER TABLE `watchlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-01 14:48:52
