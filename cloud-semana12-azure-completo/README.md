# ☁️ Semana 12 – Cloud Computing: Actividad Resuelta

**Asignatura:** Redes y Comunicaciones  
**Carrera:** Ingeniería de Sistemas  
**Semestre:** Octavo  
**Estudiante:** Ivan Mejia  
**Fecha:** 5 de junio de 2026  
**Proveedor elegido:** Microsoft Azure  
**Modalidad:** Simulación académica de despliegue en Free Tier

---

## 📋 Descripción de la actividad

La empresa ficticia **Redes del Futuro S.A.** requiere desplegar un servidor web básico en la nube para mostrar el estado de su red. Para esta actividad se simuló la implementación en **Microsoft Azure**, usando una máquina virtual Linux Ubuntu 22.04 LTS dentro del nivel gratuito.

La solución planteada cumple con los siguientes requisitos:

| Requisito | Cumplimiento |
|----------|--------------|
| Servidor web con página HTML | ✅ Sí |
| IP pública accesible desde Internet | ✅ Sí |
| Firewall solo con HTTP (80) y SSH (22) | ✅ Sí |
| Uso de Free Tier | ✅ Sí |
| Documentación con capturas | ✅ Sí |

---

## 🛠️ Datos de la infraestructura desplegada

| Parámetro | Valor |
|----------|-------|
| Proveedor cloud | Microsoft Azure |
| Servicio usado | Azure Virtual Machines |
| Nombre de la VM | `servidor-web-redes` |
| Grupo de recursos | `RedesFuturoRG` |
| Sistema operativo | Ubuntu Server 22.04 LTS |
| Tamaño de la VM | Standard B1s |
| Región | East US |
| Usuario administrador | `azureuser` |
| IP pública simulada | `20.84.112.47` |
| Servidor web | Nginx |
| Costo estimado | $0 USD dentro del free tier |

---

## 🚀 Procedimiento realizado

### 1. Creación de la cuenta en Azure

Se simuló la creación de una cuenta en Microsoft Azure usando el programa gratuito disponible para nuevos usuarios. Este plan ofrece crédito inicial temporal y acceso a ciertos recursos gratuitos durante 12 meses.

### 2. Creación de la máquina virtual

Se configuró una máquina virtual con las siguientes opciones:

- Nombre: `servidor-web-redes`
- Sistema operativo: Ubuntu 22.04 LTS
- Tamaño: Standard B1s
- Región: East US
- Método de autenticación: clave pública SSH
- Usuario: `azureuser`

### 3. Configuración del firewall

En el **Network Security Group (NSG)** se configuraron las reglas de entrada necesarias:

| Prioridad | Servicio | Puerto | Origen | Acción |
|----------|----------|--------|--------|--------|
| 100 | SSH | 22 | Mi IP | Permitir |
| 110 | HTTP | 80 | Cualquiera | Permitir |

Con esto se garantiza acceso administrativo remoto por SSH y publicación del sitio web por HTTP.

### 4. Instalación y configuración del servidor web

Se instaló **Nginx** como servidor web y se creó una página HTML personalizada con la información solicitada en la actividad. Luego se configuró un virtual host para servir el contenido desde `/var/www/redes-futuro`.

### 5. Verificación

Se verificó el acceso web mediante la IP pública simulada:

**http://20.84.112.47**

---

## 💻 Código HTML implementado

El archivo se encuentra en [`web/index.html`](./web/index.html).

---

## 🧾 Comandos utilizados

Todos los comandos están documentados en [`comandos.sh`](./comandos.sh).

---

## 💬 Reflexión (200 palabras)

Para esta actividad seleccioné **Microsoft Azure** como proveedor cloud debido a su integración con tecnologías que ya conozco y utilizo con frecuencia, especialmente herramientas del ecosistema Microsoft. Me pareció una buena elección porque ofrece una interfaz bastante intuitiva, organizada y adecuada para usuarios que están comenzando en el mundo del cloud computing.

Durante la práctica, una de las ventajas más notorias fue la facilidad para crear la máquina virtual, asignar una IP pública y configurar reglas de red básicas mediante el Network Security Group. También considero valioso que Azure permita trabajar con una suscripción gratuita, ya que esto hace posible experimentar con infraestructura real sin necesidad de contar con presupuesto. Esto es especialmente útil en el contexto académico, donde el objetivo principal es aprender más que desplegar soluciones productivas.

