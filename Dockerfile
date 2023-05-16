FROM gradle:7.5 AS gradle-bld

WORKDIR /app/

COPY . .

RUN gradle build

FROM openjdk:18

COPY --from=gradle-bld /app/build/libs/newspringdemo-0.0.1-*.war /tmp/app.jar

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java -jar /tmp/app.jar"]
