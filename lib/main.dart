import 'package:eqipped_test/BaseUrl.dart';
import 'package:eqipped_test/component/page_side_bar/grid_text/HomeScreen.dart';
import 'package:eqipped_test/header_widget.dart';
import 'package:eqipped_test/splash_screen.dart';
import 'package:eqipped_test/user_profile_page.dart';
import 'package:eqipped_test/vendor_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'home_main.dart';
import 'theme_helper.dart';

import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
// import 'header_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Eqipped"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static final baseUrl = BaseUrl.URL;

  late SharedPreferences sharedPreferences;

  late Map<String, dynamic> decodedMapUserData;
  static bool login = false;

  late Map<String, dynamic> role = {'': ''};
  static String roleName = '';

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if(sharedPreferences.getBool("isLogin") == true ) {
      decodedMapUserData =
          json.decode(sharedPreferences.getString('userData')!);

      role = decodedMapUserData['role'];

      roleName = role['roleName'];
      if(roleName == "Admin") {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) => ProfilePage()), (
            Route<dynamic> route) => false);
      }else if(roleName == "Vendor"){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) => VendorProfilePage()), (
            Route<dynamic> route) => false);
      }
      else if(roleName == "User"){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) => UserProfilePage()), (
            Route<dynamic> route) => false);
      }
    }

  }

  String _username = '';
  String _password = '';
  bool _isLoading = false;
  String _errorText = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  double _headerHeight = 250;

  void _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    var headers = {'Content-Type': 'application/json'};
    Map body = {'username': _username.trim(), 'password': _password.trim()};

    http.Response response = await http.post(
        Uri.parse('${baseUrl}/user/api/login'),
        headers: headers,
        body: jsonEncode(body));
    // var s = response.toString();
    // print("This is Aman response :  $s");
    Map<String, dynamic> jsonResponse1 = jsonDecode(response.body);
    Map<String, dynamic> jsonResponse = {'': ''};
    if(jsonResponse1['STATUS'] == 'SUCCESS')
      jsonResponse = jsonResponse1['USER'];
    // Map<String, dynamic> status = jsonResponse1['STATUS'];
    // Print the JSON response in the console
    print('JSON Response: $jsonResponse');
    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200 && jsonResponse1['STATUS'] == 'SUCCESS' ) {
      // Handle successful login

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);
      await prefs.setString('userData', json.encode(jsonResponse));
      final bool? repeat = prefs.getBool('isLogin');
      final String? stringUserData = prefs.getString('userData');
      Map<String,dynamic> decodedMapUserData = json.decode(stringUserData!);
      print('User Data: $decodedMapUserData');
      print(' IS Login : $repeat');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),

      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen(title: "Profileś")),

      );
    } else {
      setState(() {
        _errorText = 'Invalid username or password';
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, false, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [

                      const Text(
                        'Eqipped',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextField(
                                  controller: _usernameController,
                                  decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                  onChanged: (value) {
                                    setState(() {
                                      _username = value;
                                    });
                                  },

                                ),


                              ),

                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                                  onChanged: (value) {
                                    setState(() {
                                      _password = value;
                                    });
                                  },

                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: _isLoading ? null : _submitForm,
                                  // onPressed: (){
                                  //   //After successful login we will redirect to profile page. Let's create profile page now
                                  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  // },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,20,10,20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(text: "Don\'t have an account? "),
                                          TextSpan(
                                            text: 'Create',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                              },
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the second page.'),
      ),
    );
  }
}