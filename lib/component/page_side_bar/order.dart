import 'package:eqipped_test/component/page_side_bar/grid_text/CardWidget.dart';
import 'package:eqipped_test/component/page_side_bar/table/horizaontal_table.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/category_orders.dart';
import 'package:flutter/material.dart';


class Order_box extends StatelessWidget {
  const Order_box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        backgroundColor: Color(0xFF42A5F5),
      ),
      body: Column(
        children: [
           CardWidget(),
          // SizedBox(height: getProportionateScreenWidth(10)),
           const CategoryOrder(),
          // SizedBox(height: getProportionateScreenWidth(10)),
          Container(
              height: 320,
              child: ListView(children: [Horizontal_table()])),
        ],
      ),
    );
  }
}