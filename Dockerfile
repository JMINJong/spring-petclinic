FROM eclipse-temurin:11-jre-focal

WORKDIR /app

COPY .mvn/ .mvn
COPY pom.xml ./
COPY mvnw ./
RUN sed -i 's/\r$//' mvnw
RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]