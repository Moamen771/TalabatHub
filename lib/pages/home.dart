import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talabat/componants.dart';
import 'package:talabat/pages/categories.dart';
import 'package:talabat/pages/category_list.dart';

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
      {'name': 'Al Abd'}
    ];
    final List firstOption = [
      macdonaldS[0],
      kfc[0],
      bazooka[0],
      pizzaKing[0],
      bLaban[0],
      alAbd[0]
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(5),
                  Text(
                    'Food menu',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: coolLightBlue),
                  ),
                  Container(
                    height: 3,
                    width: 155,
                    color: coolLightBlue,
                  ),
                  const Gap(5),
                  Text(
                    'Choose your best food have a great day',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const Gap(20),
              SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: firstOption.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryList(
                                  listName: 'MacdonaldS',
                                  categoryOptions: categoriesList[0],
                                ),
                              ));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryList(
                                  listName: 'Kfc',
                                  categoryOptions: categoriesList[1],
                                ),
                              ));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryList(
                                  listName: 'Bazooka',
                                  categoryOptions: categoriesList[2],
                                ),
                              ));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryList(
                                  listName: 'Pizza King',
                                  categoryOptions: categoriesList[3],
                                ),
                              ));
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryList(
                                  listName: 'BLaban',
                                  categoryOptions: categoriesList[4],
                                ),
                              ));
                        } else if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryList(
                                  listName: 'Al Abd',
                                  categoryOptions: categoriesList[6],
                                ),
                              ));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: normalGray, width: 3),
                          boxShadow: [
                            BoxShadow(
                                color: normalGray,
                                blurRadius: 5,
                                offset: const Offset(0, 5)),
                          ],
                          image: DecorationImage(
                            image: AssetImage(firstOption[index]['image']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoriesPage(),
                            ));
                      },
                      child: Text(
                        'More on',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: coolLightBlue,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: firstOption.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.2),
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
                            } else if (name == 'Al Abd') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryList(
                                      listName: name,
                                      categoryOptions: categoriesList[6],
                                    ),
                                  ));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: normalGray, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: normalGray,
                                    blurRadius: 10,
                                    offset: const Offset(0, 10)),
                              ],
                              image: DecorationImage(
                                image: AssetImage(restaurant[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Gap(20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesPage(),
                      ));
                },
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: coolLightBlue,
                      boxShadow: [
                        BoxShadow(
                            color: darkGray,
                            blurRadius: 10,
                            offset: const Offset(0, 10)),
                      ]),
                  child: const Center(
                      child: Text(
                    'Order Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  )),
                ),
              ),
              const Gap(10)
            ],
          ),
        ));
  }
}
