import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('../lib/images/avatar.jpg'), // Пример аватара
            ),
            SizedBox(height: 16),
            Text(
              'Имя: Андрей',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Фамилия: Чебан',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}