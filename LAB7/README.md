# LAB7 – pfSense và Web Protection
- Họ tên: Phạm Gia Bảo
- MSSV: 1150080043
- Lớp: 11_DH_CNPM1
- Ngày thực hành: 20/10/2026
- Môi trường: VirtualBox 7.2.6; pfSense CE 2.7.2; Ubuntu host; Windows Server DC01; bộ cài Ubuntu Server 24.04.5.

## Kết quả thực tế
- PASS: pfSense khởi động, hiển thị WAN/LAN/MGMT/DMZ; mở được HTTPS quản trị.
- PASS: DC01 ping gateway 10.6.0.1, DNS Server Running.
- PASS: tạo zone lab7.test và 13 bản ghi A về 172.16.6.10; normal phân giải đúng.
- Đang thực hiện: cài WEB-PROXY; chưa xác nhận reboot và IP tĩnh.

## Các bước đã làm
1. Tạo snapshot LAB7_START trên pfSense và DC01.
2. Kiểm tra IP pfSense và DC01, ping gateway.
3. Cài DNS Server, tạo primary zone lab7.test.
4. Thêm 13 bản ghi A về 172.16.6.10.
5. Tạo WEB-PROXY: 2GB RAM, 2CPU, 20GB disk, Internal Network lab6-lan; thực hiện cài Ubuntu đến reboot.

## Hồ sơ
Báo cáo Word ở thư mục này; evidence/ chứa 4 ảnh thực hành.
evidence_sha256.csv chứa SHA256 của từng ảnh.
Không bao gồm mật khẩu, backup cấu hình hay private key.
