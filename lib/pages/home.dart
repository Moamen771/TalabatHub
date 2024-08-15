import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talabathub/componants.dart';
import 'package:talabathub/pages/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {
        'name': 'MacdonaldS',
      },
      {
        'name': 'Kfc',
      },
      {
        'name': 'Pizza King',
      },
      {
        'name': 'Bazooka',
      },
      {
        'name': 'BLaban',
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: darkGray,
                          blurRadius: 20,
                          offset: const Offset(0, 10)),
                    ],
                    image: const DecorationImage(
                        image: AssetImage('images/Talabat_home.jpg'),
                        fit: BoxFit.fill)),
              ),
              const Gap(20),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40),
                  itemCount: restaurant.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        String name = categories[index]['name']!;
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
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: normalGray, width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: darkGray,
                                  blurRadius: 20,
                                  offset: const Offset(0, 10)),
                            ]),
                        child: Image(
                          image: AssetImage(restaurant[index]['image']),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
