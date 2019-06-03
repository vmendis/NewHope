# Build: 
# Run: docker run --rm -p 8181:8080 calculator
# Access: Access the web app at http://localhost:8181/api/calculator/ping in browser.

FROM tomcat
MAINTAINER Ma Ping

RUN rm -rf $CATALINA_HOME/webapps/ROOT
COPY target/calculator.war $CATALINA_HOME/webapps/ROOT.war
