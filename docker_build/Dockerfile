# Stage 1 - development stage
FROM cgr.dev/chainguard/python:latest-dev as dev

WORKDIR /app

# Create virtual environment
RUN python -m venv venv

# Activate the virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Copy and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Stage 2 - production stage
FROM cgr.dev/chainguard/python:latest

WORKDIR /app

# Copy all app files
COPY . .

# Copy the virtual environment from the dev stage
COPY --from=dev /app/venv /app/venv

# Ensure the virtual environment is in the PATH
ENV PATH="/app/venv/bin:$PATH"

# Explicitly state where the app.py is located
CMD ["python", "/app/app.py"]