import 'package:flutter/material.dart';
import 'package:talabathub/componants.dart';

class CategoryList extends StatelessWidget {
  const CategoryList(
      {super.key, required this.categoryOptions, required this.listName});

  final List categoryOptions;
  final String listName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: normalBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          listName,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .7,
        ),
        itemCount: categoryOptions.length,
        itemBuilder: (context, index) {
          return container(
            image: categoryOptions[index]['image'],
            name: categoryOptions[index]['name'],
            price: categoryOptions[index]['price'],
          );
        },
      ),
    );
  }
}
