FROM quay.io/digitalpatterns/jdk:latest

ADD . /app/

WORKDIR /app

USER root

RUN ./gradlew clean build -x test

EXPOSE 8080

USER 1000

ENTRYPOINT exec /bin/run.sh java -cp "$GITREPO" $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app/dist/libs/api-server.jar

