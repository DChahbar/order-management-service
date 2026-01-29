# Order Management Service

A production-style Order Management REST API built with **Spring Boot**, **PostgreSQL**, and **JWT authentication**.

This project demonstrates real-world backend engineering patterns, including authentication, authorization, database migrations, automated testing, Dockerized infrastructure, and CI/CD workflows.

---

## Features

- User registration and login
- JWT-based authentication
- Role-based authorization (USER / ADMIN)
- CRUD operations for products
- Order creation and lifecycle management
- User-level authorization (users can only access their own orders)
- PostgreSQL database with Flyway migrations
- Swagger / OpenAPI documentation
- Dockerized local development environment
- Automated tests with JUnit
- GitHub Actions CI pipeline

---

## Tech Stack

- Java 17
- Spring Boot
- Spring Web
- Spring Data JPA
- Spring Security
- PostgreSQL
- Flyway
- Swagger / OpenAPI (springdoc-openapi)
- JUnit 5
- Docker & Docker Compose
- GitHub Actions

---

## Project Structure

```
order-management-service/
├── src/main/java/com/dchahbar/oms/
│   ├── config/          # Security, JWT, application configuration
│   ├── auth/            # Authentication controllers and services
│   ├── users/           # User entity and repository
│   ├── products/        # Product domain logic
│   ├── orders/          # Order domain logic
│   └── common/          # Exceptions, utilities, shared models
├── src/main/resources/
│   ├── application.yml
│   └── db/migration/    # Flyway SQL migrations
├── src/test/java/       # Unit and integration tests
├── docker-compose.yml
├── pom.xml
└── README.md
```

---

## Running Locally

### 1. Clone the repository

```bash
git clone https://github.com/DChahbar/order-management-service.git
cd order-management-service
```

### 2. Start PostgreSQL with Docker

```bash
docker compose up -d
```

Database configuration used by default:

- Database: `oms`
- Username: `oms_user`
- Password: `oms_pass`
- Port: `5432`

### 3. Run the application

```bash
./mvnw spring-boot:run
```

The API will be available at:

```
http://localhost:8080
```

Health endpoint:

```
http://localhost:8080/actuator/health
```

---

## API Documentation

Swagger UI:

```
http://localhost:8080/swagger-ui/index.html
```

OpenAPI specification:

```
http://localhost:8080/v3/api-docs
```

---

## Authentication Flow

### 1. Register

```
POST /api/auth/register
```

Example request body:

```json
{
  "email": "user@example.com",
  "password": "Password123!"
}
```

### 2. Login

```
POST /api/auth/login
```

Example request body:

```json
{
  "email": "user@example.com",
  "password": "Password123!"
}
```

Example response:

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGV4YW1wbGUuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MDAwMDAwMDAsImV4cCI6MTcwMDAwMzYwMH0.TG9yZW1JcHN1bURvbG9yU2l0QW1ldA"
}
```

### 3. Use the token

Include the following header on protected requests:

```
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGV4YW1wbGUuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MDAwMDAwMDAsImV4cCI6MTcwMDAwMzYwMH0.TG9yZW1JcHN1bURvbG9yU2l0QW1ldA
```

---

## Core Endpoints

### Products

- `GET /api/products`
- `POST /api/products` (ADMIN only)
- `GET /api/products/{id}`
- `PUT /api/products/{id}` (ADMIN only)
- `DELETE /api/products/{id}` (ADMIN only)

### Orders

- `POST /api/orders` (USER)
- `GET /api/orders` (USER: own orders, ADMIN: all orders)
- `GET /api/orders/{id}` (USER: own order, ADMIN: any order)
- `PATCH /api/orders/{id}/status` (ADMIN only)

---

## Database Migrations

Database schema changes are managed using **Flyway**.

Migration files are located at:

```
src/main/resources/db/migration
```

All migrations are automatically applied when the application starts.

---

## Running Tests

Run the test suite with:

```bash
./mvnw test
```

Tests use an isolated configuration and do not affect local or production databases.

---

## CI / CD

This repository includes a GitHub Actions workflow that automatically:

- Builds the application
- Runs the full test suite
- Verifies PostgreSQL connectivity

Workflow results are available in the **Actions** tab of the repository.

---

## Why This Project

This project was built to demonstrate:

- Secure authentication and authorization
- REST API best practices
- Clean layered backend architecture
- Database schema versioning with migrations
- Automated testing and CI integration
- Dockerized, production-style development workflows

This repository is intended to be a **portfolio-quality, interview-ready backend project**.

---

## Contact

**Darwish Chahbar**  
Email: chahbar.darwish@gmail.com  
GitHub: https://github.com/DChahbar
