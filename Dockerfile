# Use the official Elixir image from the Docker Hub
FROM elixir:latest

# Set the working directory inside the Docker image
WORKDIR /exercism

# Copy the current directory contents into the Docker image
#COPY . /app

# Install hex package manager
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install dependencies
#RUN mix deps.get

# Compile the project
#RUN mix compile

