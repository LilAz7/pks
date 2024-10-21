import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            ProfileMenu(),
            ProfileFooter(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 48, 27, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Эдуард',
            style: TextStyle(
              fontFamily: "Montserrat-Light",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 22),
          Text(
            '+7 900 800-55-33',
            style: TextStyle(
              color: Color(0xFF898A8D),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat-Light',
              letterSpacing: 0.05,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'email@gmail.com',
            style: TextStyle(
              color: Color(0xFF898A8D),
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontFamily: 'Montserrat-Light',
              letterSpacing: 0.05,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 48, 27, 0),
      child: Column(
        children: [
          _buildMenuItem(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/f1b3a27ba30d5d5ee6a0f7d51780f0a4dcaabdca2c0bf74f15c510a9a4b89dd4?placeholderIfAbsent=true&apiKey=360f9df7d3f54bedb1c96ecdb7a87f2d',
            'Мои заказы',
          ),
          _buildMenuItem(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/d81e5c3ec9b95a8ce568eb603b82e391694d894c8674252e6a8294b196807548?placeholderIfAbsent=true&apiKey=360f9df7d3f54bedb1c96ecdb7a87f2d',
            'Медицинские карты',
          ),
          _buildMenuItem(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/fb8410058ef3689686487440a5141e9a0a94ce45710fa8c3a4f941ee917d1b29?placeholderIfAbsent=true&apiKey=360f9df7d3f54bedb1c96ecdb7a87f2d',
            'Мои адреса',
          ),
          _buildMenuItem(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/4be2bc13e550734c600b71ab11007868a36825453bbc9326e623296387127793?placeholderIfAbsent=true&apiKey=360f9df7d3f54bedb1c96ecdb7a87f2d',
            'Настройки',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String iconUrl, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image.network(
            iconUrl,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileFooter extends StatelessWidget {
  const ProfileFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(27, 48, 27, 0),
        child: Column(
          children: [
            Text(
              'Ответы на вопросы',
              style: TextStyle(
                color: Color(0xFF939396),
                fontSize: 15,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Политика конфиденциальности',
              style: TextStyle(
                color: Color(0xFF939396),
                fontSize: 15,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Пользовательское соглашение',
              style: TextStyle(
                color: Color(0xFF939396),
                fontSize: 15,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Выход',
              style: TextStyle(
                color: Color(0xFFFD3535),
                fontSize: 15,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}