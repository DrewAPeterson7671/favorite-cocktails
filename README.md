# _Cocktails_

#### _Application to search and save coctail recipes, 8/5/2021_

#### By _**Drew Peterson**_

## Description

_This application:_

* Created to consume a cocktail recipe API and save the search results for later easy reference.


_Website:_

* http://mycocktails.devmojo.org/

## Setup/Installation Requirements

* Requires Ruby 2.6.5, Rails 5.2.4 and PostgresQL. 
* Clone the project locally from github.
* Install Bundler to your environment if you do not already have it.
* Run bundle install to manage gems; if you make additional changes to the Gemfile, you will need to run this command again.
* DATABASE INSTRUCTIONS - from terminal in the the root directory of this project, run these commands:
*   rake db:create
*   rake db:migrate
* Product environment Active Storage requires configuration of AWS S3.  Development environment will store content locally.
* Open a terminal and type "rails s"
* Open a web browser to https://localhost:3000.

## Known Bugs

_The web page will show sercurity warnings because it does not have an SSL Certificate.  Heroku Free Dynos do not currently support SSL Certificates and there is no current budget to support paid dynos._

_This site is hosted on the free Heroku service, so the dynos that run it go to sleep until the site is accessed.  So the first load is slower than when the dyno awakens.  This isn't a bug as much as a budget constraint._

## Support and contact details

_Please contact me directly via email at drew.a.peterson@hotmail.com with any bug reports, questions, critique, or for any reason._

## Technologies Used

_Ruby 2.6.5, Rails 5.2.6, Postgres SQL, Heroku, AWS S3, Rails Active Storage, Ajax, Javascript, SCSS, HTTParty, Bootstrap, Sendgrid._

### License

*GPL*



Copyright (c) 2021 **_Drew Peterson_**

