# CityBike Analytics

## Description

CityBike Analytics allows users to access a plethora of interesting facts and statistics about CitiBike--NYC’s popular bike share service--via the command line.  Drawing from CitiBike’s official monthly dataset covering all rides taken throughout the five boroughs, CityBike Analytics lets users create customizable queries regarding CitiBike’s Stations, Trips, Bikes, and Users.  This version of Citybike Analytics is set up to draw from the official September 2017 data.   

## Features

Citybike Analytics first shows the user interesting facts about all of the rides taken in September 2017.  It then lets the user view further stats about Stations (e.g., most popular starting station), Trips (e.g., longest trip), and Bikes (e.g., the bike with the most trips).  For many queries, users can then further refine the query by user type (e.g., most popular starting station for female/male riders or non-subscribers).  

## Installation

Installation is a bit tricky because CitiBike's .csv files are too large to host on GitHub.  First, clone this repo.  Then, download the September 2017 .csv file from https://s3.amazonaws.com/tripdata/201709-citibike-tripdata.csv.zip, extract it and place it in the /db folder.  Then, seed the database by running 'rake db:seed' from the console.  WARNING: The .csv files are huge, and seeding the database will take at least a few hours.  We've written this code to only seed the database with the first 150k trips in September 2017.

Once the database is seeded, run the program by typing 'ruby bin/run.rb' from the top-level directory.  You may need to install gems via "bundle install," and you may also need to prepend 'bundle exec ruby bin/run.rb'

## Contributor Guide

Citybike Analytics is easily customizable.

### Change Month

The database can be seeded with any month's data (provided that the columns are the same as the 9/2017 data) by downloading a different .csv file from the CitiBike website at https://s3.amazonaws.com/tripdata/index.html.  The .csv file should be extracted into the /db folder.  The db/seed.rb file must also be updated with the new file name by editing the path in the line that begins with: 'CSV.foreach("db/201709-citibike-tripdata.csv")'.  Then, from the command line in the top-level directory, run 'rake db:seed.'  

### Add Queries

You can write your own Active Record queries to ask interesting questions of your own! Follow the examples in the code to see how to construct your own queries, and try them out in the command line by running 'rake console'.  We recommend adding new methods to the appropriate method module (e.g., lib/station_methods.rb).  Most queries will need to interact with the 'trips' table at some point, which holds much of the data about each trip, and which relates to the stations and bikes tables.

Then, edit the command-line prompts as appropriate to add new options.  The top level prompt is in 'bin/cli.rb'.  The sub-prompts for Trips, Stations, and Bikes are in the respective '...methods.rb' modules. Then, call the new method you wrote if the user chooses your option.

You can use the built-in filtering method for gender, etc., by calling the 'demo_filter' method, as we’ve done in many of the methods.            

## Disclaimer

This program is not affiliated with or sponsored by CitiBike or its owners or sponsors.  The data are used under the terms of the CitiBike Data License Agreement, available at https://www.citibikenyc.com/data-sharing-policy
