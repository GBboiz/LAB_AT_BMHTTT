# LAB10 Remote DNS Cache Poisoning

- Họ tên: Phạm Gia Bảo
- MSSV: 1150080043
- Lớp: 11_DH_CNPM1
- Ngày thực hành: 03/11/2026
- Video LAB10: Chưa cung cấp

## Môi trường

Ubuntu host; VirtualBox 7.2.6_Ubuntur172322; pfSense CE 2.7.2 amd64.
WAN NAT Network LAB6-WAN; MGMT vboxnet0; LAN lab6-lan; DMZ lab6-dmz.
DNSLAB em4: 10.9.0.1/24. ATTACKNET dự kiến: 10.10.0.1/24, attack-net.

## Dựng môi trường và tiến độ

Đã mở WebGUI tại https://192.168.56.254 và thêm DNSLAB.
Đã khai báo NIC6 Internal Network attack-net nhưng pfSense chỉ nhận em0–em4.
Đã tắt hẳn rồi khởi động lại; lỗi thiếu em5 chưa được giải quyết.
Chưa hoàn tất các máy DNS-SERVER/VICTIM/AUTH-DNS theo yêu cầu LAB10.

## Kết quả

| Hạng mục | Kết quả |
| --- | --- |
| pfSense và WebGUI | PASS theo minh chứng |
| DNSLAB 10.9.0.1/24 | PASS theo console |
| Nhận em5 và gán ATTACKNET | CHƯA ĐẠT |
| Firewall isolation và Kali ATTACKNET | CHƯA KIỂM THỬ |
| Baseline DNS | CHƯA KIỂM THỬ |
| Remote poisoning PENDING/HIT/CACHE | CHƯA KIỂM THỬ |
| Packet capture và Fake Site | CHƯA KIỂM THỬ |
| Restore BIND9 và hardening | CHƯA KIỂM THỬ |

## Lỗi và xử lý

Startvm từng báo NS_ERROR_FAILURE; sau đó VM đã khởi động được, nguyên nhân chưa xác định.
NIC6 được khai báo nhưng ifconfig -l thiếu em5; cold boot chưa khắc phục.
Bước chẩn đoán tiếp: thu thập pciconf -l và đối chiếu thiết bị với log VirtualBox.

## Minh chứng

Ảnh thực hành trong output/. 05_terminal_transcript.txt là bản chép nội dung đã gửi, không phải log tự động.
Không có pcap hoặc log poisoning; không xác nhận tấn công thành công.
evidence_sha256.csv chứa SHA256 của từng file minh chứng. Hash kiểm tra tính toàn vẹn file, không xác minh kết quả thực hành.

## Báo cáo

11_DH_CNPM1-Lab10_1150080043-PhamGiaBao.docx.
Đây là báo cáo tiến độ chưa hoàn thành toàn bộ mục tiêu LAB10.
