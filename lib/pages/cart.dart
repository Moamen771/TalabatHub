import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talabat/pages/main_home.dart';
import '../componants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<Map<String, dynamic>> products = [];

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? stringList = pref.getStringList('items');
    if (stringList != null) {
      List<Map<String, dynamic>> loadedItems = stringList
          .map((item) => jsonDecode(item) as Map<String, dynamic>)
          .map((item) => {
                'image': item['image'] ?? 'default_image_path.png',
                'name': item['name'] ?? 'Unknown',
                'description': item['description'] ?? 'No description',
                'price': double.tryParse(item['price']) ?? 0.00,
                'count': 1,
              })
          .toList();
      setState(() {
        products.clear();
        products.addAll(loadedItems);
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void removeProduct(int index) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? stringList = pref.getStringList('items');
    if (stringList != null) {
      stringList.removeAt(index);
      await pref.setStringList('items', stringList);
      getData();
    }
  }

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  style: const TextStyle(fontSize: 17),
                ),
                const Text(
                  'Edit',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 2,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            const Gap(10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(products.length, (index) {
                      return ProductCart(
                          imgPath: products[index]['image'],
                          name: products[index]['name'],
                          description: 'description',
                          price: products[index]['price'],
                          count: products[index]['count'],
                          index: index,
                          onCountChanged: (newCount) =>
                              updateProductCount(index, newCount),
                          onRemove: (index) => removeProduct(index));
                    }),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Sub Total',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                        ),
                        Text(
                          '\$${calculateTotal(products).toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Gap(20),
                    GestureDetector(
                      onTap: () {
                        if (products.isNotEmpty) {
                          Fluttertoast.showToast(
                            msg: "Processing Checkout",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: darkerBlue,
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
                      },
                      child: Center(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                offset: Offset(-2, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: normalBlue,
                          ),
                          child: const Center(
                              child: Text(
                            'Check out',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: Center(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          child: const Center(
                              child: Text(
                            'Continue Shopping',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ],
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
  final int index;
  final Function(int) onCountChanged;
  final Function(int) onRemove;

  const ProductCart({
    super.key,
    required this.imgPath,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    required this.index,
    required this.onCountChanged,
    required this.onRemove,
  });

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
    // count = int.parse(widget.count);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   img
              Image(
                image: AssetImage(widget.imgPath),
                height: 100,
              ),
              const Gap(10),
              //   text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget.description,
                              style: TextStyle(fontSize: 15, color: darkerBlue),
                            ),
                          ],
                        ),
                        const Gap(20),
                        IconButton(
                          onPressed: () {
                            widget.onRemove(widget.index);
                          },
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: darkerBlue,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const Gap(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${widget.price}',
                          style: TextStyle(
                              fontSize: 20,
                              color: darkerBlue,
                              fontWeight: FontWeight.w700),
                        ),
                        const Gap(40),
                        Container(
                          width: 75,
                          decoration: BoxDecoration(
                              color: normalBlue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => {updateCount(count - 1)},
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '$count',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () => {updateCount(count + 1)},
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Container(
            width: double.infinity,
            height: 2,
            decoration: const BoxDecoration(color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
