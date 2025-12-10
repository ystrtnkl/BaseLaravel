# CRUD-Votaciones
Un CRUD básico para registrar usuarios que podrán crear y participar en encuestas sencillas.
Instalar dependencias de composer con: cd varwwwhtml/proyecto/ ; composer install ; composer update ;
Se puede iniciar con: sh .docker/auto.sh

# Proyecto
Este sería el proyecto de PHP del primer trimestre de 2ºDAW 2025-2026 de Eloy

# INSTRUCCIONES PARA EL DESPLIEGUE
## Requerimientos
- Docker instalado, no es necesario tener Kubernetes. Al desplegar se descargarán imágenes adicionales.
- Un visor de bases de datos compatible con MariaDB, como DBeaver o DBVis
- A poder ser ejecutar en una máquina Linux, ya que los scripts de despliegue automático están pensados en Bash
- Firefox (el script de despliegue automático abre la página con firefox mediante el comando, esto se puede eliminar a gusto, habría que abrir manualmente http://localhost:8081/)
## Pasos (versión automática)
- Ejecutar: `sh .docker/auto.sh ; exit`
- Por defecto se formará el entorno Docker y se abrirá la página en Firefox, si esto último falla, abrir http://localhost:8081/
## Pasos (versión manual si los scripts no funcionan)
- Crear las siguientes carpetas manualmente si no existen: `./varwwwhtml/proyecto/public/files/fotosPerfil/`, `./varwwwhtml/proyecto/public/files/portadasEncuestas/`, `./varwwwhtml/proyecto/files/`
- Ejecutar: `docker compose up` estando en el mismo sitio que la carpeta .docker
- Ejecutar una vez desplegado (para solucionar los permisos): `docker exec -it crud-votaciones-mariadb-cont-1 /bin/chmod -R 777 /var/lib/mysql`, `docker exec -it apache_php-cont /bin/chmod -R 777 /var/www/html`, `docker exec -it apache_php-cont bash -c 'while true; do chmod -R 777 /var/www/html; sleep 2; done'`
- Si algún comando se quedó estancado, presionar Ctrl + C
## Pasos adicionales para la base de datos
- Una vez desplegada la aplicación, abrir una conexión a MariaDB en localhost con los parámetros especificados en el archivo `secretEnv.php` o `.docker/.env`
- Una vez establecida la conexión (y autorizado correctamente), ejecutar todo el código del archivo `./varwwwhtml/proyecto/sql/crearTodo.sql`, esto creará las tablas necesarias
- Para disponer de datos de ejemplo, hacer lo mismo pero con el código en `./varwwwhtml/proyecto/sql/datosEjemplo.sql`, la contraseña usada por los usuarios en estos ejemplos es `123456789.A`

# FUNCIONAMIENTO
- Se pueden crear usuarios, iniciar sesión con los ya existentes, borrar con la autorización necesaria, editar los datos y cambiar la foto
- La aplicación viene con un generador de contraseñas
- Las fotos de los usuarios (las nuevas que se suban) se guardan en los archivos del contenedor
- En el despliegue del entorno de Docker se especifica una base de datos MongoDB, pero de momento no se usa
- La aplicación está pensada para que dichos usuarios puedan crear/rellenar encuestas, y los creadores de dichas encuestas puedan revisar las respuestas
- Aunque la aplicación tiene frontend y backend en el mismo proyecto, dispone de una API REST totalmente funcional con otro frontend
- También tiene un contenedor de Redis, aunque de momento tampoco se usa (al menos no directamente)

## License
This project is licensed under the GNU General Public License v3.0.  
See the [LICENSE](./LICENSE.txt) file for details.
