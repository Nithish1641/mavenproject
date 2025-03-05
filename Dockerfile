FROM openjdk:11-jre-slim
COPY target/my-maven-project-1.0-SNAPSHOT.jar /app.jar
EXPOSE 5000
ENTRYPOINT ["java", "-jar", "/app.jar"]
