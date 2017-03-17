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

User interaction is designed to be very simple and direct: users are greeted by a reactive navigation bar that directs them to an Abot Page(unfinished at deployment), a sign in portal or a sign up portal.

The sign in portal accepts an email and password an directs the user to their profile page(cleint or carer)

The sign up portal offers a choice between signing up as a client or as a carer: the sign up portal accepts a name, email, mobile number and passsword. Once accepted the portal rediects to the respective Profile page

On the profile page users are able to select the 'Edit" option and will be directed to an edit page which allows them to fill a variety of fields including street address, postcode, suburb, children, age of children(indicated by a checkbox defined range) as well as a biography and a checkbox indicating their interest in hosting childcare creches at their home(for future features)

Technologies Used

Front End

HTML,CSS,

Back End

Ruby: Gems Used
  Sinatra -	Web Framework
  Bcrypt -	Encrypt password and authenticate
  ActiveRecord -	access to database and provide ORM platform
  
  
Database

PostgreSQL
Installation

The web app was packaged using the bundler; it was then deployed to heroku. Tables were dumped from my local database and used to overwrite the existing heroku tables. The app went online and is available to end users.

Unsolved Problems / Incomplete Features

Haven't touched javascript features;these will focus primarily on social media APIs, Google Map in app navigation integration, adding dynamic education resource content and adding a more reactive GUI(replace checkboxes,etc).
Haven't completed password change in main.rb
Lack of meanigful client and server side data validations; although some exist for location matching they are rudimentry. 
Client to Client searching is not active; 'get' and 'post' requests needed in main.rb.
Location matching is not extensive enough: the planned priority based listing system is yet to be coded.
Auto-complete of postcodes, suburbs and regions usind "Locations" SQL is yet to be implemented.
Further CSS styling and images to be added to front end, including .
Facbook login to be added.

"Ideal" Features

Create comprehensive education resource database including offsite links and partners(database to be hosted)
Create comprehensive client/client and client/carer location based matching system including matching by desired education outcoms, child ages, ability to host, daily travel pathing, budget, etc...(API TBD)
Integreated realtime calander based availability matching(API TBD).
More features as project budget develops.

Project Live Link

https://whispering-dusk-12663.herokuapp.com/
Contact GitHub API Training Shop Blog About
© 2017 GitHub, Inc. Terms Privacy Security Status Help
