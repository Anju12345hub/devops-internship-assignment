FROM python:3.13-slim-bookworm

# Install uv.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the application into the container.
COPY . /app

# Set working directory
WORKDIR /app

# Install the application dependencies.
RUN uv sync --frozen --no-cache

# Run the application.
CMD ["uv", "run", "uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
