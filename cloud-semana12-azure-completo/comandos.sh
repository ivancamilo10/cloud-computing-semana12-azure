#!/bin/bash
# =============================================================
# SEMANA 12 - Cloud Computing: Servidor Web en Azure
# Estudiante: Ivan Mejia
# Fecha: 2026-06-05
# =============================================================

# Conexión SSH
ssh-keygen -t rsa -b 4096 -C "ivan.mejia@redes-futuro" -f ~/.ssh/redes-azure-key
ssh azureuser@20.84.112.47

# Actualización del sistema
sudo apt update && sudo apt upgrade -y

# Instalación de Nginx
sudo apt install nginx -y
sudo systemctl status nginx
sudo systemctl enable nginx

# Crear directorio web
sudo mkdir -p /var/www/redes-futuro
sudo chown -R www-data:www-data /var/www/redes-futuro
sudo chmod -R 755 /var/www/redes-futuro

# Crear página HTML
sudo tee /var/www/redes-futuro/index.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redes del Futuro S.A.</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; background: #e8f4f8; }
        h1 { color: #0078d4; }
        .container { background: white; padding: 30px; border-radius: 10px; max-width: 700px; margin: auto; }
        table { width: 100%; margin-top: 20px; border-collapse: collapse; }
        td, th { border: 1px solid #ccc; padding: 10px; }
        th { background: #0078d4; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏢 Redes del Futuro S.A.</h1>
        <h2>Infraestructura Cloud - Microsoft Azure</h2>
        <p><strong>Estudiante:</strong> Ivan Mejia</p>
        <p><strong>Fecha de despliegue:</strong> 5 de junio de 2026</p>
        <p><strong>Servidor:</strong> Azure VM B1s (Free Tier)</p>
        <hr>
        <h3>Ventajas del Cloud vs On-Premise</h3>
        <table>
            <tr>
                <th>Cloud Computing</th>
                <th>On-Premise</th>
            </tr>
            <tr>
                <td>Escalabilidad bajo demanda</td>
                <td>Capacidad limitada por hardware físico</td>
            </tr>
            <tr>
                <td>Pago por uso</td>
                <td>Alta inversión inicial</td>
            </tr>
            <tr>
                <td>Alta disponibilidad global</td>
                <td>Dependencia de infraestructura local</td>
            </tr>
        </table>
        <hr>
        <p><strong>Estado:</strong> Operativo</p>
    </div>
</body>
</html>
EOF

# Configurar Nginx
sudo tee /etc/nginx/sites-available/redes-futuro << 'EOF'
server {
    listen 80;
    server_name _;
    root /var/www/redes-futuro;
    index index.html;
}
EOF

sudo ln -s /etc/nginx/sites-available/redes-futuro /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx

# Verificación
curl localhost
