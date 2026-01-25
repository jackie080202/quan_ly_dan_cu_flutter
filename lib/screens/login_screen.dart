import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                'Vui lòng nhập thông tin đăng nhập để tiếp tục',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Thông tin người dùng
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GIANG THÀNH LONG',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('03******47'),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.verified, color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Mật khẩu',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Nhập mật khẩu',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Nút đăng nhập
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Quên mật khẩu',
                        style: TextStyle(color: Colors.red),
                      ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                        // TODO: xử lý đổi tài khoản sau
                    },
                    child: const Text(
                      'Quên mật khẩu',
                        style: TextStyle(color: Colors.red),
                      ),
                  )
                ]
              ),


              const Spacer(),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  FooterItem(Icons.menu_book, 'Hướng dẫn\nsử dụng'),
                  FooterItem(Icons.help_outline, 'Câu hỏi\nthường gặp'),
                  FooterItem(Icons.phone, 'Hotline\nhỗ trợ'),
                ],
              ),

              const SizedBox(height: 20),

              const Center(
                child: Column(
                  children: [
                    Text(
                      'Chính sách quyền riêng tư',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    SizedBox(height: 6),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FooterItem(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 6),
        Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
