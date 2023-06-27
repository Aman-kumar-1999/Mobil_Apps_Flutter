import 'package:eqipped_test/size_config.dart';
import 'package:flutter/material.dart';
import 'package:eqipped_test/screens/home/home_screen.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          SizeConfig().init(context);
    return Scaffold(
      body:Container(
    child: HomeScreen(),
      ),
      // drawer: const Drawer(),

    );
  }
}