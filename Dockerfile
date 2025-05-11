# I used an official python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app


# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install --default-timeout=100 --no-cache-dir -r requirements.txt

# Copy the entire scripts directory
COPY scripts/ /app/scripts

# Copy dbt project files
COPY dbt /app/dbt
COPY docs /app/docs

COPY scripts /app/scripts

# Set working directory to dbt project
WORKDIR /app/dbt  

# Copy dbt entrypoint script & make it executable
COPY dbt/dbt_entrypoint.sh /app/dbt_entrypoint.sh
RUN chmod +x /app/dbt_entrypoint.sh

# Set the command to run the script
CMD ["bash"]

