FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git unrar-free && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt 2>/dev/null || true

EXPOSE 5299
VOLUME /config
CMD ["python", "LazyLibrarian.py", "--datadir", "/config", "--nolaunch"]
