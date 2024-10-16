import 'package:flutter/material.dart';
import 'clothes.dart'; // Импортируем модель данных

class FavoritesScreen extends StatelessWidget {
  final List<Clothing> favorites;
  final Function(Clothing) onFavoriteToggle;

  FavoritesScreen({required this.favorites, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('У вас нет избранных товаров.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    leading: Image.network(favorites[index].imageUrl),
                    title: Text(favorites[index].name),
                    subtitle: Text('${favorites[index].price} ₽'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        onFavoriteToggle(favorites[index]);
                      },
                    ), // Кнопка для удаления из избранного
                  ),
                );
              },
            ),
    );
  }
}