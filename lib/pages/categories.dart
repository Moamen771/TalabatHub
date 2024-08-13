import 'package:flutter/material.dart';
import 'package:talabathub/pages/category_list.dart';
import 'package:talabathub/componants.dart';


class CategoriesPage extends StatelessWidget {
  List categriesItems = categoriesList ;
  final List<Map<String, String>> categories = [
    {'name': 'Clothes', 'products': '12,175,280'},
    {'name': 'Food', 'products': '6,337,738'},
    {'name': 'Automotive', 'products': '4,421,731'},
    {'name': 'Baby Products', 'products': '1,808,264'},
    {'name': 'Beauty', 'products': '2,115,043'},
    {'name': 'Business, Industry & Science', 'products': '2,172,411'},
    {'name': 'Computers & Accessories', 'products': '2,440,206'},
    {'name': 'Electronics & Photo', 'products': '7,049,698'},
    {'name': 'Garden & Outdoors', 'products': '3,218,350'},
  ];

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
                name: categories[index]['name']!,
                products: categories[index]['products']!,
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String products;

  const CategoryCard({
    super.key,
    required this.name,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(name == 'Food'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList(listName: name,categoryOptions: categoriesList[0],),));
        }
        else if(name == 'Clothes'){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryList(listName: name,categoryOptions: categoriesList[1],),));
        }
      },
    child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.category, size: 30), // You can use different icons here
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text('$products products'),
            ],
          ),
        ),
      )
    );
  }
}