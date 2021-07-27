FROM schoolofdevops/maven-springclinic:v1

WORKDIR /app

COPY . .


EXPOSE 8080

CMD java -jar spring-petclinic-2.4.5.jar
