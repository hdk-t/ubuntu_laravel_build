# ubuntu_laravel_build
Laravel on Ubuntu Docker Container !  

DockerHub  
https://hub.docker.com/r/thideki/ubuntu_laravel

# Environment  
Ubuntu: latest  
PHP: 7.4  
npm: latest  
node.js: latest  
Composer: latest  
Laravel(php artisan --version): latest  
Nginx: latest  

# Image Building
    docker build ./ -t ubuntu_laravel:latest  

# Docker Run
If /opt/html is empty then create Laravel project in /opt/html  
See docker-entrypoint.sh for details  

    docker run -it --name ubuntu_laravel -p 80:80 ubuntu_laravel:latest  
