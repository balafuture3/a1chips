import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../String_Variable.dart';
import 'LoginPage.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _current = 0;

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final List<String> imgList = [
      "https://a1chips.in/assets/public/images/slide%20(1).jpg",
      "https://a1chips.in/assets/public/images/slide%20(2).jpg",
      "https://a1chips.in/assets/public/images/slide%20(3).jpg",
      "https://a1chips.in/assets/public/images/slide%20(4).jpg",
      "https://a1chips.in/assets/public/images/slide%20(5).jpg",
      "https://a1chips.in/assets/public/images/slide%20(6).jpg",
      "https://a1chips.in/assets/public/images/slide%20(7).jpg",
      "https://a1chips.in/assets/public/images/slide%20(8).jpg",
      "https://a1chips.in/assets/public/images/slide%20(9).jpg",
    ];

    return Scaffold(
      drawer: Drawer(),
      body: Container(
        color: String_Values.primarycolor,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: DefaultTabController(
              length: 1,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      elevation: 0,
                      actions: [
                        Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Icon(Icons.notifications)),
                        Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Icon(Icons.shopping_cart))
                      ],
                      expandedHeight: 60.0,
                      floating: true,
                      pinned: false,
                      title: Image.asset(
                        "logo.png",
                        height: AppBar().preferredSize.height,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
//                    centerTitle: true,
//                          title: Image.asset(
//                            "logo.png",
//                            height: AppBar().preferredSize.height,
//                          ),
                          background: Container(
                        color: String_Values.primarycolor,
                      )),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(Container(
                        color: String_Values.primarycolor,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 16,
                                right: 16,
                              ),
                              height: AppBar().preferredSize.height - 10,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  border: Border.all(
                                      color: String_Values.primarycolor,
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: new TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black54,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 20.0,
                                  ),
                                  focusColor: Colors.grey,
                                  hoverColor: Colors.grey,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 10),
                              height: AppBar().preferredSize.height,
                              width: width,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.category,
                                          size: 30,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text("Categories"),
                                    ],
                                  ),
                                  Icon(Icons.category),
                                  Icon(Icons.category),
                                  Icon(Icons.category),
                                  Icon(Icons.category),
                                  Icon(Icons.category),
                                  Icon(Icons.category),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                      pinned: true,
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 50),

                      CarouselSlider(
                          items: imgList
                              .map((item) => Container(
                                    decoration: BoxDecoration(
                                      image: new DecorationImage(
                                        image: new NetworkImage(
                                          item,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      border: Border.all(
                                          color: String_Values.primarycolor,
                                          width: 2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width / 8)),
                                    ),
                                    margin: EdgeInsets.only(top: 16),
                                  ))
                              .toList(),
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                            initialPage: 0,
                            height: 180,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: _current == index ? 10 : 8.0,
                            height: _current == index ? 10 : 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? String_Values.primarycolor
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
// ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: 5,
//   itemBuilder: (BuildContext context, int i) =>
//       Card(
//         elevation: 5,
//         // child: Container(height:150,width:MediaQuery.of(context).size.width-58),
//         child: Container(
//           width: 160.0,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text('Discipline curl'),
//               Text('https://sgdfgdgd/jdkjdhj.png/jashdghd'),
//               Text('20'),
//               Text('akhsgdahghsgdh')
//             ],
//           ),
//         ),
//       ),),

                      SizedBox(height: MediaQuery.of(context).size.height / 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Offer Categories",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "View All   >",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              children: List.generate(4, (index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 2,
                                      clipBehavior: Clip.antiAlias,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.settings,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Hand"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Tools"),
                                          ),
                                        ],
                                      ),
// child: Stack(
//     children: <Widget>[
//       index<files.length?
//       InkWell(
//         onTap: (){
//           showDialog(context: context,child:Image.file(files[index] ));
//         },
//         child: Image.file(files[index],
//           width: 300,
//           height: 300,
//         ),
//       ): Container(
//         width: 300,
//         height: 300,
//         child: IconButton(
//           icon: Icon(Icons.add,),
//           onPressed: () {
//             _onAddImageClick(index);
//           },
//         ),
//       ),
//
//       index<files.length?
//       Positioned(
//           right: 5,
//           top: 5,
//           child: InkWell(
//               child: Icon(
//                 Icons.remove_circle,
//                 size: 20,
//                 color: Colors.red,
//               ),
//               onTap: () {
//                 setState(() {
//                   files.removeAt(index);
//                   print(files);
//                   // images.replaceRange(index, index + 1, ['Add Image']);
//                 });
//               })):Container()])),
// );
//   },
                                    ));
                              }))),
                      SizedBox(height: MediaQuery.of(context).size.height / 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Best Offers for you",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Explore All   >",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: 25,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: String_Values.primarycolor,
          iconSize: 40,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          elevation: 5),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Container _tabBar;

  @override
  double get minExtent => (AppBar().preferredSize.height * 2) + 10;
  @override
  double get maxExtent => (AppBar().preferredSize.height * 2) + 10;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
