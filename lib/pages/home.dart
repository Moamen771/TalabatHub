import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talabathub/componants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.green,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              const Gap(20),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Image(
                          image: AssetImage(restaurant[index]['image']),
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

/*body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [category(), category(), category()],
        ),
      ),*/
