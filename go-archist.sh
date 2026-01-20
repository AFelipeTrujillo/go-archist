#!/bin/bash

# Default project name example
DEFAULT_NAME="github.com/user/go-archist-project"

# 1. Check if go.mod already exists
if [ -f "go.mod" ]; then
    echo "Existing go.mod found. Skipping 'go mod init'..."
    # Extract project name from existing go.mod
    PROJECT_NAME=$(grep "^module" go.mod | awk '{print $2}')
else
    # 2. Ask for the module name with a GitHub-style example
    echo "No go.mod found. Enter the module name"
    echo "Example: github.com/username/my-project"
    echo "Name [default: $DEFAULT_NAME]:"
    read INPUT_NAME
    
    PROJECT_NAME=${INPUT_NAME:-$DEFAULT_NAME}

    echo "Initializing Go module: $PROJECT_NAME"
    go mod init "$PROJECT_NAME"
fi

echo "Creating Hexagonal Architecture folders..."

# 3. Create directory tree
mkdir -p cmd/app
mkdir -p internal/Application/{DTO,Service,UseCase}
mkdir -p internal/Domain/{Entity,Exception,Repository,ValueObject}
mkdir -p internal/Infrastructure/{Delivery/Console,Delivery/Http,ExternalApi,Persistence}
mkdir -p internal/Shared
mkdir -p tests/{Integration,Unit}

# 4. Create main entry point if it doesn't exist
if [ ! -f "cmd/app/main.go" ]; then
cat <<EOF > cmd/app/main.go
package main

import "fmt"

func main() {
    fmt.Println("Go-Archist app initialized.")
}
EOF
fi

echo "Architecture structure ready for: $PROJECT_NAME"