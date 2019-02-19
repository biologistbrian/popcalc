# README

This trait introgression population calculator utilizes project information organized in a front end ruby on rails application to fire off an R script to calculate what a backcross breeding program should look like in terms of population sizes to achieve the outcomes established and defined in the Ruby webapp.

The app itself sits in AWS with an elastic beanstalk configuration - EC2 instance, Postgres RDS, autoscaling, etc.

If you clone this repo and expect to run the application locally, you'll need the correct version of ruby, rails and R installed on your machine.  Check the gemlock for version control.

It can be found here:
* http://popcalc-prod.m3rcr6tzqx.us-west-2.elasticbeanstalk.com/