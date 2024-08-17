import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talabat/pages/account.dart';
import 'package:talabat/pages/cart.dart';
import 'package:talabat/pages/categories.dart';
import 'package:talabat/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*
import 'package:google_fonts/google_fonts.dart';
*/

List addToCart = [];
List favouriteList = [];
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
  {'image': 'BLabanImages/BLaban.jpg'},
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
List bLaban = [
  {
    'image': 'BLabanImages/ام علي بالسمنة البلدي و مكسرات .jpg',
    'name': 'ام علي + سمنة بلدي + مكسرات',
    'price': '55',
  },
  {
    'image': 'BLabanImages/رز بلبن مكسرات.jpg',
    'name': 'رز بلبن + مكسرات',
    'price': '45',
  },
  {
    'image': 'BLabanImages/سالنكتيه مانجو.jpg',
    'name': 'سالانكتيه مانجو',
    'price': '80',
  },
  {
    'image': 'BLabanImages/قشطوطة كراميل.jpg',
    'name': 'قشطوطة كراميل',
    'price': '50',
  },
  {
    'image': 'BLabanImages/قشطوطة مانجا .jpg',
    'name': 'قشطوطة مانجا',
    'price': '45',
  },
  {
    'image': 'BLabanImages/قشطوطة و كاستا و مانجا .jpg',
    'name': 'قشطوطة + كاساتا + مانجا',
    'price': '75',
  },
  {
    'image': 'BLabanImages/كاستا.jpg',
    'name': ' كاساتا',
    'price': '30',
  },
  {
    'image': 'BLabanImages/كشري اوريو.jpg',
    'name': ' كشري اوريو',
    'price': '55',
  },
  {
    'image': 'BLabanImages/كشري بيستاشيو.jpg',
    'name': ' كشري بيساتشيو',
    'price': '70',
  },
  {
    'image': 'BLabanImages/كشري كدر.jpg',
    'name': ' كشري كندر',
    'price': '60',
  },
  {
    'image': 'BLabanImages/كشري لوتس.jpg',
    'name': ' كشري لوتس',
    'price': '65',
  },
  {
    'image': 'BLabanImages/كشري مانجا.jpg',
    'name': ' كشري مانجا',
    'price': '60',
  },
];
List fawaz = [
  {
    'image': 'Fawaz/chicken.creep.jpg',
    'name': 'chicken.creep',
    'price': '55',
  },
  {
    'image': 'Fawaz/double.creep.jpg',
    'name': 'double.creep',
    'price': '100',
  },
  {
    'image': 'Fawaz/friends.meal.jpg',
    'name': 'friends.meal',
    'price': '300',
  },
  {
    'image': 'Fawaz/big.pizza.jpg',
    'name': 'big.pizza',
    'price': '75',
  },
  {
    'image': 'Fawaz/we.gather.jpg',
    'name': 'we.gather',
    'price': '150',
  },
  {
    'image': 'Fawaz/family.gathering.jpg',
    'name': 'family.gathering',
    'price': '250',
  },
  {
    'image': 'Fawaz/grilled.chicken.jpg',
    'name': 'grilled.chicken ',
    'price': '250',
  },
  {
    'image': 'Fawaz/crispy.jpg',
    'name': 'crispy',
    'price': '100',
  },
];
List alAbd = [
  {
    'image': 'Alabd/بسبوسه بندق.png',
    'name': 'بسبوسة بندق',
    'price': '130.00',
  },
  {
    'image': 'Alabd/بسبوسه ساده.png',
    'name': 'بسبوسة سادة',
    'price': '125.00',
  },
  {
    'image': 'Alabd/بلح الشام بالكريمة.png',
    'name': 'بلح الشام بالكريمة',
    'price': '125.00',
  },
  {
    'image': 'Alabd/بلح الشام.png',
    'name': 'بلح الشام',
    'price': '105.00',
  },
  {
    'image': 'Alabd/رموش الست.png',
    'name': 'رموش الست',
    'price': '135.00',
  },
  {
    'image': 'Alabd/زلابية.png',
    'name': 'زلابية',
    'price': '85.00',
  },
  {
    'image': 'Alabd/صوابع زينب.png',
    'name': 'صوابع زينب',
    'price': '75.00',
  },
  {
    'image': 'Alabd/طبق فورمة بسبوسة سادة صغير.png',
    'name': 'طبق فورمة بسبوسة سادة',
    'price': '165.00',
  },
  {
    'image': 'Alabd/علبة قطايف مكسرات.png',
    'name': 'علبة قطايف مكسرات',
    'price': '140.00',
  },
  {
    'image': 'Alabd/علبة قمورة.png',
    'name': 'علبة قمورة',
    'price': '185.00',
  },
  {
    'image': 'Alabd/علبة كنافة رولز.png',
    'name': 'علبة كنافة رولز',
    'price': '145.00',
  },
  {
    'image': 'Alabd/علبة مشكلة بقلاوة.png',
    'name': 'علبة مشكلة بقلاوة',
    'price': '165.00',
  },
];
List alFalah = [
  {
    'image': 'alFalah/طبق كبدا اسكندراني.jpg',
    'name': 'طبق كبدا اسكندراني',
    'price': '75',
  },
  {
    'image': 'alFalah/طبق سدق اسكندراني.jpg',
    'name': 'طبق سدق اسكندراني',
    'price': '60',
  },
  {
    'image': 'alFalah/طبق سدق اسكندراني مشوي عالجريل.jpg',
    'name': ' طبق سدق اسكندراني مشوي عالجريل',
    'price': '95',
  },
  {
    'image': 'alFalah/طبق كلاوي.jpg',
    'name': 'طبق كلاوي',
    'price': '70',
  },
  {
    'image': 'alFalah/طبق سدق ميكسيكانو.jpg',
    'name': 'طبق سدق ميكسيكانو',
    'price': '100',
  },
  {
    'image': 'alFalah/طبق بطاطس.jpg',
    'name': 'طبق بطاطس',
    'price': '25',
  },
  {
    'image': 'alFalah/طبق مشكل.jpg',
    'name': 'طبق مشكل',
    'price': '75',
  },
  {
    'image': 'alFalah/ساندوتش استربس.jpg',
    'name': 'ساندوتش استربس',
    'price': '32',
  },
];
List kansas = [
  {
    'image': 'KANSAS/بوص ديل.webp',
    'name': 'بوص ديل',
    'price': '175.00',
  },
  {
    'image': 'KANSAS/ساندوتش تشيزي بافلو.webp',
    'name': 'ساندوتش تشيزي بافلو',
    'price': '115.00',
  },
  {
    'image': 'KANSAS/عرض باكت ديو كرانشي.webp',
    'name': 'عرض باكت ديو كرانشي',
    'price': '365.00',
  },
  {
    'image': 'KANSAS/عرض باكيت عائلي - 6 قطع.webp',
    'name': 'عرض باكيت عائلي - 6 قطع',
    'price': '440.00',
  },
  {
    'image': 'KANSAS/عرض باكيت عائلي - 9 قطع.webp',
    'name': 'عرض باكيت عائلي - 9 قطع',
    'price': '560.00',
  },
  {
    'image': 'KANSAS/عرض باكيت عائلي - 12 قطعة.webp',
    'name': 'عرض باكيت عائلي - 12 قطعة',
    'price': '670.00',
  },
  {
    'image': 'KANSAS/عرض كنساس هيرو.webp',
    'name': 'عرض كنساس هيرو',
    'price': '195.00',
  },
  {
    'image': 'KANSAS/عرض مانجو هابنيرو.webp',
    'name': 'عرض مانجو هابنيرو',
    'price': '125.00',
  },
  {
    'image': 'KANSAS/عرض هوت تشيك بوكس.webp',
    'name': 'عرض هوت تشيك بوكس',
    'price': '195.00',
  },
  {
    'image': 'KANSAS/عرض وجبة إيرلي بيرد.webp',
    'name': 'عرض وجبة إيرلي بيرد',
    'price': '69.00',
  },
  {
    'image': 'KANSAS/عرض وجبة مورنينج تشيك.webp',
    'name': 'عرض وجبة مورنينج تشيك',
    'price': '79.00',
  },
  {
    'image': 'KANSAS/كنساس بيج بوص ديل.webp',
    'name': 'كنساس بيج بوص ديل',
    'price': '235.00',
  },
];

