import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talabathub/pages/account.dart';
import 'package:talabathub/pages/cart.dart';
import 'package:talabathub/pages/categories.dart';
import 'package:talabathub/pages/home.dart';

List pages = [
  const HomePage(),
  const Categories(),
  const Account(),
  const Cart(),
];

Widget drawerItem(child){
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: darkGreen,
        border: Border.all(
          color: darkGreen,
          width: 1,
        )
    ),
    child: child,
  );
}

Widget category(){
  return Container(
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
              container(),
              container(),
              container(),
              container(),
              container(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget container(){
  return Container(
    height: 220,
    width: 180,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: darkGreen,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('images/download.png'),
          height: 120,
        ),
        const Gap(5),
        Text(
          'Product',
          style: TextStyle(
              fontSize: 18,
              color: lighterGreen,
              fontWeight: FontWeight.w600
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(1, 32, 48, .2))
              ),
              child: Text(
                'Add to cart',
                style: TextStyle(color: lighterGreen),
              ),
            ),
            const Gap(5),
            Icon(Icons.favorite_border,color: lighterGreen,)
          ],
        )
      ],
    ),
  );
}


/// Main Colors
Color lighterBlue = const Color.fromRGBO(167, 230, 255,1);
Color lightBlue = const Color.fromRGBO(58, 190, 249, 1);
Color darkBlue = const Color.fromRGBO(53, 114, 239, 1);
Color darkerBlue = const Color.fromRGBO(5, 12, 156, 1);

Color darkerGreen = const Color.fromRGBO(1, 32, 48, 1);
Color darkGreen = const Color.fromRGBO(19, 103, 138, 1);
Color normalGreen = const Color.fromRGBO(69, 196, 176, 1);
Color lightGreen = const Color.fromRGBO(154, 235, 163, 1);
Color lighterGreen = const Color.fromRGBO(218, 253, 186, 1);
