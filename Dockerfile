# Use uv's official distroless base image
FROM ghcr.io/astral-sh/uv:latest as uv

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Sync dependencies using uv
RUN uv sync

# Expose FastAPI default port
EXPOSE 8000

# Start the FastAPI app using uv
CMD ["uv", "run", "fastapi", "run", "server.py"]
