import 'package:eqipped_test/component/page_side_bar/Vendor.dart';
import 'package:eqipped_test/component/page_side_bar/product.dart';
import 'package:eqipped_test/component/page_side_bar/setting.dart';
import 'package:eqipped_test/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:eqipped_test/component/page_side_bar/order.dart';
import 'component/page_side_bar/user.dart';
import 'dashboard.dart';
import 'home_main.dart';
import 'splash_screen.dart';
import 'forgot_password_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  late Map<String, dynamic> decodedMapUserData;
  static String firstName = '';
  static String lastName = '';


  late Map<String, dynamic> role = {'': ''};
  static String profile = '';
  static String roleName = '';
  static String imagePath = '';

  static String home = '';
  static String profileOption = '';
  static String dashboard = '';
  static String shipments = '';
  static String myOder = '';
  static String others = '';
  static String order = '';
  static String product = '';
  static String vendor = '';
  static String user = '';
  static String notification = '';
  static String setting = '';


  late Map<String, dynamic> roleSideBarOptions = {'': ''};

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool("isLogin") == true) {
      decodedMapUserData =
          json.decode(sharedPreferences.getString('userData')!);
      firstName = decodedMapUserData['firstName'];
      lastName = decodedMapUserData['lastName'];
      role = decodedMapUserData['role'];
      profile = decodedMapUserData['profile'];
      roleName = role['roleName'];
      try {
        imagePath = decodedMapUserData['imagePath'];
      }catch(e){
        imagePath = "https://eqipped.com/image/defaultProfileImage.png";
      }
      roleSideBarOptions = role['roleSideBarOptions'];
      home = roleSideBarOptions['home'];
      profileOption = roleSideBarOptions['profile'];
      dashboard = roleSideBarOptions['dashboard'];
      shipments = roleSideBarOptions['shipments'];
      myOder = roleSideBarOptions['myOder'];
      others = roleSideBarOptions['others'];
      order = roleSideBarOptions['order'];
      product = roleSideBarOptions['product'];
      vendor = roleSideBarOptions['vendor'];
      user = roleSideBarOptions['user'];
      notification = roleSideBarOptions['notification'];
      setting = roleSideBarOptions['setting'];
      print(' Under Profile userData: $decodedMapUserData');
    }
  }

  Image appLogo = const Image(
      image: ExactAssetImage("assets/images/eqippedLogo.png"),
      height: 150.0,
      width: 200.0,
      alignment: FractionalOffset.centerLeft);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appLogo,
        elevation: 0.5,
        backgroundColor: Color(0xffff8f61),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.secondary,
                  ])),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                const Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Container(
              child: Stack(
                children: <Widget>[
                  const Icon(Icons.shopping_cart),
                  Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                    0.0,
                    1.0
                  ],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.center,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: Center(
                  child:
                  imagePath.isEmpty
                      ?  ListTile(leading: Image.asset("assets/images/ProfileImage.png",),)
                      :
                  ListTile(

                    leading: Image.network(
                      imagePath,
                      fit: BoxFit.cover, // Adjust this property based on your needs
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null)
                          return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Text('Failed to load image');
                      },
                    ),
                    subtitle:  Text(
                      '$firstName $lastName\n$profile\n$roleName',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              home == 'Yes'
                  ? ListTile(
                leading: Icon(
                  Icons.home,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 17, color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage()));
                },
              )
                  : const Text(""),
              profileOption == 'Yes'
                  ? ListTile(
                leading: Icon(
                  Icons.face_2,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(title: "Profileś")));
                },
              )
                  : const Text(""),
              dashboard == 'Yes'
                  ? ListTile(
                leading: Icon(Icons.dashboard,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
              )
                  : const Text(""),
              // shipments == 'Yes'
              //     ? ListTile(
              //   leading: Icon(Icons.shopping_cart_sharp,
              //       size: _drawerIconSize,
              //       color: Theme.of(context).accentColor),
              //   title: Text(
              //     'Shipments',
              //     style: TextStyle(
              //         fontSize: _drawerFontSize,
              //         color: Theme.of(context).accentColor),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const MyApp()),
              //     );
              //   },
              // )
              //     : const Text(""),
              // myOder == 'Yes'
              //     ? ListTile(
              //   leading: Icon(Icons.mic_external_on_rounded,
              //       size: _drawerIconSize,
              //       color: Theme.of(context).accentColor),
              //   title: Text(
              //     'My Order',
              //     style: TextStyle(
              //         fontSize: _drawerFontSize,
              //         color: Theme.of(context).accentColor),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Order_box()),
              //     );
              //   },
              // )
              //     : const Text(""),

              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              order == 'Yes'
                  ? ListTile(
                leading: Icon(Icons.flutter_dash_rounded,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Order',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Order_box()),
                  );
                },
              )
                  : const Text(""),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              product == 'Yes'
                  ? ListTile(
                leading: Icon(
                  Icons.science,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Product',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Product()),
                  );
                },
              )
                  : const Text(""),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              vendor == 'Yes'
                  ? ListTile(
                leading: Icon(
                  Icons.diversity_3,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Vendor',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Vendor()),
                  );
                },
              )
                  : const Text(""),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              user == 'Yes'
                  ? ListTile(
                leading: Icon(
                  Icons.person,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'User',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const User()),
                  );
                },
              )
                  : const Text(""),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              notification == 'Yes'
                  ? ListTile(
                leading: Icon(
                  Icons.notifications,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Notification',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () async {
                  sharedPreferences =
                  await SharedPreferences.getInstance();
                  sharedPreferences.clear();
                },
              )
                  : const Text(""),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              setting == 'Yes'
                  ? ListTile(
                leading: Icon(
                  Icons.settings,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Setting',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () async {
                  sharedPreferences =
                  await SharedPreferences.getInstance();
                  sharedPreferences.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Setting()),
                  );
                },
              )
                  : const Text(""),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              others == 'Yes'
                  ? ListTile(
                leading: Icon(Icons.devices_other,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Others',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyApp()),
                  );
                },
              )
                  : const Text(""),
              ListTile(
                leading: Icon(
                  Icons.password_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Forgot Password Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () async {
                  sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage()),
                  );
                },
              ),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () async {
                  sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Stack(
      //     children: [
      //       Container(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),),
      //       Container(
      //         alignment: Alignment.center,
      //         margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
      //         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      //         child: Column(
      //           children: [
      //             Container(
      //               padding: EdgeInsets.all(10),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(100),
      //                 border: Border.all(width: 5, color: Colors.white),
      //                 color: Colors.white,
      //                 boxShadow: [
      //                   BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
      //                 ],
      //               ),
      //               child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),
      //             ),
      //             SizedBox(height: 20,),
      //             Text('Mr. Donald Trump', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
      //             SizedBox(height: 20,),
      //             Text('Former President', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      //             SizedBox(height: 10,),
      //             Container(
      //               padding: EdgeInsets.all(10),
      //               child: Column(
      //                 children: <Widget>[
      //                   Container(
      //                     padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      //                     alignment: Alignment.topLeft,
      //                     child: Text(
      //                       "User Information",
      //                       style: TextStyle(
      //                         color: Colors.black87,
      //                         fontWeight: FontWeight.w500,
      //                         fontSize: 16,
      //                       ),
      //                       textAlign: TextAlign.left,
      //                     ),
      //                   ),
      //                   Card(
      //                     child: Container(
      //                       alignment: Alignment.topLeft,
      //                       padding: EdgeInsets.all(15),
      //                       child: Column(
      //                         children: <Widget>[
      //                           Column(
      //                             children: <Widget>[
      //                               ...ListTile.divideTiles(
      //                                 color: Colors.grey,
      //                                 tiles: [
      //                                   ListTile(
      //                                     contentPadding: EdgeInsets.symmetric(
      //                                         horizontal: 12, vertical: 4),
      //                                     leading: Icon(Icons.my_location),
      //                                     title: Text("Location"),
      //                                     subtitle: Text("USA"),
      //                                   ),
      //                                   ListTile(
      //                                     leading: Icon(Icons.email),
      //                                     title: Text("Email"),
      //                                     subtitle: Text("donaldtrump@gmail.com"),
      //                                   ),
      //                                   ListTile(
      //                                     leading: Icon(Icons.phone),
      //                                     title: Text("Phone"),
      //                                     subtitle: Text("99--99876-56"),
      //                                   ),
      //                                   ListTile(
      //                                     leading: Icon(Icons.person),
      //                                     title: Text("About Me"),
      //                                     subtitle: Text(
      //                                         "This is a about me link and you can khow about me in this section."),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: const HomePage(),
    );
  }
}