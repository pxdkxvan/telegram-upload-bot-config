FROM gradle:8.13-jdk21 AS builder

WORKDIR /app

COPY build.gradle settings.gradle /app/
COPY src /app/src

RUN gradle build --no-daemon -x test

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=builder /app/build/libs/config-1.0.jar /app/config.jar
EXPOSE 8888

ENV CONFIG_NAME=""
ENV CONFIG_PORT=""
ENV CONFIG_ENCRYPT_KEY=""
ENV GIT_CONFIG_SERVER=""
ENV GIT_BRANCH=""
ENV GIT_USER=""
ENV GIT_PASSWORD=""
ENV ACTUATOR_ENDPOINT=""

ENTRYPOINT ["java", "-jar", "config.jar"]