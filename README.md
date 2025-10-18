# 🚀 Expense Tracker Backend - Spring Boot

Full-featured Spring Boot backend for Expense Tracker application with MySQL database integration, JWT authentication, and RESTful APIs.

## 📋 Tech Stack

- **Spring Boot 3.2.0** - Main framework
- **Spring Data JPA** - Database ORM
- **Spring Security** - Authentication & Authorization
- **JWT (jjwt 0.11.5)** - Token-based authentication
- **MySQL 8.0+** - Database
- **Maven** - Build tool
- **Lombok** - Reduce boilerplate code
- **Bean Validation** - Input validation

## 🏗️ Project Structure

```
backend/
├── src/main/java/com/expense/tracker/
│   ├── ExpenseTrackerApplication.java    # Main Spring Boot application
│   ├── controller/                       # REST Controllers
│   │   ├── AuthController.java          # Authentication endpoints
│   │   └── ExpenseController.java       # Expense CRUD endpoints
│   ├── service/                          # Business logic
│   │   ├── AuthService.java             # Auth business logic
│   │   └── ExpenseService.java          # Expense business logic
│   ├── repository/                       # Spring Data JPA repositories
│   │   ├── UserRepository.java
│   │   ├── ExpenseRepository.java
│   │   └── BudgetRepository.java
│   ├── entity/                           # JPA entities
│   │   ├── User.java
│   │   ├── Expense.java
│   │   └── Budget.java
│   ├── dto/                              # Data Transfer Objects
│   │   ├── SignupRequest.java
│   │   ├── LoginRequest.java
│   │   ├── AuthResponse.java
│   │   └── ExpenseRequest.java
│   └── security/                         # Security configuration
│       ├── JwtUtil.java                  # JWT token utilities
│       ├── JwtAuthenticationFilter.java # JWT filter
│       └── SecurityConfig.java          # Spring Security config
├── src/main/resources/
│   └── application.properties            # Application configuration
└── pom.xml                               # Maven dependencies
```

## 🚀 Getting Started

### Prerequisites

- Java 17 or higher
- Maven 3.6+
- MySQL 8.0+ running locally or remote

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/klu2300030150/Expense_Tracker_backend.git
cd Expense_Tracker_backend
```

2. **Configure MySQL:**

Update `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/expense-tracker?createDatabaseIfNotExist=true
spring.datasource.username=YOUR_MYSQL_USERNAME
spring.datasource.password=YOUR_MYSQL_PASSWORD
```

3. **Build the project:**
```bash
mvn clean install
```

4. **Run the application:**
```bash
mvn spring-boot:run
```

The backend will start on **http://localhost:8080**

## 🔐 API Endpoints

### Authentication (Public)

| Method | Endpoint              | Description       | Request Body |
|--------|-----------------------|-------------------|--------------|
| POST   | `/api/auth/signup`    | Register new user | SignupRequest |
| POST   | `/api/auth/login`     | Login user        | LoginRequest |

**SignupRequest:**
```json
{
  "fullName": "John Doe",
  "email": "john@example.com",
  "password": "password123",
  "phoneNumber": "+1234567890",
  "currency": "USD"
}
```

**LoginRequest:**
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

**AuthResponse:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "userId": 1,
  "fullName": "John Doe",
  "email": "john@example.com",
  "currency": "USD"
}
```

### Expenses (Protected - Requires JWT)

| Method | Endpoint            | Description           | Headers |
|--------|---------------------|-----------------------|---------|
| GET    | `/api/expenses`     | Get user's expenses   | Authorization: Bearer {token} |
| POST   | `/api/expenses`     | Create new expense    | Authorization: Bearer {token} |
| DELETE | `/api/expenses/{id}`| Delete expense        | Authorization: Bearer {token} |

**ExpenseRequest:**
```json
{
  "amount": 50.00,
  "category": "Food",
  "description": "Lunch at restaurant",
  "date": "2025-10-18"
}
```

## 🔑 JWT Authentication Flow

1. User signs up or logs in via `/api/auth/signup` or `/api/auth/login`
2. Backend generates JWT token (valid for 24 hours)
3. Frontend stores token in localStorage
4. All protected endpoints require header: `Authorization: Bearer {token}`
5. Spring Security validates token on each request
6. If valid, request proceeds; if invalid/expired, returns 401 Unauthorized

## 📊 Database Schema

### Users Table
```sql
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    currency VARCHAR(10),
    created_at DATETIME
);
```

### Expenses Table
```sql
CREATE TABLE expenses (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    category VARCHAR(50) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### Budgets Table
```sql
CREATE TABLE budgets (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    category VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

**Note:** Tables are auto-created by Hibernate on first run (`spring.jpa.hibernate.ddl-auto=update`)

## ⚙️ Configuration

### application.properties

```properties
# Server Configuration
server.port=8080

# MySQL Database
spring.datasource.url=jdbc:mysql://localhost:3306/expense-tracker?createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA/Hibernate
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect

# JWT Configuration
jwt.secret=YourSuperSecretKeyForJWTTokenGenerationMustBeLongEnough123456789
jwt.expiration=86400000

# CORS
spring.web.cors.allowed-origins=http://localhost:5173
```

## 🔒 Security Features

- **Password Encryption:** BCrypt with 10 rounds
- **JWT Tokens:** 24-hour expiration
- **CORS:** Configured for frontend origin
- **Input Validation:** Bean validation on all DTOs
- **SQL Injection Protection:** JPA parameterized queries
- **Authentication:** Stateless JWT-based auth

## 🐛 Troubleshooting

### MySQL Connection Error
**Problem:** `Access denied for user 'root'@'localhost'`  
**Solution:** Update username/password in `application.properties`

### Port Already in Use
**Problem:** Port 8080 is busy  
**Solution:** Change port in `application.properties`: `server.port=8081`

### JWT Token Expired
**Problem:** 401 Unauthorized after 24 hours  
**Solution:** User must login again to get new token

### Database Not Created
**Problem:** Database doesn't exist  
**Solution:** Ensure `createDatabaseIfNotExist=true` is in connection URL

## 📝 Development

### Run in Development Mode
```bash
mvn spring-boot:run
```

### Run Tests
```bash
mvn test
```

### Build JAR
```bash
mvn clean package
java -jar target/expense-tracker-1.0.0.jar
```

## 🚀 Production Deployment

- [ ] Change JWT secret to strong random key
- [ ] Use environment variables for sensitive data
- [ ] Enable HTTPS/SSL
- [ ] Configure production database
- [ ] Set `spring.jpa.hibernate.ddl-auto=validate`
- [ ] Enable production logging
- [ ] Add rate limiting
- [ ] Implement refresh tokens
- [ ] Use connection pooling (HikariCP included)

## 🔗 Related Repositories

- **Frontend:** [Expense_Tracker_Frontend](https://github.com/klu2300030150/Expense_Tracker_Frontend)

## 📄 License

This project is open source and available under the MIT License.

## 👨‍💻 Author

**KLU Student** - [klu2300030150](https://github.com/klu2300030150)

---

**Built with ❤️ using Spring Boot**
