import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CatalogServicesScreen extends StatelessWidget {
  const CatalogServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27, top: 48),
              child: Text(
                'Каталог услуг',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat-Light',
                  letterSpacing: 0.08,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            SizedBox(height: 38),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ServiceCard(
                    title: 'ПЦР-тест на определение РНК коронавируса стандартный',
                    duration: '2 дня',
                    price: 1800,
                  ),
                  SizedBox(height: 16),
                  ServiceCard(
                    title: 'Клинический анализ крови с лейкоцитарной формулировкой',
                    duration: '1 день',
                    price: 690,
                  ),
                  SizedBox(height: 16),
                  ServiceCard(
                    title: 'Биохимический анализ крови, базовый',
                    duration: '1 день',
                    price: 2440,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String duration;
  final int price;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE0E0E0)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              letterSpacing: -0.05,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Color(0xFF939396),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$price ₽',
                    style: TextStyle(
                      fontSize: 15, // Уменьшенный размер шрифта
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  final cartProvider = Provider.of<CartProvider>(context, listen: false);
                  cartProvider.toggleItem(CartItemData(title: title, price: price, patients: 1));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Услуга "$title" ${cartProvider.items.any((i) => i.title == title) ? 'добавлена в' : 'добавлена в'} корзину'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  'Добавить',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                     color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 14, 
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Color.fromRGBO(26, 111, 238, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  minimumSize: Size(70, 40), // Минимальный размер кнопки
                  fixedSize: Size.fromHeight(40),
                  
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}