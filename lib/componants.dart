import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:talabathub/pages/account.dart';
import 'package:talabathub/pages/cart.dart';
import 'package:talabathub/pages/categories.dart';
import 'package:talabathub/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*
import 'package:google_fonts/google_fonts.dart';
*/

List addToCart = [];
List pages = [
  const HomePage(),
  const CategoriesPage(),
  const AccountPage(),
  const Cart(),
];

List restaurant = [
  {'image': 'macimages/McDonalds.png'},
  {'image': 'kfcimages/Kfc.png'},
  {'image': 'pizzakingimages/pizzaKing.jpeg'},
  {'image': 'bazookaimages/Bazooka.png'},
];

List macdonaldS = [
  {
    'image': 'macimages/Bigmac.png',
    'name': 'Bigmac',
    'price': '55',
  },
  {
    'image': 'macimages/Big-tasty-Beef.png',
    'name': 'BigtastyBeef',
    'price': '70',
  },
  {
    'image': 'macimages/Big-tasty-Chicken.png',
    'name': 'BigtastyChicken',
    'price': '75',
  },
  {
    'image': 'macimages/McNuggets-4psc.png',
    'name': 'McNuggets4',
    'price': '90',
  },
  {
    'image': 'macimages/McNuggets-6psc.png',
    'name': 'McNuggets6',
    'price': '130',
  },
  {
    'image': 'macimages/CheeseBurger.png',
    'name': 'CheeseBurger',
    'price': '65',
  },
  {
    'image': 'macimages/Chicken-Mac.png',
    'name': 'ChickenMac',
    'price': '70',
  },
  {
    'image': 'macimages/Americano.png',
    'name': 'Americano',
    'price': '30',
  },
  {
    'image': 'macimages/Cappu.png',
    'name': 'Cappu',
    'price': '35',
  },
  {
    'image': 'macimages/Espresso1.png',
    'name': 'Espresso1',
    'price': '28',
  },
  {
    'image': 'macimages/Latte.png',
    'name': 'Latte',
    'price': '25',
  },
];
List kfc = [
  {
    'image': 'kfcimages/تويستر تريت.png',
    'name': 'تويستر تريت',
    'price': '99',
  },
  {
    'image': 'kfcimages/زنجر كرانش.png',
    'name': 'زنجر كرانش',
    'price': '99',
  },
  {
    'image': 'kfcimages/مايتي بلس.png',
    'name': 'مايتي بلس',
    'price': '235',
  },
  {
    'image': 'kfcimages/ميجا ريزو.png',
    'name': 'ميجا ريزو',
    'price': '155',
  },
  {
    'image': 'kfcimages/ميكس & ماتش.png',
    'name': 'ميكس & ماتش',
    'price': '199',
  },
  {
    'image': 'kfcimages/وجبة 4x4.png',
    'name': 'وجبة 4x4',
    'price': '530',
  },
];
List bazooka = [
  {
    'image': 'bazookaimages/كرانشي تشيكن راب سبايسي.jpg',
    'name': 'كرانشي تشيكن راب سبايسي',
    'price': '90',
  },
  {
    'image': 'bazookaimages/R B G.jpg',
    'name': 'R B G',
    'price': '160',
  },
  {
    'image': 'bazookaimages/Chicken Honey Yummy.jpg',
    'name': 'Chicken Honey Yummy',
    'price': '100',
  },
  {
    'image': 'bazookaimages/Chicken BBQ.jpg',
    'name': 'Chicken BBQ',
    'price': '120',
  },
  {
    'image': 'bazookaimages/Bazooka Super Crunch.jpg',
    'name': 'Bazooka Super Crunch',
    'price': '95',
  },
  {
    'image': 'bazookaimages/Bazooka Chicken Turkey.jpg',
    'name': 'Bazooka Chicken Turkey',
    'price': '135',
  },
];
List pizzaKing = [
  {
    'image': 'pizzakingimages/خضراوات إيطالي.jpeg',
    'name': 'خضراوات إيطالي',
    'price': '100',
  },
  {
    'image': 'pizzakingimages/رانش تشكن بيكون-ايطالي.jpeg',
    'name': 'رانش تشكن بيكون-ايطالي',
    'price': '120',
  },
  {
    'image': 'pizzakingimages/زنجر سموكى-بان.jpeg',
    'name': 'زنجر سموكى-بان',
    'price': '110',
  },
  {
    'image': 'pizzakingimages/سوبر سوبريم إيطالي.jpeg',
    'name': 'سوبر سوبريم إيطالي',
    'price': '140',
  },
  {
    'image': 'pizzakingimages/ببروني تشيز ستيكس.jpeg',
    'name': 'ببروني تشيز ستيكس',
    'price': '40',
  },
  {
    'image': 'pizzakingimages/تشيز إستيكس.jpeg',
    'name': 'تشيز إستيكس',
    'price': '50',
  },
  {
    'image': 'pizzakingimages/كالزونى ببروني.jpeg',
    'name': 'كالزونى ببروني',
    'price': '70',
  },
  {
    'image': 'pizzakingimages/كالزوني اللحوم الحارة.jpeg',
    'name': 'كالزوني اللحوم الحارة',
    'price': '70',
  },
];

