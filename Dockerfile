# Use an official Maven image to build the project
FROM maven:3.8.4-openjdk-11 as build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies (caching this layer for better performance)
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src /app/src

# Build the project
RUN mvn clean install

# Use an openjdk image for the final image to run the app
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/myapp.jar /app/myapp.jar

# Expose the port the app will run on
EXPOSE 8080

# Define the command to run your application
ENTRYPOINT ["java", "-jar", "myapp.jar"]
