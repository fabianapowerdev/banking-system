# ==========================================
# ESTÁGIO 1: BUILD (Compilação e Extração)
# ==========================================
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY . .

# Instala o curl para evitar quedas no download do Maven
RUN apk add --no-cache curl
RUN ./mvnw clean package -DskipTests
RUN java -Djarmode=layertools -jar target/*.jar extract

# ==========================================
# ESTÁGIO 2: EXECUÇÃO (Imagem Final Leve)
# ==========================================
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/dependencies/ ./
COPY --from=builder /app/spring-boot-loader/ ./
COPY --from=builder /app/snapshot-dependencies/ ./
COPY --from=builder /app/application/ ./

EXPOSE 8080
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]