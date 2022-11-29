# Data-Dedeuplication-Hybrid-Cloud

Requirements to run the Project:
1. Intellij IDE or Eclipse IDE.
2. JDK(openjdk 16.0.2 2021-07-20)
3. MySQL(version 8.0.31)
4. Tomcat(version apache-tomcat-9.0.69)
6. Maven jars(commons.fileupload, commons.io, Java EE 6-Java EE 6, javax.xml.bind.jaxb.api, Maven: javax.servlet:javax.servlet-api:4.0.1, Maven: mysql:mysql-connector-java:5.1.49, Maven: org.apiguardian:apiguardian-api:1.1.0, Maven: org.junit.jupiter:junit-jupiter-api:5.7.1, Maven: org.junit.jupiter:junit-jupiter-engine:5.7.1, Maven: org.junit.platform:junit-platform-commons:1.7.1, Maven: org.junit.platform:junit-platform-engine:1.7.1, Maven: org.opentest4j:opentest4j:1.2.0)
7. Setup MySQL database by using the given hybrid-cloud.sql file.

Steps to run the Project:
1. Clone the repository and open the Project folder in IDE.
2. Configure the IDE by setting up all the above mentioned requirements.
3. Run the project on Tomact 9.0.69.
4. Click on "Admin" login from the left, enter admin as username and admin as password, and login.
5. Click on "private cloud" link and provide the location as "192.168.1.13", click save.
6. Click on "public cloud" link and provide the location as "192.168.1.73", click save.
7. Logout from admin.
8. Click on "Users" from the left and register 2 users by providing all required fields.
9. Click on "Users", and login as user 1.
10. Click on "Upload" and upload a file say "file1" and see that the file uploaded can be viewed on clicking on "Download" tab.
11. Logout from user 1 and login as user 2.
12. Try uploading the same file "file1", see that the application finds that there is already a duplicate file with same contents and asks if user 2 wants to "send key request to the other user" who originally uploaded the same file.
13. Select "Yes" under "We found duplicate data" and click "Go".
14. Login as user 1 now, click on "Share Request" tab and see the request from user 2. Click on Approve.
15. Login as user 2, click on "Download" tab and see that "file1" can be seen. Click on it and the file gets downloaded.
