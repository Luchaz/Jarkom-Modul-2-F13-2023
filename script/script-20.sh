# Node Abimanyu

a2enmod rewrite

echo 'RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)(abimanyu)(.*\.(png|jpg))
RewriteCond %{REQUEST_URI} !/public/images/abimanyu.png
RewriteRule abimanyu http://parikesit.abimanyu.f13.com/public/images/abimanyu.png$1 [L,R=301]' > /var/www/parikesit.abimanyu.f13/.htaccess

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.f13

  ServerName parikesit.abimanyu.f13.com
  ServerAlias www.parikesit.abimanyu.f13.com

  <Directory /var/www/parikesit.abimanyu.f13/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.f13/secret>
          Options -Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.f13>
          Options +FollowSymLinks -Multiviews
          AllowOverride All
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.f13/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.f13/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.f13/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.f13.com.conf

a2enmod rewrite

service apache2 restart

# Test
# lynx parikesit.abimanyu.f13.com/public/images/not-abimanyu.png
# lynx parikesit.abimanyu.f13.com/public/images/abimanyu-student.jpg
# lynx parikesit.abimanyu.f13.com/public/images/abimanyu.png
# lynx parikesit.abimanyu.f13.com/public/images/notabimanyujustmuseum.177013