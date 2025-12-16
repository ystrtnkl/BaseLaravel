# TÍTULO
asdf

# INSTRUCCIONES PARA EL DESPLIEGUE
## Requerimientos
- Docker instalado, no es necesario tener Kubernetes. Al desplegar se descargarán imágenes adicionales.
- Un visor de bases de datos compatible con MariaDB, como DBeaver o DBVis
- A poder ser ejecutar en una máquina Linux, ya que los scripts de despliegue automático están pensados en Bash
- Firefox (el script de despliegue automático abre la página con firefox mediante el comando, esto se puede eliminar a gusto, habría que abrir manualmente http://localhost:8081/)
## Pasos (versión automática)
- Ejecutar: `sh .docker/auto.sh ; exit`
- Por defecto se formará el entorno Docker y se abrirá la página en Firefox, si esto último falla, abrir http://localhost:8081/
- Es posible que haya que ejecutar algunos de los comandos comentados en dicho script

# FUNCIONAMIENTO
asdf

## License
This project is licensed under the GNU General Public License v3.0.  
See the [LICENSE](./LICENSE.txt) file for details.
