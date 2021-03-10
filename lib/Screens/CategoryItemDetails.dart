import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../String_Variable.dart';

class CategoryItemDetail extends StatefulWidget {
  CategoryItemDetail({Key key , this.title});
  String title;
  @override
  CategoryItemDetailState createState() => CategoryItemDetailState();
}

class CategoryItemDetailState extends State<CategoryItemDetail> {
  List<CategoryItem> Categoryitems = [
    CategoryItem("Banana 4 Cut Salt – 250g",
        "https://buya1chips.com/wp-content/uploads/2020/10/4-Cut-Banana-Chips-300x300.jpg"),
    CategoryItem("Tapioca chips stick chilly – 200g",
        "https://buya1chips.com/wp-content/uploads/2020/07/Tapioca-chips-stick-chilly-300x300.jpg"),
    CategoryItem("Potato Chips Green Chilly-200 Gm",
        "https://buya1chips.com/wp-content/uploads/2020/03/1Potato-Green-Chilly.jpg"),
    CategoryItem("Potato Chips Pudhina 100 GM",
        "https://buya1chips.com/wp-content/uploads/2019/11/WhatsApp-Image-2020-03-04-at-11.30.35-AM-300x300.jpeg"),
    CategoryItem("Pickles",
        "https://buya1chips.com/wp-content/uploads/2020/12/Amla-Pickle-1-300x300.jpg"),
    CategoryItem("Magic Mixes",
        "https://buya1chips.com/wp-content/uploads/2020/12/Idli-Dosa-Powder-1-300x300.jpg"),
    CategoryItem("Puffed Snacks",
        "https://buya1chips.com/wp-content/uploads/2020/07/Cheese-Balls-300x300.jpg"),
    CategoryItem("Biscuits",
        "https://buya1chips.com/wp-content/uploads/2020/06/BEANS-BISCUIT-CROP-300x300.jpg"),
  ];

  var loading=false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1,
                children: List.generate(Categoryitems.length, (index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.all(2.0),
                                child: Image.network(
                                  Categoryitems[index].Image,
                                  height: height / 7,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(Categoryitems[index]
                                      .Item,textAlign: TextAlign.center,),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                        "Rs.${100 - ((100 * ((index + 1) * 15)) / 100)}  ",
                                        style: TextStyle(
                                            color: String_Values
                                                .primarycolor,
                                            fontWeight:
                                            FontWeight
                                                .w800),
                                      ),
                                      Text(
                                        "Rs.100",
                                        style: TextStyle(
                                            decoration:
                                            TextDecoration
                                                .lineThrough),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Center(
                                child: Text(
                                  "${(index + 1) * 15}%\noff",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: String_Values
                                      .primarycolor,
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          height))),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
      appBar: AppBar(title: Text(widget.title),),
    );
  }
}

class CategoryItem {
  String Item;
  String Image;
  CategoryItem(this.Item,this.Image);
}
