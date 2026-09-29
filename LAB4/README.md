# LAB4 - Network Scanning with Nmap

## Thông tin sinh viên

- Họ và tên: Phạm Gia Bảo
- MSSV: 1150080043
- Lớp: 11_DH_CNPM1

## Môi trường thực hành

- Host OS: Ubuntu
- Virtualization: Oracle VirtualBox 7.2.6
- Attacker: Kali Linux 2026.2
- Nmap: 7.99
- Target: Metasploitable 2
- Network: Host-Only - vboxnet0
- Kali IP: 192.168.56.10/24
- Metasploitable 2 IP: 192.168.56.101/24
- Host IP: 192.168.56.1

## Mô hình mạng

Ubuntu Host
|
vboxnet0 - 192.168.56.0/24
|
+-- Kali Linux - 192.168.56.10
|
+-- Metasploitable 2 - 192.168.56.101

## Các tình huống đã thực hiện

- Cấu hình mạng Host-Only cho môi trường Lab.
- Kiểm tra kết nối giữa Kali và Metasploitable 2.
- Host Discovery bằng Nmap.
- TCP Connect Scan.
- SYN Scan.
- FIN Scan.
- Xmas Scan.
- NULL Scan.
- ACK Scan.
- UDP Scan.
- Service/Version Detection.
- OS Detection.
- Aggressive Detection.

## Kết quả

- PASS - Kali và Metasploitable 2 kết nối thành công.
- PASS - Phát hiện Metasploitable 2 bằng Host Discovery.
- PASS - Thực hiện các kỹ thuật TCP scanning.
- PASS - Thực hiện UDP scanning.
- PASS - Nhận diện service/version bằng Nmap.
- PASS - Nhận diện hệ điều hành bằng Nmap.

## Một số kết quả chính

Nmap phát hiện nhiều dịch vụ đang mở trên Metasploitable 2, bao gồm:

- FTP
- SSH
- Telnet
- HTTP
- SMB
- MySQL
- PostgreSQL
- VNC
- IRC
- Apache Tomcat

OS Detection xác định máy đích thuộc Linux 2.6.x.

## Lỗi gặp phải và cách khắc phục

### Network is unreachable

Nguyên nhân: Kali chưa có IPv4/route phù hợp trên eth0.

Khắc phục bằng cách cấu hình lại địa chỉ:

    sudo ip addr add 192.168.56.10/24 dev eth0
    sudo ip link set eth0 up

Sau đó kiểm tra bằng:

    ip -4 addr show eth0
    ip route

### Invalid prefsrc address

Nguyên nhân: thêm route với source IP khi địa chỉ đó chưa được cấu hình hợp lệ trên interface.

Khắc phục: cấu hình IPv4 cho eth0 trước rồi kiểm tra lại route.

### Nhầm -sn và -sS

- -sn: Host Discovery.
- -sS: TCP SYN Scan.

### Nhầm -0 và -O

OS Detection sử dụng chữ O viết hoa:

    sudo nmap -O 192.168.56.101

## Kết luận

LAB4 đã được thực hiện trong mạng VirtualBox Host-Only cô lập. Các kỹ thuật Nmap chính đã được thực hiện trên máy Metasploitable 2 phục vụ mục đích thực hành an toàn thông tin.
