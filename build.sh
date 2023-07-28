#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

# Utilizar la variable de entorno para obtener la contraseña del superusuario
SUPERUSER_PASSWORD="$MI_SUPERUSER_PASSWORD"

# Crear el superusuario con la contraseña proporcionada desde la variable de entorno
python manage.py createsuperuser --username Miguel --email mi_correo@example.com --noinput
python manage.py changepassword Miguel "$SUPERUSER_PASSWORD"