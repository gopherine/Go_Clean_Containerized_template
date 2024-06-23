# Goemon

This project uses a Makefile to streamline the build and deployment process using Docker. The Makefile includes targets for building and managing Docker containers in different environments. DO NOTE, WHATEVER YOU BUILD LAST WILL TRIGGER ON on `make up`

## Prerequisites

- Docker
- Docker Compose
- Make

Ensure you have a `.env` file in the root directory with the required environment variables. Default values are used if not provided in the `.env` file.

## Makefile Targets

### General Targets

- `all`: Builds and starts the Docker containers.
- `build`: Builds the Docker containers with the specified `DOCKER_ENV`.
- `up`: Starts the Docker containers with the specified `DOCKER_ENV`.
- `down`: Stops the Docker containers.
- `restart`: Restarts the Docker containers.
- `logs`: Shows logs of the Docker containers.

### Environment-Specific Build Targets

- `build-dev`: Builds the Docker containers for the development environment.
- `build-prod`: Builds the Docker containers for the production environment.
- `build-debug`: Builds the Docker containers for the debugging environment.

## Usage

### Build and Start Containers

To build and start the Docker containers, run:

```sh
make all
```

### Build for Specific Environments

To build for the development environment:

```sh
make build-dev
```

To build for the production environment:

```sh
make build-prod
```

To build for the debugging environment:

```sh
make build-debug
```

### Start Containers

To start the Docker containers:

```sh
make up
```

### Stop Containers

To stop the Docker containers:

```sh
make down
```

### Restart Containers

To restart the Docker containers:

```sh
make restart
```

### View Logs

To view the logs of the Docker containers:

```sh
make logs
```

## Environment Variables

The `.env` file should contain the following variables:

- `DOCKER_ENV`: The Dockerfile to use (default: `Dockerfile.dev`).

Example `.env` file:

```env
DOCKER_ENV=Dockerfile.dev
```

Ensure to adjust the `.env` file according to your environment needs.

## Notes

- The `DOCKER_ENV` variable determines which Dockerfile to use for building the containers.
- The default Dockerfile is `Dockerfile.dev`. Override this by specifying a different `DOCKER_ENV` in the Makefile targets or the `.env` file.
