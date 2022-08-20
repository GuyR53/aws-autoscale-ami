## Set Up a new Nodejs service

### OVERVIEW
We have a new server type that will serve our web clients. This service is implemented in Nodejs and will run in the N. Virginia AWS.  The project will run on Ubuntu’s latest version.
### GOALS
 1. Stability(HA)
 2. Easy scaling(out/up) 
 3. Monitoring
 4. Security

### SPECIFICATIONS
1. AWS access - Create a free AWS account with your own email address.
2. In the project, we must have at least  two instances (t2.micro), behind internet LBת Each instance must have Nginx as it’s frontend and pass the requests to backend Nodejs
3. Nodejs code is located on s3://moovit.dev/ - public bucket
4. Nginx will listen on port 80
5. Nginx logs must have an additional partition of 20GB mounted under  /vlog/
6. Nodejs will run on port 8000
7. Use PM2 to run Node code, server.js is the main script
8. Create a cronjob that will call the API and report the value as a custom metric to DataDog(trial account):
        HTTP location  /api/metric
        Values 1 - 100

### MILESTONES
1. Setup a single instance
2. Try accessing the instance on the HTTP port and getting a response, {"hostname":"hostname","seed":0.36080578855760237}. Also, check if you are getting the metric.
3. Add another instance and LB	
4. Use an AMI of the first instance to launch any additional instances as spots. Access via the public hostname of the ELB to port 80 and get some type of response but with a different hostname.

### Maintenance tasks:
1. Create logrotate for Nginx logs
2. Restrict access and secure the environment
3. Bonus - There is a typo in the Nodejs code. The code has an extra object, eliminating the typo.
