# 🥋 Karate-DSL-API-Automation

Karate DSL: API Automation and Performance from Zero to Hero Udemy Course by Artem Bondar


## 🚀 Getting Started

### Prerequisites

- Java 8 or higher
- Maven 3.6+
- Git
- IDE [IntelliJ IDEA (reccomended) or VS Code]

---

## 📦 Project Setup

1. **Clone the repository:**
```bash
git clone git@github.com:onuryasavul/Karate-DSL-API-Automation.git
```
2. **Install dependencies via Maven:**
```bash
mvn clean install
```

## 📁 Project Structure
```
Karate_Test_Framework/
├── src/
│   └── test/
│       ├── java/
│           └── helpers
│           ├── karate-config.js   
│           └── testApp/
│               ├── feature/
│               │   └── API Folders
│               └── TestRunner.java
├── pom.xml
├── README.md
└── .env
```


## 🏃 Running Tests
Test run command:
```bash
mvn -q test "-Dkarate.options=--tags @{test_tag}" -Dkarate.env={env}
```
