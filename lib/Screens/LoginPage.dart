import 'dart:convert';
import 'dart:io';
import 'package:a1chips/Model/Login.dart';
import 'package:a1chips/Widgets/AllWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../String_Variable.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginResponse li;
  bool loading = false;

  static String rolename;
  static String roleid;
  static String token;

  Future<http.Response> getRequest() async {
    setState(() {
      loading = true;
    });
    var url;

    url = String_values.base_url;

    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
    print("response: ${response.statusCode}");
    print("response: ${response.body}");
    return response;
  }

  Future<http.Response> postRequest() async {
    setState(() {
      loading = true;
    });
    var url;

    url = String_values.base_url + 'login';
    Map data = {
      "email": EmailController.text,
      "password": PasswordController.text
    };
    print("data: ${data}");
    print(url);
    //encode Map to JSON
    var body = json.encode(data);
    print("response: ${body}");
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          //   'Authorization':
          //       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiIxIiwidXR5cGUiOiJFTVAifQ.AhfTPvo5C_rCMIexbUd1u6SEoHkQCjt3I7DVDLwrzUs'
          //
        },
        body: body);
    if (response.statusCode == 200) {
      li = LoginResponse.fromJson(json.decode(response.body));
      setState(() {
        loading = false;
      });

      if (li.status) {
        setRegistered(rolename, roleid, token);
        rolename = li.authUserRolename;
        roleid = li.authUserRole;
        token = li.tokenType;
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (context) => Dashboard()),
        //   (Route<dynamic> route) => false,
        // );
      } else
        showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(li.alert),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
    } else {
      setState(() {
        loading = false;
      });
      print("Retry");
    }
    print("response: ${response.statusCode}");
    print("response: ${response.body}");
    return response;
  }

  Future<bool> setRegistered(rolename, roleid, token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rolename', rolename);
    await prefs.setString('token', token);
    await prefs.setString('roleid', roleid);
    await prefs.setBool('seen', true);
    return true;
  }

  static TextEditingController EmailController = new TextEditingController();
  static TextEditingController PasswordController = new TextEditingController();

  static IconData toggle = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(162, 206, 41, 1),
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Color.fromRGBO(162, 206, 41, 1),
                    ]),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height / 10,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: width / 4, right: width / 4),
                                child: Widgetsfield().myImageAsset("logo.png",
                                    () {}, context, height / 4, width)),
                            SizedBox(
                              height: height / 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text(
                                  //   "Minmegam ",
                                  //   style: TextStyle(
                                  //     fontSize: 16.0,
                                  //     fontWeight: FontWeight.bold,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  Text(
                                    "Ortho ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Dental",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: String_values.primarycolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Widgetsfield().myTextField(Icon(Icons.email),
                        EmailController, "Email", () {}, null),
                    Widgetsfield().myTextField(
                        Icon(Icons.lock),
                        PasswordController,
                        "Password",
                        () {},
                        IconButton(
                          icon: Icon(toggle),
                          onPressed: () {
                            togglestate();
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 24),
                            padding: EdgeInsets.all(24),
                            child: InkWell(
                                onTap: () {}, child: Text("Forgot Password"))),
                      ],
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Widgetsfield().myButton("Login", () {
                      postRequest();
//                      getRequest();
                    }, width / 2)
                  ],
                ),
              ),
            ),
    );
  }

  void togglestate() {
    setState(() {
      if (toggle == Icons.visibility)
        toggle = Icons.visibility_off;
      else
        toggle = Icons.visibility;
    });
  }

  void action() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
