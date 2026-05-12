# Stage 1: Builder
FROM python:3.11-slim as builder

WORKDIR /app

COPY requirements.txt .
# Install dependencies to a local directory
RUN pip install --no-cache-dir --user -r requirements.txt

# Stage 2: Final Image
FROM python:3.11-slim

WORKDIR /app

# Create a non-privileged user for security
RUN groupadd -g 999 python && \
    useradd -r -u 999 -g python python

# Copy only the installed packages and code
COPY --from=builder /root/.local /home/python/.local
RUN chown -R python:python /home/python/.local
COPY src/ /app/src/

# Update PATH to include the local pip bin
ENV PATH=/home/python/.local/bin:$PATH
ENV PYTHONUNBUFFERED=1

USER python

EXPOSE 8000

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]