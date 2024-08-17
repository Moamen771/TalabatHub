import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../componants.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  final List<Map<String, dynamic>> favproducts = [];

  void getFavData() async {
    final SharedPreferences prefFav = await SharedPreferences.getInstance();
    List<String>? favList = prefFav.getStringList('fav');
    if (favList != null) {
      List<Map<String, dynamic>> favItems = favList
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
        favproducts.clear();
        favproducts.addAll(favItems);
      });
    }
  }

  @override
  void initState() {
    getFavData();
    super.initState();
  }

  void removeProduct(int index) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? favList = pref.getStringList('fav');
    if (favList != null) {
      favList.removeAt(index);
      await pref.setStringList('fav', favList);
      getFavData();
    }
  }

  void updateProductCount(int index, int newCount) {
    setState(() {
      favproducts[index]['count'] = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " your Favourite",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(favproducts.length, (index) {
              return ProductCart(
                  imgPath: favproducts[index]['image'],
                  name: favproducts[index]['name'],
                  description: 'description',
                  price: favproducts[index]['price'],
                  count: favproducts[index]['count'],
                  index: index,
                  onCountChanged: (newCount) =>
                      updateProductCount(index, newCount),
                  onRemove: (index) => removeProduct(index));
            }),
          ),
        ),
      ),
      // body: Container(
      //   color: Colors.red,
      //   width: 50,
      //   height: 50,
      // ),
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
                            color: coolLightBlue,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const Gap(25),
                    Row(
                      children: [
                        Text(
                          '${widget.price}',
                          style: TextStyle(
                              fontSize: 20,
                              color: coolLightBlue,
                              fontWeight: FontWeight.w700),
                        ),
                        Gap(5),
                        Text('EG'),
                        const Gap(40),
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
