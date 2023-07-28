#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

echo "Ingresa la contraseña para el superusuario:"
read -s password

# Crear un superusuario
python manage.py createsuperuser --username Miguel --email mi_correo@example.com --noinput
echo "$password" | python manage.py shell -c "from django.contrib.auth.models import User; user = User.objects.get(username='mi_usuario'); user.set_password('$password'); user.save()"