#!/bin/bash
#cd ..
#composer create-project laravel/laravel proyecto
#cd varwww/proyecto
#npm install
#composer install
#composer update
#composer dump-autoload
#cd ../..
#php artisan migrate
#php artisan serve
docker compose down
docker compose up -d
firefox http://localhost:8081/inicio &
docker exec -it crud-votaciones-mariadb-cont-1 /bin/chmod -R 777 /var/lib/mysql
docker exec -it apache_php-cont /bin/chmod -R 777 /var/www/html
docker exec -it apache_php-cont bash -c 'while true; do chmod -R 777 /var/www/html; sleep 2; done' #&



#docker exec -it apache_php-cont /var/www/html/perms.sh

