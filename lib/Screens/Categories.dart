import 'dart:io';
import 'package:flutter/material.dart';

import '../String_Variable.dart';

class CategoriesPage extends StatefulWidget {
  @override
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage> {
  List<Categories> Categoryimages = [
    Categories("Chips",
        "https://buya1chips.com/wp-content/uploads/2020/10/4-Cut-Banana-Chips-300x300.jpg"),
    Categories("Mixture",
        "https://buya1chips.com/wp-content/uploads/2018/11/Corn-Mixture-Classic-300x300.jpg"),
    Categories("Muruku",
        "https://buya1chips.com/wp-content/uploads/2019/03/Murukku-pack-300x300.jpg"),
    Categories("Pakoda",
        "https://buya1chips.com/wp-content/uploads/2019/03/Crispy-Thins-Pouch-300x300.jpg"),
    Categories("Pickles",
        "https://buya1chips.com/wp-content/uploads/2020/12/Amla-Pickle-1-300x300.jpg"),
    Categories("Magic Mixes",
        "https://buya1chips.com/wp-content/uploads/2020/12/Idli-Dosa-Powder-1-300x300.jpg"),
    Categories("Puffed Snacks",
        "https://buya1chips.com/wp-content/uploads/2020/07/Cheese-Balls-300x300.jpg"),
    Categories("Biscuits",
        "https://buya1chips.com/wp-content/uploads/2020/06/BEANS-BISCUIT-CROP-300x300.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  children: List.generate(Categoryimages.length, (index) {
                    return Container(
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.network(
                                    Categoryimages[index].url,
                                    height: height / 9,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(Categoryimages[index].title),
                                  ],
                                ),
                              ],
                            ),
//                            Positioned(
//                              left: 0,
//                              top: 0,
//                              child: Container(
//                                height: 40,
//                                width: 40,
//                                child: Center(
//                                  child: Text(
//                                    "${(index + 1) * 15}%\noff",
//                                    style: TextStyle(
//                                      color: Colors.white,
//                                    ),
//                                    textAlign: TextAlign.center,
//                                  ),
//                                ),
//                                decoration: BoxDecoration(
//                                    color: String_Values.primarycolor,
//                                    borderRadius: BorderRadius.all(
//                                        Radius.circular(height))),
//                              ),
//                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("All Categories"),
      ),
    );
  }
}

class Categories {
  String title;
  String url;
  Categories(this.title, this.url);
}
