FROM gradle:7.5 AS builder

WORKDIR /app

COPY . .

RUN gradle build

FROM openjdk:18

COPY --from=builder /app/build/libs/newspringdemo-0.0.1-SNAPSHOT.war ./app.war

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "app.war"]