List categoriesList = [macdonaldS, kfc, bazooka, pizzaKing];

Widget drawerItem(child) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: normalGray,
        border: Border.all(color: darkGray, width: .2),
        boxShadow: [
          BoxShadow(
              color: darkGray, blurRadius: 20, offset: const Offset(0, 10)),
        ]),
    child: child,
  );
}

Widget homeCategory() {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(50),
        image: const DecorationImage(
            image: AssetImage('macimages/McDonalds.png'), fit: BoxFit.fill)),
  );
}

Widget category() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                'Category',
                style: TextStyle(
                    color: darkerGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward, size: 30, color: darkerGreen)
            ],
          ),
        ),
        const Gap(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              container(
                  image: 'images/download.png', name: 'food', price: '150'),
              container(
                  image: 'images/download.png', name: 'food', price: '150'),
              container(
                  image: 'images/download.png', name: 'food', price: '150'),
              container(
                  image: 'images/download.png', name: 'food', price: '150'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget container({String? image, String? name, String? price}) {
  Map<String, String?> item = {
    'image': image,
    'name': name,
    'price': price,
  };
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: normalGray, width: 3),
        boxShadow: [
          BoxShadow(
              color: darkGray, blurRadius: 10, offset: const Offset(0, 5)),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image!),
          height: 100,
        ),
        const Gap(5),
        Text(
          name!,
          style: TextStyle(
              fontSize: 18, color: darkerGreen, fontWeight: FontWeight.w600),
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              price!,
              style: TextStyle(
                  fontSize: 18,
                  color: darkerGreen,
                  fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.attach_money)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                addToCart.add(item);

                final SharedPreferences pref =
                    await SharedPreferences.getInstance();

                List<String> stringList =
                    addToCart.map((item) => jsonEncode(item)).toList();

                await pref.setStringList('items', stringList);
                Fluttertoast.showToast(
                  msg: "item added succes",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: darkerBlue,
                  textColor: Colors.white,
                  fontSize: 20.0,
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(normalBlue),
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Gap(5),
            Icon(
              Icons.favorite_border,
              color: normalBlue,
            )
          ],
        )
      ],
    ),
  );
}

/// Main Colors

Color lighterBlue = const Color.fromRGBO(167, 230, 255, 1);
Color lightBlue = const Color.fromRGBO(58, 190, 249, 1);
Color normalBlue = const Color.fromRGBO(30, 67, 250, 1);
Color darkBlue = const Color.fromRGBO(53, 114, 239, 1);
Color darkerBlue = const Color.fromRGBO(5, 12, 156, 1);

Color purple = const Color.fromRGBO(157, 60, 222, 1);

Color lightGray = Colors.grey.shade100;
Color normalGray = Colors.grey.shade200;
Color darkGray = Colors.grey.shade400;
Color darkerGray = Colors.grey.shade600;

Color darkerGreen = const Color.fromRGBO(1, 32, 48, 1);
Color darkGreen = const Color.fromRGBO(19, 103, 138, 1);
Color normalGreen = const Color.fromRGBO(69, 196, 176, 1);
Color lightGreen = const Color.fromRGBO(154, 235, 163, 1);
Color lighterGreen = const Color.fromRGBO(218, 253, 186, 1);
