import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talabathub/pages/account.dart';
import 'package:talabathub/pages/cart.dart';
import 'package:talabathub/pages/categories.dart';
import 'package:talabathub/pages/home.dart';
/*
import 'package:google_fonts/google_fonts.dart';
*/

List pages = [
  const HomePage(),
  CategoriesPage(),
  const Account(),
  const Cart(),
];
List food = [
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : '120',
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : '120',
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : '120',
  },
];
List clothes = [
  {
    'image' : 'images/download.jpeg',
    'name' : 'بنطلون',
    'price' : '120',
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'بنطلون',
    'price' : '120',
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'بنطلون',
    'price' : '120',
  },
];
List computers = [
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : 120,
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : 120,
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : 120,
  },
];
List electronics = [
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : 120,
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : 120,
  },
  {
    'image' : 'images/download.jpeg',
    'name' : 'Meat',
    'price' : 120,
  },
];

List categoriesList = [
  food,
  clothes,
  computers,
  electronics
];

Widget drawerItem(child){
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: normalGray,
      border: Border.all(
        color: darkGray,
        width: 1
      )
    ),
    child: child,
  );
}

Widget category(){
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
                  fontWeight: FontWeight.w600
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward,size: 30,color: darkerGreen)
            ],
          ),
        ),
        const Gap(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              container(image: 'images/download.png',name: 'food',price: '150'),
              container(image: 'images/download.png',name: 'food',price: '150'),
              container(image: 'images/download.png',name: 'food',price: '150'),
              container(image: 'images/download.png',name: 'food',price: '150'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget container({String? image,String? name,String? price}){
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: lightGray,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: normalGray,
        width: 3
      )
    ),
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
              fontSize: 18,
              color: darkerGreen,
              fontWeight: FontWeight.w600
          ),
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
                fontWeight: FontWeight.w600
              ),
            ),
            const Icon(Icons.attach_money)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(normalBlue),
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white),
              ),
            ),
            const Gap(5),
            Icon(Icons.favorite_border,color: normalBlue,)
          ],
        )
      ],
    ),
  );
}


/// Main Colors

Color lighterBlue = const Color.fromRGBO(167, 230, 255,1);
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
