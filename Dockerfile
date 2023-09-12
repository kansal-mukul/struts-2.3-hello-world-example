
# Use an official Tomcat runtime as a parent image
FROM tomcat:latest


# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your Struts application WAR file into the Tomcat webapps directory
COPY your-app.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
