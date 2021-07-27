# CI-CD Pipeline for Springboot based Petclinic Application

![1 1](https://user-images.githubusercontent.com/84190111/127105410-ccc2e111-4fe3-459a-9b78-b41cdf29994e.png)

## About
Petclinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/). 
This is what the End Application would look like.
![2 1](https://user-images.githubusercontent.com/84190111/127105693-fc3ca271-9a1f-48dc-898e-d79564d64231.png)


## The PIPELINE
I have created a Continuous Integration and Continuous Delivery Pipeline using the  tools 

1. Git - Source Code Management
2. AWS -  For Jenkins, Nexus, Sonarqube and Dockerhost Servers
3. Jenkins - Continuous Integration Tool
4. Maven - Build Tool
5. Nexus - Artifact Repository
6. Sonarqube - Code Analysis
7. Docker - Containerization

## The PIPELINE - FLOW

This is flow of the Pipeline. Jenkins, Sonarqube and Nexus comprises the CI part, Deploying application on Dockerhost comprises the CD part.

![5 1](https://user-images.githubusercontent.com/84190111/127106959-4d0405f8-4bf4-4d81-ae5f-ae512995fc88.png)

## End Goal

Developers will make changes in the source code. New commits will trigger Jenkins Build Job and will trigger all the subsequent Jobs. The changes will be reflected in the application as soon as the Jenkins Jobs have completed Buiding.

## Step-by-step Setup and Execution

CONTINUOUS INTEGRATION:

1. Setup Jenkins, Nexus, Sonarqube on AWS EC2 using shell scripts.(Please find the userdata scripts in the userdata folder).
2. Do further configuration of Jenkins, Nexus, and Sonarqube servers. Install necessary plugins in Jenkins. Create users in Nexus and Sonarqube. Create repositories in Nexus.
3. Create Jobs in Jenkins.
    1. Build Job - This Job will pull the source code from GIT and build it using Maven. It will generate a jar file.
    2. Test Job - To do unit testing.
    3. Integration Test Job - To do the integration testings.
    4. Sonarqube-Code-Analysis - This job will perform the Code Analysis and publish Result on sonarqube server.
    5. Deploy artifact to Nexus - This job will publish the artifact on Nexus Server.

Each job will start only if the previous job was successful.

CONTINUOUS DELIVERY:

4. Setup a Docker host on EC2 server.  
5. Write Dockerfile and docker-compose files in Docker host.
6. Create Job in Jenkins to build image and run the docker-compose file. This will bring up the application stack.

NOTE: In its default configuration, Petclinic uses an in-memory database (H2) which gets populated at startup with data. To have persistent data, I have used MySql database. Refer the docker-compose and Dockerfile to setup your Frontend Application and Link it with MySql Database. 

## Future Scopes

![8 1](https://user-images.githubusercontent.com/84190111/127109361-204ec591-bf15-4649-b6a5-15dcbbad1458.png)

![9 1](https://user-images.githubusercontent.com/84190111/127109479-49e2ecd1-92f0-4296-9376-534b39e86f00.png)

## THE END
