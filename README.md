# 🥋 Karate-DSL-API-Automation

An API Automation and Performance Testing Framework built from scratch using Karate DSL and Gatling. Inspired by the "Karate DSL: API Automation and Performance from Zero to Hero" Udemy Course by Artem Bondar.

## ✨ Features & Recent Enhancements

- **Behavior-Driven API Testing:** Write intuitive Gherkin (`.feature`) scenarios for REST APIs without the need for complex Java code.
- **Robust Assertions & AI Generated Tests:** Built-in powerful Karate DSL matchers for JSON response validation. Includes a dedicated `AiTests.feature` suite containing edge-case scenarios (Positive/Negative boundaries, Method Not Allowed, Unauthorized access).
- **Performance Testing Integration (Gatling):** Run robust load tests directly in Java using Katate v1.5.0's integration with Gatling Java API. No Scala required! We have dedicated simulation and feature tests located in the `performance` directory.
- **Modular Data-Driven Approach:** Ready-to-use dynamic parameters, JSON assertions (`#array`, `#number`), and background authentication steps (`getToken.feature`).

---

## 🚀 Getting Started

### Prerequisites

- Java 11 (Minimum setup defined in `pom.xml`)
- Maven 3.6+
- Git
- IDE (IntelliJ IDEA or VS Code recommended)

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

---

## 📁 Project Structure

```text
Karate-DSL-API-Automation/
├── src/
│   └── test/
│       ├── java/
│           ├── helpers/
│           │   └── getToken.feature          # Common Token Generation 
│           ├── testApp/
│           │   ├── features/
│           │   │   ├── AiTests.feature       # Comprehensive Positive & Negative Test Cases
│           │   │   └── conduitAppHome.feature # Standard End-to-End Core Scenarios
│           │   ├── performance/
│           │   │   ├── PerfTags.feature      # Feature stripped-down for performance measurement
│           │   │   └── TagsSimulation.java   # Gatling Load Model Definition in Java
│           │   └── TestRunner.java           # Main runner class for JUnit tests
│           └── karate-config.js              # Global API Base URL & variables
├── pom.xml                                   # Configured with Karate v1.50 and Gatling Plugins
├── .gitignore                                # Cleaned & deduplicated git ignores
└── README.md
```

---

## 🏃 Running Tests

### 1. Functional API Tests (Karate)
Run the functional GUI or API validation logic using specific tags (e.g., `@Test3`, `@AiTest`, `@Positive`, `@Negative`):

```bash
mvn test "-Dkarate.options=--tags @AiTest"
```

Once the tests execute, check the visual Karate Execution Report at:
> `target/karate-reports/karate-summary.html`

### 2. Performance / Load Tests (Gatling)
Leverage Gatling to simulate massive concurrent user load accurately onto specific Karate endpoints without rewriting the core behavior. 

To execute the Performance simulation `TagsSimulation.java`:
```bash
mvn clean test-compile gatling:test
```

Once complete, access the beautifully charted Gatling Highcharts Report at:
> `target/gatling/tagssimulation-[timestamp]/index.html`
