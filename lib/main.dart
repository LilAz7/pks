import 'package:flutter/material.dart';
import 'clothes.dart'; // Импортируем второй файл с моделью данных

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
      home: ClothesList(),
    );
  }
}

class ClothesList extends StatelessWidget {
  final List<Clothing> clothes = [
    Clothing(
      name: 'Футболка',
      imageUrl: '../lib/images/tshirt.jpeg',
      price: 1200, // Цены в рублях
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Доступная Одежда'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                title: Text(clothes[index].name),
                subtitle:
                    Text('${clothes[index].price} ₽'), // Формат цен в рублях
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ClothingDetail(clothing: clothes[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClothingDetail extends StatelessWidget {
  final Clothing clothing;

  ClothingDetail({required this.clothing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clothing.name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(clothing.imageUrl),
              const SizedBox(height: 8),
              Text(clothing.name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(height: 16),
              Text('${clothing.price} ₽',
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 13, 14, 13))),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Купить ${clothing.name}',
                          style: const TextStyle(color: Colors.black)),
                      content: const Text('Вы желаете купить эту одежду?',
                          style: TextStyle(color: Colors.black)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Да',
                              style: TextStyle(color: Colors.black)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Нет',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Купить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
