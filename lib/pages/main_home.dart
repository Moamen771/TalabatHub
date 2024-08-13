import 'package:flutter/material.dart';
import 'package:talabathub/componants.dart';
import 'package:talabathub/pages/account.dart';
import 'package:talabathub/pages/categories.dart';

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
        backgroundColor: Colors.white,
        child: Column(
          children: [
          drawerItem(GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Account(),));
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/Light.jpg'),
                radius: 26,
              ),
              title: Text(
                'UserName',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'EMail@gmail.com',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ),
          )),
          drawerItem(GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage(),));
              },
              child: const Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.black)
                ],
              ),
            )),
          drawerItem(GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage() ,));
            },
            child: const Row(
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Icon(Icons.arrow_forward_ios,color: Colors.black)
              ],
            ),
          )),
          drawerItem(GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage() ,));
            },
            child: const Row(
              children: [
                Text(
                  'Wishlist',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Icon(Icons.arrow_forward_ios,color: Colors.black)
              ],
            ),
          )),
          const Spacer(),
          drawerItem(Row(
            children: [
              const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.logout,size: 30,color: Colors.black)
              )
            ],
          ),)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: normalBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'TalabatHub',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: normalBlue,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: darkerGray,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category,size: 30,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,size: 30,),
            label: 'Account'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,size: 30,),
            label: 'Cart'
          ),
        ],
      ),
    );
  }
}
