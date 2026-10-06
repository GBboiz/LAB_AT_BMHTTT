# LAB5 — Thiết lập tường lửa pfSense

- Họ tên: Phạm Gia Bảo
- MSSV: 1150080043
- Lớp: 11_DH_CNPM1
- Ngày thực hành: 06/10/2026

## Trạng thái
Đã hoàn thành phần cấu hình pfSense và kiểm tra kết nối IP từ WAN. **Chưa hoàn thành toàn bộ bài lab**: chưa dựng Windows Server/DC, DMZ-Web/IIS, LAN-Test; chưa kiểm thử các tình huống firewall. Không coi ping từ pfSense là minh chứng rule LAN.

## Môi trường
Ubuntu host; VirtualBox 7.2.6_Ubuntur172322; pfSense CE 2.7.2-RELEASE amd64; VM 2 GiB RAM, 2 vCPU, VDI 20 GiB.

| Thành phần | Thiết lập |
|---|---|
| WAN / em0 | Bridged eno1; DHCP; IP tại thời điểm chụp: 172.29.141.141/24 |
| LAN / em1 | Host-only vboxnet4; 10.0.0.1/8 |
| Ubuntu host quản trị | 10.0.0.100/8; không gateway/DNS trên Host-only |
| DMZ / em2 | Internal Network dmz-net; 172.16.0.1/16; gateway None |
| Outbound NAT | Hybrid; Automatic Rules chứa LAN và DMZ |

## Cách dựng đã thực hiện
1. Tải ISO pfSense CE 2.7.2 theo tài liệu; giải nén và gắn ISO. Chưa có ảnh/log xác nhận checksum trong gói minh chứng.
2. Tạo VM và ba card WAN/LAN/DMZ; cài Auto UFS, Entire Disk, MBR.
3. Tháo ISO sau cài đặt, khởi động từ VDI.
4. Đặt LAN 10.0.0.1/8, tắt DHCP, giữ HTTPS; truy cập https://10.0.0.1 từ host.
5. Hoàn tất Wizard, đặt múi giờ Việt Nam và đổi mật khẩu admin.
6. Gán em2 làm DMZ 172.16.0.1/16, không upstream gateway.
7. Kiểm tra NAT tự động; tắt hai default allow LAN IPv4/IPv6, giữ Anti-Lockout; tạo Pass IPv4 LAN net → any.
8. Ping từ WAN của pfSense đến 8.8.8.8.

## Kết quả
| Nội dung | Trạng thái | Minh chứng |
|---|---|---|
| LAN 10.0.0.1/8 | PASS — cấu hình | evidence/01_lan_ip.png |
| Dashboard | PASS — khởi động | evidence/02_dashboard.png |
| Gán interface | PASS — cấu hình | evidence/03_interface_assignments.png |
| DMZ 172.16.0.1/16 | PASS — cấu hình | evidence/04_dmz.png |
| NAT chứa LAN và DMZ | PASS — cấu hình | evidence/05_outbound_nat.png |
| Rule LAN nền tảng | PASS — cấu hình; chưa kiểm thử từ LAN | evidence/06_lan_rules.png |
| Ping WAN 8.8.8.8 | PASS — 3/3 phản hồi, 0% mất gói | evidence/07_wan_ping.png |
| Reset States | Chưa có ảnh xác nhận | — |
| Bật/tắt rule LAN và test từ DC | Chưa thực hiện | — |
| Chặn ICMP, cho DNS/Web | Chưa thực hiện | — |
| Chỉ một host ra Internet | Chưa thực hiện | — |
| Cô lập DMZ khỏi LAN | Chưa thực hiện | — |
| Port Forward WAN → IIS | Chưa thực hiện | — |
| Logging lưu lượng bị chặn | Chưa thực hiện | — |

## Lỗi và khắc phục
- Sau cài đặt máy quay lại trình cài đặt: tháo ISO, đặt boot1=disk rồi bật lại; console pfSense đã xuất hiện.
- Hostname Dashboard đang hiển thị pfSensepfsense-lab5.home.arpa: đã hướng dẫn sửa thành pfsense-lab5; chưa có ảnh xác nhận sau sửa.

## Tệp
- BaoCao-LAB5_1150080043-PhamGiaBao.docx: báo cáo tiến độ và câu trả lời lý thuyết.
- evidence/: ảnh thật do sinh viên cung cấp.
- evidence_sha256.csv: checksum ảnh trong gói.

## Phần còn thiếu để đáp ứng đề
Báo cáo yêu cầu tối thiểu 4 tình huống firewall kèm ảnh rule, kiểm thử và giải thích. Cô lập DMZ cần baseline thành công và kết quả bị chặn; disable rule LAN cần minh chứng default allow Disabled và Reset States. Cần thêm ảnh ba adapter VirtualBox. Tài liệu ghi Lab5 nhưng mẫu tên báo cáo ghi Lab3; cần đối chiếu quy định lớp trước khi đổi tên nộp.
Không tải ISO, VDI, mật khẩu hoặc file cấu hình chứa bí mật lên repository.
