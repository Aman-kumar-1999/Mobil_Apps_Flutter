import 'package:eqipped_test/component/page_side_bar/table/horizaontal_table.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/One_add_all.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/category_orders.dart';
import 'package:flutter/material.dart';
import '../../components/product_card.dart';
import 'grid_text/CardWidget.dart';
import 'grid_text/add_value_product.dart';
import 'grid_text/product_card.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Product"),
      backgroundColor: Color(0xFF42A5F5),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Add_product(),
          ProductCards(),

          const CategoryOrder(),
          // SizedBox(height: getProportionateScreenWidth(10)),

          Container(
              height: 920,
              child: ListView(children: [Horizontal_table()])),

        ],
      ),
    ),
  );
}
