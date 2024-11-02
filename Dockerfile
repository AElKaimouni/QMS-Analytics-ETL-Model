# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Install required system packages and dbt
RUN apt-get update && apt-get install -y && \
    pip install dbt dbt-core dbt-postgres

# Set the working directory in the container
WORKDIR /app

# Copy the dbt project, profiles, and scripts into the container
COPY . /app/

# Apply execution rights to the scripts
RUN chmod +x /app/run_dbt.py

# Command to run the Python script
CMD ["python", "/app/run_dbt.py"]
