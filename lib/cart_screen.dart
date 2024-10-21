import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Белый фон страницы
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Корзина пуста',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat-Light',
                      letterSpacing: 0.08,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Надеемся, что это значит, что у вас все хорошо!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat-Light',
                      letterSpacing: 0.08,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27, top: 48),
                  child: Text(
                    'Корзина',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat-Light',
                      letterSpacing: 0.08,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Column(
                    children: cartProvider.items.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CartItem(
                          title: item.title,
                          price: item.price,
                          patients: item.patients,
                          onPatientsChanged: (patients) {
                            cartProvider.updatePatients(index, patients);
                          },
                          onRemove: () {
                            cartProvider.removeItem(index);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(27, 40, 27, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Сумма',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat-Light',
                          letterSpacing: 0.08,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${cartProvider.totalPrice} ₽',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat-Light',
                          letterSpacing: 0.08,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 152),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Заказ оформлен'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text(
                      'Перейти к оформлению заказа',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A6FEE),
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final String title;
  final int price;
  final int patients;
  final Function(int) onPatientsChanged;
  final VoidCallback onRemove;

  const CartItem({
    Key? key,
    required this.title,
    required this.price,
    required this.patients,
    required this.onPatientsChanged,
    required this.onRemove,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int _patients;
  bool _isMinusPressed = false;
  bool _isPlusPressed = false;

  @override
  void initState() {
    super.initState();
    _patients = widget.patients;
  }

  void _incrementPatients() {
    setState(() {
      _patients++;
      _isPlusPressed = true;
      _isMinusPressed = false;
      widget.onPatientsChanged(_patients);
    });
  }

  void _decrementPatients() {
    if (_patients > 1) {
      setState(() {
        _patients--;
        _isMinusPressed = true;
        _isPlusPressed = false;
        widget.onPatientsChanged(_patients);
      });
    } else {
      widget.onRemove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE0E0E0)), 
      ),
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        height: 1.25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.price * _patients} ₽',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          '$_patients пациент${_patients > 1 ? 'а' : ''}',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFF5F5FA),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: _isMinusPressed ? Color(0xFF939396) : Color(0xFFB8C1CC),
                                size: 24,
                              ),
                              onPressed: _decrementPatients,
                            ),
                            Container(
                              width: 1,
                              height: 26,
                              color: Color(0xFFEBEBEB),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: _isPlusPressed ? Color(0xFF939396) : Color(0xFFB8C1CC),
                                size: 24,
                              ),
                              onPressed: _incrementPatients,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: -10,
            right: -10,
            child: IconButton(
              onPressed: widget.onRemove,
              icon: Icon(Icons.close, color: Color.fromRGBO(125, 125, 153, 1)),
            ),
          ),
        ],
      ),
    );
  }
}