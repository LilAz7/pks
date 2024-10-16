import 'package:flutter/material.dart';
import 'clothes.dart'; // Импортируем модель данных

class ClothesList extends StatelessWidget {
  final List<Clothing> favorites;
  final Function(Clothing) onFavoriteToggle;

  ClothesList({required this.favorites, required this.onFavoriteToggle});

  // Изначальный список одежды
  final List<Clothing> clothes = [
    Clothing(
      name: 'Футболка',
      imageUrl: '../lib/images/tshirt.jpeg',
      price: 1200,
    ),
    Clothing(
      name: 'Джинсы',
      imageUrl: '../lib/images/jeans.jpeg',
      price: 2500,
    ),
    Clothing(
      name: 'Куртка',
      imageUrl: '../lib/images/jacket.jpeg',
      price: 5000,
    ),
    Clothing(
      name: 'Кроссовки',
      imageUrl: '../lib/images/sneakers.jpeg',
      price: 4500,
    ),
  ];

  // Проверка, находится ли товар в избранном
  bool _isFavorite(Clothing clothing) {
    return favorites.contains(clothing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Доступная Одежда'),
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Colors.black, width: 1),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              leading: Image.network(clothes[index].imageUrl), // Изображение одежды
              title: Text(clothes[index].name),
              subtitle: Text('${clothes[index].price} ₽'),
              trailing: IconButton(
                icon: Icon(
                  _isFavorite(clothes[index]) ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite(clothes[index]) ? Colors.red : null,
                ),
                onPressed: () {
                  onFavoriteToggle(clothes[index]);
                },
              ), // Сердечко для добавления в избранное
            ),
          );
        },
      ),
    );
  }
}