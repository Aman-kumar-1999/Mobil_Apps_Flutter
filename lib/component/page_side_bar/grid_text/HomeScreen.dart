import 'package:eqipped_test/component/page_side_bar/grid_text/CardWidget.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color(0xFF42A5F5);

  // late TabController _tabController;

  // @override
  // void initState() {
  //   _tabController = new TabController(length: 3, vsync: this, initialIndex: 0)
  //     ..addListener(() {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Status',
          style: TextStyle(fontSize: 27, color: colorstheme),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colorstheme,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
      ),
      body: CardWidget(),
      // CardWidget(),
      // CardWidget(),
    );
  }
}
