# Use Go 1.18 or later as the base image
FROM golang:1.18 AS builder

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . .

# Download Go module dependencies
RUN go mod tidy

# Build the Go application
RUN go build -o server ./src

# Use a minimal base image for the final stage
# FROM alpine:latest

# Copy the built application from the builder stage
# COPY --from=builder /app/server /server

# Ensure the executable has the correct permissions
# RUN chmod +x /server

# Set the entrypoint for the container
# ENTRYPOINT ["/server"]

# # Expose port 8000
# EXPOSE 8000

# Install the package
RUN cd src && go install -v ./...
# running sever
RUN cd src && go build -o server

RUN pwd && ls

# This container exposes port 8080 to the outside world
EXPOSE 8000

# Run the executable
CMD ["./src/server"]
