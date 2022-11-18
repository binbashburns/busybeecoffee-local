# Busy Bee Coffee Web Store - Locally Hosted
## About
This is a sample website built on Docker containers with PHP, CSS, HTML, and a MySQL database backend!</br>
I started this out as a project that would be hosted in AWS that featured a full CI/CD pipeline, ECS, and more.</br>
Only so much you can do in a time crunch, I suppose.</br>
Anyway, install the dependencies, then scoot down to `Instructions for Creating the Website Locally`.

## Dependencies
- Ensure Docker Desktop is installed, and started. (https://www.docker.com/products/docker-desktop/)
- Alternatively, just make sure Docker and Docker Compose are installed. ()
- Ensure MySQLWorkbench is installed, and started. (https://www.mysql.com/products/workbench/)
- Ensure Git is installed on your local machine: (https://git-scm.com/downloads)

## Instructions for Creating the Website Locally
As mentioned previously, the original intent of this project was to spin up the Docker instances in the cloud.</br>
Since I was not able to complete this objective, here are the instructions on creating the PHP website and MySQL database locally as a proof-of-concept:</br>
- Clone this repository to your local machine: `git clone https://github.com/binbashburns/busybeecoffee-local.git`
- Move into the directory: `cd busybeecoffee-local`
- Build the Docker container images: `docker-compose up --detach`
- Access http://localhost/ in a web browser.
- Once you're done browsing the website, tear everything doWn: `docker-compose down`

## Database and Default Credentials
- A MySQL 8.0 container will be spun up as a database backend for the PHP/HTML/Apache web application.
- The default credentials for the database are defined in `docker-compose.yml`. You can modify them however you would like, but the default credentials are as follows:
- Root Account: `root`
- Root Account Password: `super-secret-password`
- Database Name: `busybee-db`

## Diagrams
A few diagrams have been created to accompany this project, and are located in the `diagrams` directory of this GitHub repository:
- `busybee-erd.pdf`: Database Entity Relationship Diagram
- `busybee-app-logic.pdf`: A simple diagram showing the two Docker containers and the application logic from Web Browser to the database.

## Resources:
- PHP-Apache Docker Container for hosting and running the website
- MySQL Docker Container for the database backend that the website interacts with

## References used:
PHP, MySQL, & JavaScript Book: https://www.oreilly.com/library/view/learning-php-mysql/9781491979075/ </br>
Website Template: https://htmlcodex.com/ </br>
Embedded PHP/MySQL Queries: https://www.mysqltutorial.org/php-querying-data-from-mysql-table/ </br>
More than Certified in Docker: https://morethancertified.com/course-resources/more-than-certified-in-docker/ </br>
