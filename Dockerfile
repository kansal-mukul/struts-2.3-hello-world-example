# Stage 1: Build the Struts application

# Use a Maven image as the build environment
FROM maven:3.6-jdk-11 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code to the container
COPY . .

# Build the Struts application with Maven
RUN mvn clean package

# Stage 2: Create a Tomcat-based runtime image

# Use an official Tomcat image as the runtime environment
FROM tomcat:latest

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the Struts application WAR file built in Stage 1 to the Tomcat webapps directory
COPY --from=builder /app/target/struts-2.3-hello-world-example.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]

