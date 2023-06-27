import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Product_create extends StatefulWidget {
  const Product_create({Key? key}) : super(key: key);

  @override
  State<Product_create> createState() => _Product_createState();
}

class _Product_createState extends State<Product_create> {

  TextEditingController productID = TextEditingController();
  TextEditingController productType = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController Quantity = TextEditingController();
  TextEditingController prices = TextEditingController();
  TextEditingController TotalPrices = TextEditingController();
  TextEditingController status = TextEditingController();
  // TextEditingController profile = TextEditingController();
  // TextEditingController registerAs = TextEditingController();
  // TextEditingController pincode = TextEditingController();
  // TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Create"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0,right: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(controller: productID, decoration: const InputDecoration(hintText: "productID"),),
            TextField(controller: productType, decoration: const InputDecoration(hintText: "productType"),),
            TextField(controller: category, decoration: const InputDecoration(hintText: "category"),),
            TextField(controller: Quantity,decoration: const InputDecoration(hintText: "Quantity"),),
            TextField(controller: prices,decoration: const InputDecoration(hintText: "prices"),),
            TextField(controller: TotalPrices,decoration: const InputDecoration(hintText: "TotalPrices"),),
            TextField(controller: status,decoration: const InputDecoration(hintText: "status"),),
            // TextField(controller: profile,decoration: const InputDecoration(hintText: "password"),),
            // TextField(controller: registerAs,decoration: const InputDecoration(hintText: "password"),),
            // TextField(controller: pincode,decoration: const InputDecoration(hintText: "password"),),
            // TextField(controller: city,decoration: const InputDecoration(hintText: "password"),),
            ElevatedButton(onPressed: (){registerProduct();}, child: const Text("Register"))
          ],
        ),
      ),
    );
  }

  void registerProduct() async{
    var url = "http://codea2z.online:5002/user/vendor";

    var data = {
      "productID": productID.text,
      "productType": productType.text,
      "Quality": Quantity.text,
      "category": category.text,
      "prices": prices.text,
      "TotalPrices": TotalPrices.text,
      "status": status.text,
      // "registerAs": registerAs.text,
      // "pincode": pincode.text,
      // "city": city.text,
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
