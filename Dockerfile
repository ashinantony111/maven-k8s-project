
FROM tomcat:9.0-jdk17-temurin

EXPOSE 8080

COPY target/maven-web-app.war /usr/local/tomcat/webapps/maven-web-app.war
