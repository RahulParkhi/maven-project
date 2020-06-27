FROM tomcat:8
COPYY /webapp/target/*.war /usr/local/tomcat/webapps/
