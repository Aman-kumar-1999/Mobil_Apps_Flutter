import 'dart:convert';

import 'package:eqipped_test/BaseUrl.dart';
import 'package:flutter/material.dart';
import 'package:eqipped_test/components/product_card.dart';
import 'package:eqipped_test/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;
class ProductsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopularProducts();
  }
}

class _PopularProducts extends State<ProductsPage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  void initState() {
    super.initState();
    fetchProductData();

  }

  // late List<dynamic> products=[];
  String jsonProducts = "";
  // static List<dynamic> products = [];

  void fetchProductData() async {
    var url = Uri.parse('${BaseUrl.URL}/product/category/Equipments');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // Request successful, parse the response body

        List<dynamic> responseBody = jsonDecode(response.body);
        // products.addAll(responseBody);
        // Process the response data as needed
        // print("Data ${responseBody}");

        // for(int i=0;i<responseBody.length;i++){
        //   print("prod : ${responseBody[i]['productId']}");
        //
        // }

        // productMap =
        // print("Product : ${products}");
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Equipments", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [



              ...List.generate(
                demoProducts.length,
                    (index) {
                  if (demoProducts[index].isPopular) {
                    return ProductCard(product: demoProducts[index]);
                  }

                  return const SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
