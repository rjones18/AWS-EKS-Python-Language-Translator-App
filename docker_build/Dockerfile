FROM python:3.9-slim

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
