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
        backgroundColor: lightGreen,
        child: Column(
          children: [
            drawerItem(GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Account(),));
              },
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('images/Light.jpg'),
                  radius: 28,
                ),
                title: Text(
                  'UserName',
                  style: TextStyle(
                    color: lighterGreen,
                    fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'EMail@gmail.com',
                  style: TextStyle(
                    color: lightGreen
                  ),
                ),
              ),
            )),
            drawerItem(GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Categories(),));
                },
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 26,
                        color: lighterGreen
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,color: lighterGreen)
                  ],
                ),
              )),
            drawerItem(GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Categories(),));
              },
              child: Row(
                children: [
                  Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 26,
                      color: lighterGreen                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,color: lighterGreen)
                ],
              ),
            )),
            const Spacer(),
            drawerItem(Row(
              children: [
                Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: lighterGreen
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.logout,size: 30,color: lighterGreen)
                )
              ],
            ),)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: darkerGreen,
        iconTheme: IconThemeData(color: lighterGreen),
        title: Text(
          'TalabatHub',
          style: TextStyle(
            color: lighterGreen,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: darkerGreen,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: lighterGreen,
        unselectedItemColor: normalGreen,
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
