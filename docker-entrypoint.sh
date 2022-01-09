#!bin/sh

# /opt/htmlが存在しないならlaravelプロジェクトを立ち上げる
if [ -d /opt/html ] ; then
composer create-project laravel/laravel --prefer-dist --remove-vcs .
chmod -R 777 /opt/html/storage
fi

# nginx起動
service nginx start

# php-fpm起動
service php7.4-fpm start

# コンテナがプロセスを手放さないようにする
bash