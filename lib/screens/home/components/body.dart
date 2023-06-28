import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'brand_name.dart';
import 'categories.dart';
import 'categories1.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            Categories(),
            Categories1(),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            ProductsPage(),
            SizedBox(height: getProportionateScreenWidth(30)),
            // ProductsPage(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            const Brand_Name_Image(),
          ],
        ),
      ),
    );
  }
}
