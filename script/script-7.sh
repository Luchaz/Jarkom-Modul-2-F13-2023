#!/bin/bash
7-Yudhistira(){
apt-get update
apt-get install bind9 -y
# Nomor 7
echo '
$TTL    604800
@       IN      SOA     abimanyu.f13.com. root.abimanyu.f13.com. (
                        2023101101      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      abimanyu.f13.com.
@               IN      A       10.58.3.3 ; IP Abimanyu
www             IN      CNAME   abimanyu.f13.com.
parikesit       IN      A       10.58.3.3 ; IP Abimanyu
ns1             IN      A       10.58.1.5 ; IP Werkudara
baratayuda      IN      NS      ns1
' > /etc/bind/praktikum-jarkom/abimanyu.f13.com

echo '
options {
        directory "var/cache/bind";
        //dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
' > /etc/bind/named.conf.options

echo '
zone "arjuna.f13.com" {
        type master;
        notify yes;
        also-notify { 10.58.1.5; }; // IP Werkudara
        allow-transfer { 10.58.1.5; }; // IP Werkudara
        file "/etc/bind/praktikum-jarkom/arjuna.f13.com";
};

zone "abimanyu.f13.com" {
        type master;
        file "/etc/bind/praktikum-jarkom/abimanyu.f13.com";
        allow-transfer { 10.58.1.5; }; // IP Werkudara
};

zone "3.55.10.in-addr.arpa" { 
        type master;
        file "/etc/bind/praktikum-jarkom/3.55.10.in-addr.arpa";
};' > /etc/bind/named.conf.local
service bind9 restart 
}