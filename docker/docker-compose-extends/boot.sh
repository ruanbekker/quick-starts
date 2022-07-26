#!/usr/bin/env sh
gunicorn main:app \
	--workers 2 \
	--threads 2 \
	--bind 0.0.0.0:8000 \
	--capture-output \
	--access-logfile '-' \
	--error-logfile '-'
