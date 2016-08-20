# Swiss Tournament Planner

## Introduction
This is a project for my Udacity Intro to Programming Nanodegree. It is a  Swiss style tournament. A summary of the task is to write a Python module that uses a PostgreSQL database to keep track of players and matches in a game tournament.

The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and
each player should be paired with another player with the same number of wins, or as close as possible.

This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it.

## Getting started

Tournament code and test code are in Python. The database is in PostgreSQL.

### Vagrant VM and Virtual Box
* This project uses Vagrant Virtual Machine (VM) and Virtual Box
* Vagrant VM has PostgreSQL installed and configured, as well as the psql command line interface (CLI)

### Database
* Load Terminal and `cd` to folder where Vagrant is located.
* Fire up Vagrant `vagrant up` and when the prompt reappears `vagrant ssh` to log in
* To connect first `psql` then connect to the tournament db `\c tournament`
* If the db does not yet exist, create the db `CREATE DATABASE tournament` and to build the db with tables and views import the .sql file `\i tournament.sql`

### Python Tournament
* Load a new Terminal and `cd` to folder where Vagrant is located.
* Fire up Vagrant `vagrant up` and when the prompt reappears `vagrant ssh`
* Change directory to the tournament folder `cd /vagrant/tournament` and then `psql`
* To run the tournament test code type `python tournament_test.py`

## Usage examples
* Swiss style tournament with a few limitations:
  * Only allows even number of players
  * Games either won or lost, no draws
  * Does not prevent rematches between players
  * Only one tournament can be played, after player and match data must be deleted before a new tournament can be played
