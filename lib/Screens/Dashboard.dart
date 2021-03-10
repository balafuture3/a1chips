import 'package:a1chips/Screens/Categories.dart';
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    child: Image.asset("logo.png"),
                    maxRadius: 40,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Welcome ${LoginPageState.EmailController.text}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: String_Values.primarycolor,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: String_Values.primarycolor,
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                  (Route<dynamic> route) => false,
                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.list,
                color: String_Values.primarycolor,
              ),
              title: Text('Shop By Category'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()),

                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_offer,
                color: String_Values.primarycolor,
              ),
              title: Text("Today's Deal"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.bookmarks,
                color: String_Values.primarycolor,
              ),
              title: Text("My Orders"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: String_Values.primarycolor,
              ),
              title: Text("My Account"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: String_Values.primarycolor,
              ),
              title: Text("My Cart"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: String_Values.primarycolor,
              ),
              title: Text("My Notifications"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
                ); // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Privacy Policy"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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
                      title: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                gradient: RadialGradient(colors: [
                              Colors.white,
                              Colors.white,
                              String_Values.primarycolor,
                              Colors.white,
                              String_Values.primarycolor,
                              String_Values.primarycolor,
//                          String_Values.primarycolor,
                            ])),
                            child: Image.asset(
                              "logo.png",
                              height: AppBar().preferredSize.height,
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                'a-1 chips',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.white,
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                'a-1 chips',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  color: String_Values.primarycolor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      flexibleSpace: Container(
                        child: FlexibleSpaceBar(
//                    centerTitle: true,
//                          title: Image.asset(
//                            "logo.png",
//                            height: AppBar().preferredSize.height,
//                          ),
                            background: Container()),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(Container(
                        decoration: BoxDecoration(
                            gradient: RadialGradient(colors: [
                          String_Values.primarycolor,
                          String_Values.primarycolor,
//                          Colors.white,
                          String_Values.primarycolor,
                          String_Values.primarycolor,
                          String_Values.primarycolor,
                          String_Values.primarycolor,
                          String_Values.primarycolor,
                          String_Values.primarycolor,
                        ])),
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
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 2.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              height: AppBar().preferredSize.height * 1.2,
                              width: width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        CategoriesPage()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.list,
                                              color: String_Values.primarycolor,
                                              size: AppBar()
                                                      .preferredSize
                                                      .height /
                                                  1.5,
                                              semanticLabel: "Categories",
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "All Categories",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    for (int i = 0;
                                        i < Categoryimages.length;
                                        i++)
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              Categoryimages[i].url,
                                              height: AppBar()
                                                      .preferredSize
                                                      .height /
                                                  1.3,
                                              width: AppBar()
                                                      .preferredSize
                                                      .height /
                                                  1.3,
                                            ),
                                            Text(
                                              Categoryimages[i].title,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
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
//                                      border: Border.all(
////                                          color: String_Values.primarycolor,
//                                          width: 2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width / 20)),
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
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: _current == index ? 15 : 8.0,
                            height: _current == index ? 8 : 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              shape: _current == index
                                  ? BoxShape.rectangle
                                  : BoxShape.rectangle,
                              color: _current == index
                                  ? String_Values.primarycolor.withOpacity(0.9)
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
//         // child: Container(height:130,width:MediaQuery.of(context).size.width-58),
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

                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Container(
                        color: Colors.red.withOpacity(0.2),
                        child: Column(
                          children: [
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
                                        color: String_Values.primarycolor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                            GridView.count(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                children: List.generate(4, (index) {
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
                                                  Categoryimages[index].url,
                                                  height: height / 7,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(Categoryimages[index]
                                                      .title),
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
                      SizedBox(height: MediaQuery.of(context).size.height / 30),
                      Container(
                        color: Colors.green.withOpacity(0.2),
                        child: Column(
                          children: [
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
                                    "View All   >",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: String_Values.primarycolor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                            GridView.count(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                children: List.generate(4, (index) {
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
                                                  Categoryimages[index].url,
                                                  height: height / 7,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(Categoryimages[index]
                                                      .title),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

//      bottomNavigationBar: BottomNavigationBar(
//          items: const <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//              icon: Icon(
//                Icons.home,
//                size: 25,
//              ),
//              label: 'Home',
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(
//                Icons.category,
//                size: 25,
//              ),
//              label: 'Categories',
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(
//                Icons.settings,
//                size: 25,
//              ),
//              label: 'Settings',
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(
//                Icons.person,
//                size: 25,
//              ),
//              label: 'Profile',
//            ),
//          ],
//          type: BottomNavigationBarType.fixed,
//          currentIndex: _selectedIndex,
//          selectedItemColor: String_Values.primarycolor,
//          iconSize: 40,
//          onTap: (value) {
//            setState(() {
//              _selectedIndex = value;
//            });
//          },
//          elevation: 5),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Container _tabBar;

  @override
  double get minExtent => (AppBar().preferredSize.height * 2.2) + 10;
  @override
  double get maxExtent => (AppBar().preferredSize.height * 2.2) + 10;

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

class Categories {
  String title;
  String url;
  Categories(this.title, this.url);
}
