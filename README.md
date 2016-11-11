# README

TaxiApp with carrierwave for picture uploads, and devise for security.

TODO
* Validate email / phone number / postcode fields
* Make some parameters mandatory
* Validate that you can't create two profiles!
* Modify role enum to have default value 0
* Fix driver edit so car pic shows immediately when dropdown is selected
* Fix camel case in select 
* Fix edit pages so that pics already loaded are visible
* Remove unused role column from user
* Remove numbers from profile URLs
* Should login go to profile page?
* Make pages responsive / overflow?
* Only dispatcher and admin should be able to edit jobs
* Customers should not be able to view jobs
* Add Last names to job profile references 
* Make status editable from jobs index view / individual job view

Done
* Is user reference correct in the profiles_controller?
* Logout stopped working!!
* Switch to postgres for heroku
