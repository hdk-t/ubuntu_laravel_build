FROM ubuntu:latest

RUN mkdir /opt/html
WORKDIR /opt/html

# 日付設定
ENV TZ Asia/Tokyo

# これをしないと　apt install　の途中で止まっちゃう
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt-get update

# 基本コマンドインストール
RUN apt install curl -y
RUN apt install zip -y
RUN apt install php-curl -y
RUN apt install git -y

# PHP7.4インストール
RUN apt install php7.4 -y
RUN apt install php7.4-mbstring -y
RUN apt install php7.4-dom -y
RUN apt-get install php-mysql -y

# php.iniをコピー
COPY php.ini /etc/php/7.4/cli/

# Composerインストール
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/bin/composer

# npm,nodejsインストール
RUN apt install npm -y
RUN npm install -g n
RUN n latest

# PHP-FPMインストール
RUN apt install php7.4-fpm -y

# nginxインストール
RUN apt install nginx -y

# 設定ファイルをコピー
COPY default /etc/nginx/sites-available/

# docker-entrypoint.shをコピー
COPY docker-entrypoint.sh /usr/bin/

# 実行権限付与
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["bash", "docker-entrypoint.sh"]
