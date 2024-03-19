FROM maven:3-amazoncorretto-11 AS build

WORKDIR /app

COPY . .

RUN mvn install -DskipTests=True


FROM amazoncorretto:latest

WORKDIR /app

COPY --from=build /app/target/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar .


EXPOSE 8080

ENTRYPOINT ["java", "-jar"]

CMD ["shoe-ShoppingCart-0.0.1-SNAPSHOT.jar" ]