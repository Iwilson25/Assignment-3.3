# Use a pinned, lightweight base image
FROM python:3.11-slim

# Optional but helpful runtime settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Workdir inside the container
WORKDIR /app

# 1) Copy requirements first, then install (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2) Copy your application code
COPY flask_app.py .

# Expose Flask port (make sure your app runs on 8080)
EXPOSE 8080

# Start the app
CMD ["python", "flask_app.py"]
