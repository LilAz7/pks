import 'package:flutter/material.dart';
import 'clothes.dart'; // Убедитесь, что путь к файлу правильный

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
        fontFamily: 'Bebas Neue Cyrillic',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ClothesList(),
    );
  }
}

class ClothesList extends StatefulWidget {
  @override
  _ClothesListState createState() => _ClothesListState();
}

class _ClothesListState extends State<ClothesList> {
  // Изначальный список одежды
  List<Clothing> clothes = [
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

  // Контроллеры для текстовых полей
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  // Метод для добавления новой одежды
  void _addClothing() {
    setState(() {
      clothes.add(
        Clothing(
          name: _nameController.text,
          imageUrl: _imageUrlController.text,
          price: double.tryParse(_priceController.text) ?? 0, // Обработка ошибки при вводе цены
        ),
      );
    });

    // Очистить текстовые поля после добавления
    _nameController.clear();
    _priceController.clear();
    _imageUrlController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Доступная Одежда'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Открыть форму для добавления новой одежды
              showDialog(
              context: context,
              builder: (BuildContext context) {
              return AlertDialog(
              title: const Text('Добавить Одежду'),
              content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              TextField(
              controller: _nameController,
              decoration: const InputDecoration(
              labelText: 'Название',
              ),
              ),
              TextField(
              controller: _priceController,
              decoration: const InputDecoration(
              labelText: 'Цена',
              ),
              keyboardType: TextInputType.number, // Правильное место для параметра
              ),  
              TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
              labelText: 'URL изображения',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () {
            _addClothing();
            Navigator.of(context).pop();
          },
          child: const Text('Добавить'),
        ),
      ],
    );
  },
);
            },
          ),
        ],
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
                subtitle: Text('${clothes[index].price} ₽'),
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
