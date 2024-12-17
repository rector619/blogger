#!/bin/sh
# NOTE: This script assumes it is run from the project root

# Step 1: Create necessary directories
mkdir -p openapi/go/blogger

# Step 2: Run oapi-codegen to generate Go code
go run github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@v2.3.0 \
  -config openapi/go/oapi-codegen.yml openapi/openapi.yml

# Step 3: Update dependencies
go mod tidy

# Step 4: Run Mockery to generate mocks
go run github.com/vektra/mockery/v2@v2.42.0
