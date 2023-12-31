#!/bin/bash
1-6-Yudhistira() {
echo "nameserver 192.168.122.1" > /etc/resolv.conf
ping google.com -c 5
apt-get update
apt-get install bind9 -y

# Nomor 2 (membuat domain) & 6 (Slave)
echo 'zone "arjuna.f13.com" {
        type master;
        notify yes;
        also-notify { 10.58.1.5; }; // IP Werkudara
        allow-transfer { 10.58.1.5; }; // IP Werkudara
        file "/etc/bind/praktikum-jarkom/arjuna.f13.com";
};

zone "abimanyu.f13.com" {
        type master;
        notify yes;
        also-notify { 10.58.1.5; }; // IP Werkudara
        allow-transfer { 10.58.1.5; }; // IP Werkudara
        file "/etc/bind/praktikum-jarkom/abimanyu.f13.com";
};

zone "3.55.10.in-addr.arpa" { 
        type master;
        file "/etc/bind/praktikum-jarkom/3.55.10.in-addr.arpa";
};' > /etc/bind/named.conf.local
mkdir /etc/bind/praktikum-jarkom
echo "
\$TTL    604800
@       IN      SOA     arjuna.f13.com. root.arjuna.f13.com. (
                        2023101101      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      arjuna.f13.com.
@               IN      A       10.58.2.2 ; IP Arjuna
www             IN      CNAME   arjuna.f13.com.
" > /etc/bind/praktikum-jarkom/arjuna.f13.com
        
# Nomor 3
echo "
\$TTL    604800
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
" > /etc/bind/praktikum-jarkom/abimanyu.f13.com

# Nomor 4
echo "
\$TTL    604800
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
" > /etc/bind/praktikum-jarkom/abimanyu.f13.com

# Nomor 5 (Setelah menambahkan Reverse Zone)
echo "
\$TTL    604800
@       IN      SOA     abimanyu.f13.com. root.abimanyu.f13.com. (
                        2023101101      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
3.55.10.in-addr.arpa.   IN      NS      abimanyu.f13.com.
3                       IN      PTR     abimanyu.f13.com.
" > /etc/bind/praktikum-jarkom/3.55.10.in-addr.arpa

service bind9 restart # Restart Nomor 2,3,5,6 

apt-get update
apt-get install dnsutils

# Testing domain name, cname, reverse di Nakula nameserver 10.58.1.4 (IP Yudhistira) 
}


1-6-Werkudara() {
echo "nameserver 192.168.122.1" > /etc/resolv.conf
ping google.com -c 5
apt-get update
apt-get install bind9 -y
echo 'zone "arjuna.f13.com" {
        type slave;
        masters { 10.58.1.4; }; // IP Yudhistira
        file "/var/lib/bind/arjuna.f13.com";
};

zone "abimanyu.f13.com" {
        type slave;
        masters { 10.58.1.4; }; // IP Yudhistira
        file "/var/lib/bind/abimanyu.f13.com";
};' > /etc/bind/named.conf.local

service bind9 restart
# Service bind9 stop di Yudhistira (Manual)

}