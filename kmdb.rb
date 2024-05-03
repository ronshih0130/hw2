# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Role.destroy_all
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Execute below on terminal:
# rails generate model Studio name:string
# rails generate model Movie title:string year_released:integer rated:string studio:references
# rails generate model Actor name:string
# rails generate model Role movie:references actor:references character_name:string
# rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

##I use function find_or_create_by instead of save - hope it't okay!
# Find or create the studio
studio_warner_bros = Studio.find_or_create_by(name: 'Warner Bros.')

# Create movies
batman_begins = Movie.find_or_create_by(title: 'Batman Begins', year_released: 2005, rated: 'PG-13', studio: studio_warner_bros)
the_dark_knight = Movie.find_or_create_by(title: 'The Dark Knight', year_released: 2008, rated: 'PG-13', studio: studio_warner_bros)
the_dark_knight_rises = Movie.find_or_create_by(title: 'The Dark Knight Rises', year_released: 2012, rated: 'PG-13', studio: studio_warner_bros)

# Create actors
christian_bale = Actor.find_or_create_by(name: 'Christian Bale')
michael_caine = Actor.find_or_create_by(name: 'Michael Caine')
liam_neeson = Actor.find_or_create_by(name: 'Liam Neeson')
katie_holmes = Actor.find_or_create_by(name: 'Katie Holmes')
gary_oldman = Actor.find_or_create_by(name: 'Gary Oldman')
heath_ledger = Actor.find_or_create_by(name: 'Heath Ledger')
aaron_eckhart = Actor.find_or_create_by(name: 'Aaron Eckhart')
maggie_gyllenhaal = Actor.find_or_create_by(name: 'Maggie Gyllenhaal')
tom_hardy = Actor.find_or_create_by(name: 'Tom Hardy')
joseph_gordon_levitt = Actor.find_or_create_by(name: 'Joseph Gordon-Levitt')
anne_hathaway = Actor.find_or_create_by(name: 'Anne Hathaway')

# Assign roles to movies
Role.find_or_create_by(movie: batman_begins, actor: christian_bale, character_name: 'Bruce Wayne')
Role.find_or_create_by(movie: batman_begins, actor: michael_caine, character_name: 'Alfred')
Role.find_or_create_by(movie: batman_begins, actor: liam_neeson, character_name: "Ra's Al Ghul")
Role.find_or_create_by(movie: batman_begins, actor: katie_holmes, character_name: 'Rachel Dawes')
Role.find_or_create_by(movie: batman_begins, actor: gary_oldman, character_name: 'Commissioner Gordon')

Role.find_or_create_by(movie: the_dark_knight, actor: christian_bale, character_name: 'Bruce Wayne')
Role.find_or_create_by(movie: the_dark_knight, actor: heath_ledger, character_name: 'Joker')
Role.find_or_create_by(movie: the_dark_knight, actor: aaron_eckhart, character_name: 'Harvey Dent')
Role.find_or_create_by(movie: the_dark_knight, actor: michael_caine, character_name: 'Alfred')
Role.find_or_create_by(movie: the_dark_knight, actor: maggie_gyllenhaal, character_name: 'Rachel Dawes')

Role.find_or_create_by(movie: the_dark_knight_rises, actor: christian_bale, character_name: 'Bruce Wayne')
Role.find_or_create_by(movie: the_dark_knight_rises, actor: gary_oldman, character_name: 'Commissioner Gordon')
Role.find_or_create_by(movie: the_dark_knight_rises, actor: tom_hardy, character_name: 'Bane')
Role.find_or_create_by(movie: the_dark_knight_rises, actor: joseph_gordon_levitt, character_name: 'John Blake')
Role.find_or_create_by(movie: the_dark_knight_rises, actor: anne_hathaway, character_name: 'Selina Kyle')



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.includes(:studio).all
movies.each do |movie|
  puts "#{movie.title.ljust(25)} #{movie.year_released.to_s.ljust(15)} #{movie.rated.ljust(10)} #{movie.studio.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
roles = Role.includes(:movie, :actor).all
roles.each do |role|
  puts "#{role.movie.title.ljust(25)} #{role.actor.name.ljust(20)} #{role.character_name}"
end
