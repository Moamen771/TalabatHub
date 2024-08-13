import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../componants.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<Map<String, dynamic>> products = [
    {
      'imgPath': 'images/Itachi.jpeg',
      'name': 'lotfy',
      'description': 'desc',
      'price': 11.0,
      'count': 5
    },
    {
      'imgPath': 'images/Itachi.jpeg',
      'name': 'lotfy',
      'description': 'desc',
      'price': 10.0,
      'count': 1
    },
    {
      'imgPath': 'images/Itachi.jpeg',
      'name': 'lotfy',
      'description': 'desc',
      'price': 10.0,
      'count': 5
    },
    {
      'imgPath': 'images/Itachi.jpeg',
      'name': 'lotfy',
      'description': 'desc',
      'price': 10.0,
      'count': 1
    },
  ];

  double calculateTotal(List<Map<String, dynamic>> products) {
    double sum = 0;
    for (var product in products) {
      sum += product['price'] * product['count'];
    }
    return sum;
  }

  void updateProductCount(int index, int newCount) {
    setState(() {
      products[index]['count'] = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'Shopping cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${products.length} items',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  'Edit',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Gap(10),
            Container(
              width: double.infinity,
              height: 2,
              decoration: BoxDecoration(color: Colors.black),
            ),
            Gap(10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(products.length, (index) {
                    return ProductCart(
                      imgPath: products[index]['imgPath'],
                      name: products[index]['name'],
                      description: products[index]['description'],
                      price: products[index]['price'],
                      count: products[index]['count'],
                      onCountChanged: (newCount) =>
                          updateProductCount(index, newCount),
                    );
                  }),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Sub Total',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ),
                Text(
                  '\$${calculateTotal(products).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Gap(20),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    'Check out',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        offset: Offset(-2, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: darkGreen,
                  ),
                ),
              ),
            ),
            Gap(10),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    'Continue Shopping',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCart extends StatefulWidget {
  final String imgPath;
  final String name;
  final String description;
  final double price;
  final int count;
  final Function(int) onCountChanged;

  const ProductCart(
      {required this.imgPath,
      required this.name,
      required this.description,
      required this.price,
      required this.count,
      required this.onCountChanged});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  late int count;

  @override
  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  void updateCount(int newCount) {
    if (newCount < 0) return;
    setState(() {
      count = newCount;
    });
    widget.onCountChanged(count);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   img
              Image(
                image: AssetImage(widget.imgPath),
                height: 120,
              ),
              Gap(10),
              //   text
              Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                    // price
                    Row(
                      children: [
                        Text(
                          '\$ ${widget.price}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Gap(75),
                        Container(
                          width: 75,
                          decoration: BoxDecoration(
                              color: lighterBlue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => {updateCount(count - 1)},
                                child: Icon(Icons.remove),
                              ),
                              Text(
                                '$count',
                                style: TextStyle(fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () => {updateCount(count + 1)},
                                child: Icon(Icons.add),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Gap(10),
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
