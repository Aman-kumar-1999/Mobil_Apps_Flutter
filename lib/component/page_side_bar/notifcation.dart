import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Notification'),
      centerTitle: true,
      backgroundColor: Color(0xFF42A5F5),
    ),
  );
}
