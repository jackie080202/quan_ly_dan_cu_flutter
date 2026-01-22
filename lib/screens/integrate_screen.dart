import 'package:flutter/material.dart';

class IntegrateScreen extends StatelessWidget {
  const IntegrateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f1ea),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text('Tích hợp thông tin'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Chip(label: Text('Lịch sử')),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Các yêu cầu tích hợp thông tin của công dân sẽ được xử lý và phê duyệt.',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {},
              child: const Text('Tạo mới yêu cầu'),
            ),
            const SizedBox(height: 24),
            _historySection('03-2025', 'B1', '03-03-2025'),
            _historySection('02-2025', 'A1', '24-02-2025'),
          ],
        ),
      ),
    );
  }

  Widget _historySection(String month, String type, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(month,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 6),
                  Text('Đã phê duyệt'),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Giấy phép lái xe',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Hạng: $type'),
              Text('Ngày tạo yêu cầu: $date'),
            ],
          ),
        ),
      ],
    );
  }
}
