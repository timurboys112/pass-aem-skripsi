FROM php:8.2-apache

# Salin semua file
COPY . /var/www/html/

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Ganti port Apache ke $PORT dari Railway
RUN sed -i "s/80/\${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

# Permission (opsional)
RUN chown -R www-data:www-data /var/www/html

# Set working dir
WORKDIR /var/www/html

# Start Apache di foreground (ini penting!)
CMD ["apache2-foreground"]