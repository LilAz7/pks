import 'package:flutter/material.dart';
import 'mainpage.dart';    // Главный экран
import 'favpage.dart';     // Экран "Избранное"
import 'profilepage.dart'; // Экран "Профиль"
import 'clothes.dart';     // Модель одежды

void main() {
  runApp(ClothesApp());
}

class ClothesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин Одежды',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 230, 240, 250),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false, // Убираем debug banner
      home: MainScreen(), // Стартовый экран с навигацией
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Индекс выбранного экрана

  List<Clothing> favorites = []; // Список избранного

  // Список экранов
  List<Widget> _screens() => [
        ClothesList(favorites: favorites, onFavoriteToggle: _toggleFavorite),  // Главная страница (с передачей избранного)
        FavoritesScreen(favorites: favorites, onFavoriteToggle: _toggleFavorite),  // Экран "Избранное"
        ProfileScreen(),   // Экран "Профиль"
      ];

  // Метод для изменения индекса при нажатии на нижнюю панель
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Метод для добавления/удаления из избранного
  void _toggleFavorite(Clothing clothing) {
    setState(() {
      if (favorites.contains(clothing)) {
        favorites.remove(clothing);
      } else {
        favorites.add(clothing);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens()[_selectedIndex], // Отображение текущего экрана
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Текущий выбранный экран
        onTap: _onItemTapped, // Метод при нажатии
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
