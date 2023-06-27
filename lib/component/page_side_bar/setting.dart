import 'package:eqipped_test/component/page_side_bar/grid_text/addvalue_Setting.dart';
import 'package:eqipped_test/component/page_side_bar/table/horizaontal_table.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/One_add_all.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/category_orders.dart';
import 'package:eqipped_test/component/page_side_bar/widgets/category_setting.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Setting"),
          backgroundColor: Color(0xFF42A5F5),
        ),
        body: Column(
          children: [
            Addvalue_Setting(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const Text("Admin can add remove users and change permissions"),
            SizedBox(height: getProportionateScreenWidth(10)),
            Category_setting(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Container(
                height: 400, child: ListView(children: [Horizontal_table()])),
          ],
        ),
      );
}
