# ---- Base Python ----
    FROM python:3.9-slim AS base

    # Set the working directory inside the container
    WORKDIR /app
    
    # Install dependencies (if any) or system-level packages here
    RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        libpq-dev \
        build-essential \
        && rm -rf /var/lib/apt/lists/*
    
    # Copy the requirements file into the container
    COPY requirements.txt .
    
    # Install dependencies
    RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip install gunicorn
    
    # Copy your application code to the container
    COPY . .
    
    # ---- Release with Gunicorn ----
    FROM base AS release
    CMD ["/usr/local/bin/gunicorn", "vernonburg_timemanagement_be.wsgi:application", "--bind", "0.0.0.0:8000"]
    