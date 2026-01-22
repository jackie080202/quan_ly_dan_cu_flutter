import 'wallet_screen.dart';
import 'settings_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/service_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      // ===== HEADER =====
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.red),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'GIANG THÀNH LONG',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // QR buttons
                  Row(
                    children: [
                      _qrButton(
                        icon: Icons.credit_card,
                        text: 'Mã QR\nThẻ CCCD',
                      ),
                      const SizedBox(width: 12),
                      _qrButton(
                        icon: Icons.verified_user,
                        text: 'Mã QR\nĐịnh danh điện tử',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== NHÓM DỊCH VỤ =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nhóm dịch vụ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ServiceItem(
                        icon: Icons.account_balance,
                        title: 'Thủ tục\nhành chính',
                        isNew: true,
                      ),
                      ServiceItem(
                        icon: Icons.volunteer_activism,
                        title: 'An sinh\nxã hội',
                        isNew: true,
                      ),
                      ServiceItem(
                        icon: Icons.health_and_safety,
                        title: 'Hồ sơ\nsức khỏe',
                        isNew: true,
                      ),
                      ServiceItem(
                        icon: Icons.star,
                        title: 'Dịch vụ\nkhác',
                        isNew: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== BANNER =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Banner thông báo / sự kiện',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      // ===== BOTTOM NAV =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const WalletScreen(), ),
          );
          }
          if (index == 4) {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingsScreen(), ),
          );
           if (index == 2) {
          // TODO: mở QR screen sau
          return;
          }
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Ví giấy tờ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }

  Widget _qrButton({required IconData icon, required String text}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffffe0b2),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.red),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
