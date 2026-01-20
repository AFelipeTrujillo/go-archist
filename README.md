# Go-Archist

A lightweight tool and boilerplate for enforcing **Hexagonal Architecture** and architectural rules in Go projects, inspired by the philosophy of [php-archist](https://github.com/AFelipeTrujillo/php-archist).

## Philosophy

The goal of this project is to maintain a clean separation of concerns by ensuring that dependencies only flow inwards. In a Hexagonal (Ports and Adapters) architecture:

1.  **Domain**: Contains business logic, entities, and repository interfaces. It must have **zero** dependencies on other layers.
2.  **Application**: Orchestrates use cases and application services. It depends only on the Domain.
3.  **Infrastructure**: Implements external details (Databases, APIs, HTTP Frameworks). It depends on both Application and Domain.
4.  **Shared**: Common logic accessible by all layers.

## Architectural Design: Hexagonal (Ports & Adapters)

![Texto alternativo](diagram.png)

This project strictly follows the Hexagonal Architecture pattern to ensure high maintainability and testability:

* **Core (Domain)**: Contains Entities and Repository Interfaces (Ports).
* **Application Layer**: Contains Use Cases that coordinate business logic.
* **Infrastructure Layer**: Contains all Adapters.
    * **Primary Adapters**: Entry points like HTTP APIs (REST) and CLI (Console).
    * **Secondary Adapters**: External tools like SQL Databases, Message Brokers, and Mail Services.

## Project Structure

The project follows a strict directory layout to prevent architectural erosion:

```text
.
├── cmd/
│   └── app/                # Application entry point (Bootstrap)
├── internal/
│   ├── Application/        # DTOs, Services, and UseCases
│   ├── Domain/             # Entities, Exceptions, and Repository Interfaces
│   ├── Infrastructure/     # Frameworks, Drivers (HTTP, Persistence, ExternalApi)
│   └── Shared/             # Shared utilities
└── tests/
    ├── Integration/        # Integration tests for external systems
    └── Unit/               # Isolated business logic tests
```

## Getting Started
**Prerequisites**

* Go 1.20 or higher

* Bash environment (Linux, macOS, or WSL)