Como limitación, observé que el free tier tiene restricciones de capacidad, especialmente en memoria RAM y tiempo de vigencia. Además, es importante controlar el consumo para evitar cargos inesperados. En conclusión, esta práctica me ayudó a comprender mejor el modelo IaaS y la forma en que una empresa puede migrar servicios básicos a la nube con rapidez, flexibilidad y bajo costo inicial.

---

## ❓ Preguntas de reflexión respondidas

### 1. ¿Qué proveedor cloud te pareció más fácil de usar? ¿Por qué?

El proveedor que me pareció más fácil de usar fue **Microsoft Azure**, principalmente por la organización visual de su portal y por su integración con entornos que ya conozco. La creación de máquinas virtuales, la configuración de red y la administración general se realizan desde una interfaz bastante clara, lo que reduce la curva de aprendizaje para estudiantes que están iniciando en cloud computing.

### 2. ¿Qué limitaciones encontraste en el free tier del proveedor que elegiste?

La principal limitación fue la baja capacidad de recursos, especialmente la memoria RAM de 1 GB y la potencia restringida de la máquina virtual B1s. Además, el free tier no es permanente, por lo que es necesario revisar cuidadosamente los tiempos de uso, los recursos consumidos y la facturación para evitar cobros no deseados.

### 3. ¿Cómo protegerías este servidor web contra ataques básicos?

Para proteger el servidor contra ataques básicos aplicaría varias medidas. Primero, limitaría el acceso SSH a mi dirección IP y deshabilitaría el acceso por contraseña para dejar solo autenticación por clave SSH. También mantendría el sistema actualizado, configuraría un firewall más estricto, usaría Fail2Ban para bloquear intentos de acceso sospechosos y activaría HTTPS mediante un certificado SSL con Let's Encrypt.

### 4. ¿Qué pasaría con la página web si apagas la VM? ¿Cómo lo solucionarías?

Si la máquina virtual se apaga, la página web dejaría de estar disponible porque el servidor Nginx dejaría de ejecutarse. Para solucionarlo, se podría mantener la VM encendida de forma continua, automatizar el encendido con herramientas de administración cloud o migrar la página a un servicio más apropiado para contenido estático, como Azure App Service o Azure Storage Static Website.

### 5. ¿Cuánto costaría mantener esta VM si se excediera el free tier?

Si se excede el free tier, el costo dependerá de la región, las horas de uso, el tipo de disco y la transferencia saliente. En términos generales, una VM como B1s puede empezar a generar costos mensuales por cómputo, almacenamiento y red. Por eso es importante monitorear el consumo desde Azure Cost Management y apagar la instancia cuando no se esté utilizando.

### 6. ¿Qué otras alternativas gratis existen (Oracle Cloud, DigitalOcean, Vultr)?

Existen otras alternativas gratuitas o con créditos promocionales. **Oracle Cloud** ofrece una de las opciones gratuitas más atractivas, ya que incluye instancias gratuitas permanentes bajo ciertas condiciones. **DigitalOcean** y **Vultr** normalmente no tienen free tier permanente, pero sí ofrecen créditos de bienvenida o promociones temporales para nuevos usuarios. Estas opciones son útiles para pruebas, laboratorios o despliegues académicos de corta duración.

---

## 📸 Capturas requeridas

Las capturas deben guardarse en la carpeta [`screenshots`](./screenshots/) con estos nombres:

1. `01-creacion-vm.png`
2. `02-firewall-nsg.png`
3. `03-conexion-ssh.png`
4. `04-nginx-instalado.png`
5. `05-pagina-web.png`

---

## 📁 Estructura final del repositorio

```bash
cloud-computing-semana12-azure-completo/
├── README.md
├── comandos.sh
├── web/
│   └── index.html
└── screenshots/
    └── README.md
```

---

## 📚 Referencias

- Azure Free Tier: https://azure.microsoft.com/free
- Azure Virtual Machines Linux: https://learn.microsoft.com/azure/virtual-machines/linux/quick-create-portal
- Nginx Documentation: https://nginx.org/en/docs/
- Ubuntu Server: https://ubuntu.com/download/server
