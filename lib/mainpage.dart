import 'package:flutter/material.dart';
import 'clothes.dart';
import 'cart_item.dart';

class ClothesList extends StatelessWidget {
  final List<Clothing> favorites;
  final Function(Clothing) onFavoriteToggle;
  final Function(Clothing) onAddToCart;

  const ClothesList({
    Key? key,
    required this.favorites,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Clothing> clothingItems = [
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

    return ListView.builder(
      itemCount: clothingItems.length,
      itemBuilder: (context, index) {
        final clothing = clothingItems[index];
        final isFavorite = favorites.contains(clothing);

        return Card(
          elevation: 2,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading: Image.network(clothing.imageUrl, width: 60, fit: BoxFit.cover),
            title: Text(
              clothing.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${clothing.price} руб.'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  iconSize: 25,
                  onPressed: () {
                    onAddToCart(clothing);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${clothing.name} добавлена в корзину')),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  iconSize: 25,
                  onPressed: () {
                    onFavoriteToggle(clothing);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
