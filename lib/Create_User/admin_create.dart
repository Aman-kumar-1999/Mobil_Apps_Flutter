import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();

}

class _AdminState extends State<Admin> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController profile = TextEditingController();
  TextEditingController registerAs = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Create"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0,right: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(controller: email, decoration: const InputDecoration(hintText: "Email"),),
            // TextField(controller: username, decoration: const InputDecoration(hintText: "username"),),
            TextField(controller: password,decoration: const InputDecoration(hintText: "password"),),
            TextField(controller: firstName,decoration: const InputDecoration(hintText: "firstName"),),
            TextField(controller: lastName,decoration: const InputDecoration(hintText: "lastName"),),
            TextField(controller: phone,decoration: const InputDecoration(hintText: "phone"),),
            TextField(controller: profile,decoration: const InputDecoration(hintText: "profile"),),
            // TextField(controller: registerAs,decoration: const InputDecoration(hintText: "registerAs"),),
            TextField(controller: pincode,decoration: const InputDecoration(hintText: "pincode"),),
            TextField(controller: city,decoration: const InputDecoration(hintText: "city"),),
            ElevatedButton(onPressed: (){registerUser();
              print("object");
              }, child: const Text("Register"))
          ],
        ),
      ),
    );
  }

  void registerUser() async{
    var url = "http://codea2z.online:5002/user/admin";

    var data = {
      "username": email.text,
      "email": email.text,
      "password": password.text,
      "firstName": firstName.text,
      "lastName": lastName.text,
      "phone": password.text,
      "profile": profile.text,
      "registerAs": "Mobile App",
      "pincode": pincode.text,
      "city": city.text,
    };
    var body = json.encode(data);
    var urlParse= Uri.parse(url);
    Response response = await http.post(
      urlParse,
      body: body,
      headers: {
        "Content-Type": "application/json"
      }
    );
    var dataa = jsonDecode(response.body);
    print(dataa);
  }
}
