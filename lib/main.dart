import 'package:flutter/material.dart';
import 'mainpage.dart';    // Главный экран
import 'favpage.dart';     // Экран "Избранное"
import 'profilepage.dart'; // Экран "Профиль"
import 'clothes.dart';     // Модель одежды
import 'cartpage.dart';    // Экран корзины
import 'cart_item.dart';   // Модель для корзины

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
      debugShowCheckedModeBanner: false, 
      home: MainScreen(), 
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; 

  List<Clothing> favorites = []; 
  List<CartItem> cartItems = []; 

  List<Widget> _screens() => [
        ClothesList(
          favorites: favorites, 
          onFavoriteToggle: _toggleFavorite, 
          onAddToCart: _addToCart, 
        ),
        FavoritesScreen(favorites: favorites, onFavoriteToggle: _toggleFavorite),
        ProfileScreen(),
        CartScreen(
          cartItems: cartItems, 
          onRemove: _removeFromCart, 
          onQuantityChange: _changeCartItemQuantity,
        ), 
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFavorite(Clothing clothing) {
    setState(() {
      if (favorites.contains(clothing)) {
        favorites.remove(clothing);
      } else {
        favorites.add(clothing);
      }
    });
  }

  void _addToCart(Clothing clothing) {
    setState(() {
      final existingItem = cartItems.firstWhere(
        (item) => item.name == clothing.name,
        orElse: () => CartItem(name: clothing.name, imageUrl: clothing.imageUrl, price: clothing.price),
      );

      if (cartItems.contains(existingItem)) {
        existingItem.quantity++; 
      } else {
        cartItems.add(existingItem);
      }
    });
  }

  void _removeFromCart(CartItem cartItem) {
    setState(() {
      cartItems.remove(cartItem);
    });
  }

  void _changeCartItemQuantity(CartItem cartItem, int newQuantity) {
    setState(() {
      if (newQuantity <= 0) {
        cartItems.remove(cartItem); 
      } else {
        cartItem.quantity = newQuantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens()[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, 
        onTap: _onItemTapped, 
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
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
        ],
        backgroundColor: Colors.black, 
        selectedItemColor: Colors.black, 
        unselectedItemColor: const Color.fromARGB(255, 44, 44, 44),
      ),
    );
  }
}
