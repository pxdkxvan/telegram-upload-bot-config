# Config Service

The **Config Service** is a centralized configuration management microservice built with **Spring Cloud Config Server**. It retrieves configuration files from a private Git repository and serves them to other microservices. Additionally, it exposes **Spring Boot Actuator** endpoints for monitoring and management.

## Table of Contents
- [Overview](#overview)
- [Supported Profiles](#supported-profiles)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Configuration File Structure](#configuration-file-structure)
- [Actuator Endpoints](#actuator-monitoring)
- [Usage](#usage)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

## Overview

The Config Service provides a single source of truth for microservice configurations. Its key responsibilities include:
- Fetching configuration files from a private Git repository.
- Serving configuration files named `application-<profile>` to client microservices.
- Supporting profiles for various technologies and features.

### Supported Profiles

The `<profile>` suffix in configuration files corresponds to specific technologies. The following profiles are supported:
- `actuator`: Settings for Spring Boot Actuator.
- `openfeign`: Settings for OpenFeign clients.
- `postgres`: Settings for PostgreSQL database integration.
- `flyway`: Settings for Flyway database migrations.
- `rabbitmq`: Settings for RabbitMQ messaging.
- `telegram`: Settings for Telegram bot integration.
- `smtp`: Settings for SMTP email services.

## Features

- **Spring Cloud Config Server**: Centralized configuration for distributed systems.
- **Private Git Repository**: Securely retrieves configuration files.
- **Spring Boot Actuator**: Provides endpoints for health, metrics, and more.
- **Dynamic Profiles**: Supports multiple technology-specific configurations.

## Prerequisites

To run the Config Service, ensure you have:
- Java 21 or higher
- Spring Boot 3.4.x
- Access to a private Git repository
- Gradle for dependency management

## Setup

Follow these steps to set up the Config Service:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/pxdkxvan/telegram-upload-bot-config.git
   ```

2. **Configure the following variables in a `.env` file**:
   - `CONFIG_ENCRYPT_KEY`: Key for encrypting sensitive configuration.
   - `CONFIG_NAME`: Unique name for the Config Service.
   - `CONFIG_PORT`: Port for the Config Service (e.g., `8888`).
   - `GIT_CONFIG_SERVER`: URL of the Git repository with configurations.
   - `GIT_BRANCH`: Git branch to fetch (e.g., `main`).
   - `GIT_USER`: Git repository username.
   - `GIT_PASSWORD`: Git repository password (preferably [PAT](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)).
   - `ACTUATOR_ENDPOINT`: Base path for Actuator endpoints (e.g., `/actuator`).

3. **Build the Project**:
   ```bash
   ./gradlew build
   ```

4. **Run the Service**:
   ```bash
   ./gradlew bootRun
   ```

## Configuration File Structure

Configuration files in the Git repository must follow the naming convention `application-<profile>.yml` (or `.properties`). Examples:
- `application-actuator.yml`
- `application-postgres.yml`
- `application-telegram.yml`

Each file contains settings specific to the corresponding profile.

## Actuator Monitoring

The service exposes the following Actuator endpoints for monitoring:
- `/actuator/health`: Checks the service and database connection status.
- `/actuator/info`: Provides service information.
- `/actuator/metrics`: Displays performance and system metrics.
- `/actuator/loggers`: Allows viewing and managing logging levels.

## Usage

1. Start the Config Service.
2. Configure client microservices to connect to the Config Service using Spring Cloud Config Client.
3. Specify the desired profile in the client’s `application.yml`:
   ```yaml
   spring:
     profiles:
       active:
         - <profile>
         - <profile>
         - <profile>
   ```

## Security

- Secure the private Git repository with credentials.
- Use HTTPS for communication with client microservices.
- Restrict Actuator endpoints with Spring Security if needed.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss ideas or fixes.

## License

This project is licensed under the [MIT License](LICENSE).