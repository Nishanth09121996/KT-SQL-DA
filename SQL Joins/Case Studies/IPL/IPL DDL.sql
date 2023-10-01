CREATE DATABASE  IF NOT EXISTS ipl;
USE ipl;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ipl1
-- ------------------------------------------------------
-- Server version	8.0.34


--
-- Table structure for table ipl_matches
--

DROP TABLE IF EXISTS ipl_matches;
CREATE TABLE ipl_matches (
  id bigint DEFAULT NULL,
  city text,
  date text,
  toss_decision text,
  result text,
  dl_applied bigint DEFAULT NULL,
  win_by_runs bigint DEFAULT NULL,
  win_by_wickets bigint DEFAULT NULL,
  team1_id bigint DEFAULT NULL,
  team2_id bigint DEFAULT NULL,
  winner_id bigint DEFAULT NULL,
  toss_winner_id bigint DEFAULT NULL,
  venue_id bigint DEFAULT NULL,
  season_id bigint DEFAULT NULL,
  umpire1_id bigint DEFAULT NULL,
  umpire2_id bigint DEFAULT NULL,
  player_of_match_id bigint DEFAULT NULL
);

--
-- Table structure for table players
--

DROP TABLE IF EXISTS players;
CREATE TABLE players (
  id bigint NOT NULL,
  Player_Name text,
  DOB text,
  Batting_Hand text,
  Bowling_Skill text,
  Country text
);

--
-- Table structure for table seasons
--

DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons (
  id bigint NOT NULL,
  name text
);

--
-- Table structure for table teams
--

DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
  id bigint NOT NULL,
  name text
);

--
-- Table structure for table umpires
--

DROP TABLE IF EXISTS umpires;
CREATE TABLE umpires (
  id bigint NOT NULL,
  name text
);

--
-- Table structure for table venues
--

DROP TABLE IF EXISTS venues;
CREATE TABLE venues (
  id bigint NOT NULL,
  name text
);


-- Dump completed on 2023-08-05 16:10:41
