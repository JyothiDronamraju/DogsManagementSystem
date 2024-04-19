# Stage 1: Build the application
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests

# Stage 2: Create the final image
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar /app/DogsManagementSystem.jar
WORKDIR /app
CMD ["java", "-jar", "DogsManagementSystem.jar"]
