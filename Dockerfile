FROM drupal:latest

WORKDIR /var/www/html

# Drupal coreのインストール
COPY ./composer.json ./composer.json
RUN composer install

# Drushのインストール
RUN composer require drush/drush

# Drushコマンドをグローバルに利用可能にするためのシンボリックリンクの作成
RUN ln -s /var/www/html/vendor/drush/drush/drush /usr/local/bin/drush

CMD ["apache2-foreground"]