List categoriesList = [
  macdonaldS,
  kfc,
  bazooka,
  pizzaKing,
  bLaban,
  fawaz,
  alAbd,
  alFalah,
  kansas
];

Widget drawerItem(child) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: coolBlue,
        boxShadow: [
          BoxShadow(
              color: coolDarkBlue, blurRadius: 10, offset: const Offset(-5, 0)),
        ]),
    child: child,
  );
}

Widget profile(child) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: coolLightBlue,
        boxShadow: [
          BoxShadow(
              color: coolDarkBlue, blurRadius: 10, offset: const Offset(-5, 0)),
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            const Gap(5),
            const Text('EG'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  backgroundColor: coolBlue,
                  textColor: Colors.white,
                  fontSize: 20.0,
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(coolLightBlue),
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () async {
                favouriteList.add(item);
                final SharedPreferences prefFav =
                    await SharedPreferences.getInstance();
                List<String> favList =
                    favouriteList.map((item) => jsonEncode(item)).toList();

                await prefFav.setStringList('fav', favList);
                Fluttertoast.showToast(
                  msg: "item added to favourite",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: coolBlue,
                  textColor: Colors.white,
                  fontSize: 20.0,
                );
              },
              child: Icon(
                (isFavourite == false) ? favourite : favouriteAdded,
                color: coolLightBlue,
              ),
            )
          ],
        )
      ],
    ),
  );
}

bool isFavourite = false;
IconData favourite = Icons.favorite_border;
IconData favouriteAdded = Icons.favorite;

/// Main Colors

Color lighterBlue = const Color.fromRGBO(167, 230, 255, 1);
Color lightBlue = const Color.fromRGBO(58, 190, 249, 1);
Color normalBlue = const Color.fromRGBO(30, 67, 250, 1);
Color darkBlue = const Color.fromRGBO(53, 114, 239, 1);
Color darkerBlue = const Color.fromRGBO(5, 12, 156, 1);

//------------------------------------//

Color coolLightBlue = const Color.fromARGB(255, 2, 93, 168);
Color coolBlue = const Color.fromRGBO(1, 38, 69, 1);
Color coolDarkBlue = const Color.fromARGB(255, 0, 9, 23);

//------------------------------------//

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
