import 'package:flutter/material.dart';
import 'integrate_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f1ea),
      appBar: AppBar(
        title: const Text('Ví giấy tờ'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // CCCD CARD
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  'Căn cước công dân điện tử',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BUTTON
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => _showBottomSheet(context),
                child: const Text('Xuất trình giấy tờ'),
              ),
            ),

            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tích hợp và xuất trình',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _optionCard(
                    icon: Icons.add_card,
                    title: 'Tích hợp giấy tờ',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const IntegrateScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _optionCard(
                    icon: Icons.output,
                    title: 'Xuất trình giấy tờ',
                    onTap: () => _showBottomSheet(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.red),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const _SelectDocumentSheet(),
    );
  }
}

class _SelectDocumentSheet extends StatefulWidget {
  const _SelectDocumentSheet();

  @override
  State<_SelectDocumentSheet> createState() => _SelectDocumentSheetState();
}

class _SelectDocumentSheetState extends State<_SelectDocumentSheet> {
  final Map<String, bool> docs = {
    'Thẻ căn cước/CCCD': false,
    'Căn cước điện tử': false,
    'Thông tin cư trú': false,
    'Thẻ bảo hiểm y tế': false,
    'GPLX hạng A1': false,
    'GPLX hạng B1': false,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Chọn giấy tờ muốn xuất trình',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...docs.keys.map(
            (key) => CheckboxListTile(
              title: Text(key),
              value: docs[key],
              onChanged: (v) {
                setState(() {
                  docs[key] = v!;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(context),
              child: const Text('Xác nhận'),
            ),
          ),
        ],
      ),
    );
  }
}
