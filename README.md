# Jarkom-Modul-2-F13-2022

| **No** | **Nama**                         | **NRP**    |
| ------ | -------------------------------- | ---------- |
| 1      | Helmi Abiyu Mahendra             | 5025211061 |
| 2      | Muhammad Naufal Fawwaz Ramadhan  | 5025211223 |


--------------------------------

## Soal 1
Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut 
<hr style="width:60%;text-align:center">

![1](images/1.png)

Konfigurasi setiap node sebagai berikut:
Router: 
 - **Pandudewanata**
    ```
   auto eth0
   iface eth0 inet dhcp

    auto eth1
    iface eth1 inet static
	address 10.58.1.1
	netmask 255.255.255.0

    auto eth2
    iface eth2 inet static
	address 10.58.2.1
	netmask 255.255.255.0

    auto eth3
    iface eth3 inet static
	address 10.58.3.1
	netmask 255.255.255.0
    ```

Client:
 - **Sadewa**
    ```
    auto eth0
    iface eth0 inet static
	address 10.58.1.3
	netmask 255.255.255.0
	gateway 10.58.1.1
    ```
 - **Nakula**
    ```
    auto eth0
    iface eth0 inet static
	address 10.58.1.2
	netmask 255.255.255.0
	gateway 10.58.1.1
    ```

DNS Server:
 - **Yudhistira**
    ```
    auto eth0
    iface eth0 inet static
	address 10.58.1.4
	netmask 255.255.255.0
	gateway 10.58.1.1
    ```
 - **Werkudara**
    ```
    auto eth0
    iface eth0 inet static
	address 10.58.1.5
	netmask 255.255.255.0
	gateway 10.58.1.1
    ```

Load Balancer:
 - **Arjuna**
    ```
    auto eth0
    iface eth0 inet static
	address 10.58.2.2
	netmask 255.255.255.0
	gateway 10.58.2.1
    ```

Web Server:
 - **Prabukusuma**
    ```
   auto eth0
    iface eth0 inet static
	address 10.58.3.4
	netmask 255.255.255.0
	gateway 10.58.3.1
    ```
 - **Wisanggeni**
    ```
    auto eth0
    iface eth0 inet static
	address 10.58.3.2
	netmask 255.255.255.0
	gateway 10.58.3.1
    ```
 - **Abimanyu**
    ```
    auto eth0
    iface eth0 inet static
	address 10.58.3.3
	netmask 255.255.255.0
	gateway 10.58.3.1
    ```

## Soal 2
Buatlah website utama pada node arjuna dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.

## Soal 3
Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

## Soal 4
Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

## Soal 5
Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)

## Soal 6
Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

## Soal 7
Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.

## Soal 8
Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.

## Soal 9
Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.

## Soal 10
Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh
    - Prabakusuma:8001
    - Abimanyu:8002
    - Wisanggeni:8003

## Soal 11
Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy

## Soal 12
Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.

## Soal 13
Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy

## Soal 14
Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

## Soal 15
Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

## Soal 16
Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi 
www.parikesit.abimanyu.yyy.com/js 

## Soal 17
Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

## Soal 18
Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

## Soal 19
Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)

## Soal 20
Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.
