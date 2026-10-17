#!/bin/sh
# Prepare the database and static files, then start the server.
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Optional admin user (set DJANGO_SUPERUSER_* env vars)
if [ -n "$DJANGO_SUPERUSER_USERNAME" ]; then
  python manage.py createsuperuser --noinput || true
fi

exec "$@"
