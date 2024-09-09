# Stage 1 - development stage
FROM rjones21/pythonbaseimage

WORKDIR /app

# Copy all app files
COPY . .

# Ensure the virtual environment is in the PATH
ENV PATH="/app/venv/bin:$PATH"

# Explicitly state where the app.py is located
CMD ["python", "/app/app.py"]