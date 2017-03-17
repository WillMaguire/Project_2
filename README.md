Concept

Childcare is one of the greatest hurdles parents face when returning to the workplace; costs, location, limitied curricula, minimal child to carer interaction and a serious lack of chocies motivated me to find a versatile, affordable, socialy driven and user friendly alternative allowing parents to feel secure in the knowledge that they are paying a fair price for a product they can monitor.  ShareAupair will allow parents to connect with each other and with skilled independant childcare workers to maintain a small scale communal aupair supervised creche in their own homes.  ShareAupair will also provide a range of early childhood eucation resourcs and support methods to ensure that children, parents and carers are never left wanting.  

Plan and Approach

Overview

This project was never intended to be a market ready product, but was rather developed as a minimal resource interactive concept brief designed to demonstrate the viability and accessibiltiy of the product.

Integration of the full range of desired social media and location based APIs was not going to be possible in the available timeframe and as such I focused on creating a workable demonstration of the product which would be able to illustrate the  potential of the concept.   Diving into social media API integration is not desireable without a solid business developemnt model in place.  

Core Features

Considering the intent of the project the core features are relativly straight forward:

Allow parents to create a profile
Allow carers to create a profile
Allow parents to search for carers and parents in their area
View contact details of carers and parents in their area

User Workflow

With the core features, i also came up with a simple workflow to determine the types of web pages i would need. Untitled_Diagram

Sinatra Paths

I proceed to draft out the sinatra paths of the web pages.


Finally i drafted a simple layout that will be used for all the pages in the web app. fantasy_not_signed_in
online uploader
fantasy_logged_in


Technologies Used

Front End

HTML,CSS,Bootstrap library for majority of presentation, layout.
Some javascript and jquery to handle dynamic changes in presentation data to user.
Back End



Ruby
Gem Used	Used For
Sinatra	Web Framework
Bcrypt	Encrypt password and authenticate
Httparty	connect to API and retrieve data
ActiveRecord	access to database and provide ORM platform
Database

PostgreSQL
Installation

I packaged my web app using the bundle install command which installs all the gems required for my app and bundled it as a whole.Then i deployed the app to heroku by creating a heroku app from console then pushed my bundled app to the heroku container. I proceeded to create my tables by inserting SQL commands from the heroku PG:PSQL command. Finally the app is then online and available for end users.

Unsolved Problems / Incomplete Features

Haven't completed javascript feature to calculate bet returns (stake amount * odds) and display to user.
Haven't completed password change in main.rb
Lack of client and server side form data validations
Haven't found a free-to-use sportsbet API that delivers game schedules, odds and results.
Therefore not able to determine the Game outcome and subsequently bet outcomes.
"Ideal" Features

Create "League" class which will be able to categorize games into "Real Games" and "Fantasy League"
Create "Teams" class which will have "Real Teams" and "Fantasy Teams"
Create "Players" class which will have active players in the league and retired players that will contain attributes and statlines
Add simulating feature which will simulate matches at a set interval where "users" can bet on games where simulation has not run yet.
Project Live Link

https://thawing-crag-52192.herokuapp.com/
Contact GitHub API Training Shop Blog About
© 2017 GitHub, Inc. Terms Privacy Security Status Help
