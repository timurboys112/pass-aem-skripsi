FROM php:8.2-apache

# Salin semua file ke direktori kerja di container
COPY . /var/www/html/

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Ubah permission (opsional)
RUN chown -R www-data:www-data /var/www/html

# Set working dir & expose port
WORKDIR /var/www/html/
EXPOSE 80