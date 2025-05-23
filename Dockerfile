# STAGE 1: Build Stage
FROM python:3.9 AS builder

# Set working directory
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install dependencies (no cache to reduce layer size)
RUN pip install --no-cache-dir -r requirements.txt


# STAGE 2: Production Stage
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy installed dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin 

# Copy application code
COPY . .

# Expose port
EXPOSE 5000

# Run the Flask app using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
