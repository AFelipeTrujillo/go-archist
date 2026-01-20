# Go-Archist

![Version](https://img.shields.io/badge/version-v1.0.0-blue.svg)
![Go](https://img.shields.io/badge/go-%3E%3D1.20-00ADD8.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Architecture](https://img.shields.io/badge/Architecture-Hexagonal-orange.svg)

A lightweight tool and boilerplate for enforcing **Hexagonal Architecture** and architectural rules in Go projects, inspired by the philosophy of [php-archist](https://github.com/AFelipeTrujillo/php-archist).

## Philosophy

The goal of this project is to maintain a clean separation of concerns by ensuring that dependencies only flow inwards. In a Hexagonal (Ports and Adapters) architecture:

1.  **Domain**: Contains business logic, entities, and repository interfaces. It must have **zero** dependencies on other layers.
2.  **Application**: Orchestrates use cases and application services. It depends only on the Domain.
3.  **Infrastructure**: Implements external details (Databases, APIs, HTTP Frameworks). It depends on both Application and Domain.
4.  **Shared**: Common logic accessible by all layers.

## Architectural Design: Hexagonal (Ports & Adapters)

![Texto alternativo](diagram.png)
_source: wata.es_

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

## Getting Started

**Prerequisites**

* Go 1.20 or higher

* Bash environment (Linux, macOS, or WSL)

**Using the Scaffolder**

We provide a shell script to quickly initialize your project structure and Go module.

1. **Grant execution permissions:**

```bash
chmod +x go-archist.sh
```

2. **Run the script:**

```bash
./go-archist.sh
```

The script will:

* Display the project logo.
* Detect if a go.mod already exists or prompt you to create one.
* Generate the full Hexagonal Architecture folder tree.
* Create a default main.go entry point.

   

