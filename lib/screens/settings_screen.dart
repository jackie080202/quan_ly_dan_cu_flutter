import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool qrAuthEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 QUAY VỀ HOME
          },
        ),
      ),
      backgroundColor: const Color(0xFFF7F3EF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Cài đặt',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Sử dụng vân tay / Khuôn mặt để mở khóa ứng dụng nhanh chóng và bảo mật hơn',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/security.png',
                    height: 80,
                    errorBuilder: (_, __, ___) => const Icon(Icons.security, size: 60),
                  ),
                ],
              ),
            ),

            // White content
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView(
                  children: [
                    const SectionTitle(title: 'Tài khoản'),

                    settingItem(
                      title: 'Lịch sử chia sẻ',
                      icon: Icons.sync_alt,
                    ),
                    settingItem(
                      title: 'Cài đặt đăng nhập',
                      icon: Icons.lock_outline,
                    ),
                    settingItem(
                      title: 'Đổi mật khẩu',
                      icon: Icons.password,
                    ),
                    settingItem(
                      title: 'Đổi passcode',
                      icon: Icons.pin,
                    ),
                    settingItem(
                      title: 'Quản lý thiết bị',
                      icon: Icons.phone_android,
                    ),

                    // Switch QR
                    SwitchListTile(
                      title: const Text('Xác minh ứng dụng qua QR code'),
                      value: qrAuthEnabled,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          qrAuthEnabled = value;
                        });
                      },
                    ),

                    settingItem(
                      title: 'Cài đặt thông báo',
                      icon: Icons.notifications_none,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingItem({required String title, required IconData icon}) {
    return ListTile(
      title: Text(title),
      trailing: Icon(icon),
      onTap: () {},
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
