# Node Abimanyu
wget -O '/var/www/parikesit.abimanyu.f13.com' 'https://drive.usercontent.google.com/download?id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS'
unzip -o /var/www/parikesit.abimanyu.f13.com -d /var/www/
mv /var/www/parikesit.abimanyu.yyy.com /var/www/parikesit.abimanyu.f13
rm /var/www/parikesit.abimanyu.f13.com
rm -rf /var/www/parikesit.abimanyu.yyy.com
mkdir /var/www/parikesit.abimanyu.f13/secret

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

  Alias "/public" "/var/www/parikesit.abimanyu.f13/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.f13/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.f13/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.f13.com.conf

a2ensite parikesit.abimanyu.f13.com.conf

service apache2 restart

# Node Client
# lynx parikesit.abimanyu.f13.com (Run command no 13)
# lynx parikesit.abimanyu.f13.com/public (Run command no 14)
# lynx parikesit.abimanyu.f13.com/secret (Run command no 14)
# lynx parikesit.abimanyu.f13.com/testerror (Run command no 15)
# lynx parikesit.abimanyu.f13.com/secret (Run command no 15)
# lynx parikesit.abimanyu.f13.com/js (Run command no 16)