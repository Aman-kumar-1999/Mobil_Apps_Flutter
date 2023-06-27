import 'package:eqipped_test/component/page_side_bar/grid_text/User_card.dart';
import 'package:eqipped_test/component/page_side_bar/grid_text/add_value_user.dart';
import 'package:eqipped_test/component/page_side_bar/table/horizaontal_table.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/One_add_all.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/category_orders.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'grid_text/CardWidget.dart';
import 'grid_text/add_value_product.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF42A5F5),
        title: const Text("User"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Add_User(),
            User_card(),

            SizedBox(height: getProportionateScreenWidth(10)),
            
            SizedBox(height: getProportionateScreenWidth(10)),
            const CategoryOrder(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Container(
                height: 920, child: ListView(children: [Horizontal_table()])),
            Text("data")
          ],
        ),
      ),
    );
  }
}
