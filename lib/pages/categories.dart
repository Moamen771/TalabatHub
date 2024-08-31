import 'package:flutter/material.dart';
import 'package:talabat/pages/category_list.dart';
import 'package:talabat/componants.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<Map<String, String>> categories = [
    {'name': 'Kfc', 'products': '${kfc.length}'},
    {'name': 'MacdonaldS', 'products': '${macdonaldS.length}'},
    {'name': 'Bazooka', 'products': '${bazooka.length}'},
    {'name': 'Pizza King', 'products': '${pizzaKing.length}'},
    {'name': 'BLaban', 'products': '${bLaban.length}'},
    {'name': 'Fawaz', 'products': '${fawaz.length}'},
    {'name': 'Al Abd', 'products': '${alAbd.length}'},
    {'name': 'Al Falah', 'products': '${alFalah.length}'},
    {'name': 'Kansas', 'products': '${kansas.length}'},
  ];

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
            childAspectRatio: 1.2,
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
        onTap: () {
          if (name == 'MacdonaldS') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[0],
                  ),
                ));
          } else if (name == 'Kfc') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[1],
                  ),
                ));
          } else if (name == 'Bazooka') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[2],
                  ),
                ));
          } else if (name == 'Pizza King') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[3],
                  ),
                ));
          } else if (name == 'BLaban') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[4],
                  ),
                ));
          } else if (name == 'Fawaz') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[5],
                  ),
                ));
          } else if (name == 'Al Abd') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[6],
                  ),
                ));
          } else if (name == 'Al Falah') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[7],
                  ),
                ));
          } else if (name == 'Kansas') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryList(
                    listName: name,
                    categoryOptions: categoriesList[8],
                  ),
                ));
          }
        },
        child: Card(
          color: coolLightBlue,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.category,
                  size: 30,
                  color: Colors.white,
                ),
                // You can use different icons here
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  '$products products',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
