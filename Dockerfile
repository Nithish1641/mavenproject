FROM openjdk:11-jre-slim
COPY target/your-jar-file.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
