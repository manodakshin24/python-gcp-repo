# python-gcp-repo

An exercise in containerizing a Python app, scanning for vulnerabilities with Snyk, and pushing to Google Artifact Registry.

## Local Setup
1. `pip install -r requirements.txt`
2. `uvicorn src.main.py:app --reload`

## Security Scan
Run Snyk locally to check dependencies:
```bash
snyk test