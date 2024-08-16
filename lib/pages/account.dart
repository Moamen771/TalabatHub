import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:talabat/componants.dart';
import 'package:talabat/pages/favouriteList.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromARGB(255, 0, 9, 23),
                              Color.fromRGBO(1, 38, 69, 1),
                              Color.fromARGB(255, 2, 93, 168)
                            ]),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                  ),
                  Positioned(
                    right: 30,
                    left: 30,
                    top: 100,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: coolBlue, width: .2),
                          boxShadow: [
                            BoxShadow(
                                color: coolDarkBlue,
                                blurRadius: 20,
                                offset: const Offset(5, 5)),
                          ]),
                    ),
                  )
                ],
              ),
              const Gap(75),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 120,
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${favouriteList.length}',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              Text(
                                'favourite',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: Container(
                          height: 120,
                          color: Colors.green,
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: Container(
                          height: 120,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

/*Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profile(const ListTile(
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
              const Gap(10),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: profile(
                              const Center(
                                child: Text(
                                  'Orders',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: profile(const Center(
                              child: Text(
                                'Credits',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: profile(const Center(
                              child: Text(
                                'Returns',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FavouriteList(),
                                    ));
                              },
                              child: profile(const Center(
                                child: Text(
                                  'Wishlist',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              InkWell(
                onTap: FirebaseAuth.instance.signOut,
                child: profile(
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login,
                        color: Colors.white,
                        size: 30,
                      ),
                      Gap(10),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),*/
