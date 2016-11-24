# README

TaxiApp with carrierwave for picture uploads, and devise for security.

Requirements (complete):
* Allow users to sign up as a customer or a taxi driver
* Allow taxi drivers to upload portraits and a picture of their car, car registration
* Allow customers to upload a picture, and a mobile number
* Taxi driver can create a new job for a customer
* Have a 'dispatcher' role to create the jobs

Requirements (ongoing / todo):
* Allow taxi driver to notify customer when they have arrived
* Show map of area and allow taxi driver to mark a pin where they are which the customer can see
* Use http://www.gimbal.com/ as a beacon and geofence solution 

TODO
* Validate email / phone number / postcode fields
* Make some parameters mandatory
* Validate that you can't create two profiles!
* Fix driver edit so car pic shows immediately when dropdown is selected
* Fix camel case in select 
* Remove unused role column from user
* Should login go to profile page?
* Only dispatcher and admin should be able to edit job
* Taxi drivers should be able to edit their own job but no one else's
* Add Last names to profile references in job customer / driver dropdown
* Change tab order in profile edit, should do names before address bits
* Don't include /public/uploads in git
* Use variables for CSS colours and pixel sizes
* Testing!

Done (previous TODOs)
* Is user reference correct in the profiles_controller?
* Logout stopped working!!
* Switch to postgres for heroku
* Modify role enum to have default value 0
* Remove numbers from profile URLs
* Fix edit pages so that pics already loaded are visible
* Make status editable from jobs index view / individual job view
* Customers should not be able to view jobs
* Is there a way to navigate from job -> customer so we don't need .find in the jobs index page?
* Increase size of fa icons
* Make pages responsive / overflow
* Jobs / bookings page gives error if you have no profile

Error messages
535-5.7.8 Username and Password not accepted. Learn more at
