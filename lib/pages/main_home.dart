import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talabat/componants.dart';
import 'package:talabat/pages/account.dart';
import 'package:talabat/pages/cart.dart';
import 'package:talabat/pages/categories.dart';
import 'package:talabat/pages/favouriteList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: coolLightBlue),
          child: Column(
            children: [
              const Gap(20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountPage(),
                      ));
                },
                child: drawerItem(const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/Light.jpg'),
                    radius: 26,
                  ),
                  title: Text(
                    'UserName',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'EMail@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesPage(),
                      ));
                },
                child: drawerItem(const Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Cart(),
                      ));
                },
                child: drawerItem(const Row(
                  children: [
                    Text(
                      'Cart',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteList(),
                      ));
                },
                child: drawerItem(const Row(
                  children: [
                    Text(
                      'Favourite',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                )),
              ),
              const Spacer(),
              InkWell(
                onTap: FirebaseAuth.instance.signOut,
                child: drawerItem(
                  const Row(
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.logout, size: 30, color: Colors.white)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: coolLightBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'talabat',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
              ))
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: coolLightBlue,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: coolBlue,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              size: 30,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              label: 'Cart'),
        ],
      ),
    );
  }
}
