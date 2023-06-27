import 'package:eqipped_test/component/page_side_bar/order.dart';
import 'package:eqipped_test/component/page_side_bar/Vendor.dart';
import 'package:eqipped_test/component/page_side_bar/Profile_page.dart';
import 'package:eqipped_test/component/page_side_bar/product.dart';
import 'package:eqipped_test/component/page_side_bar/setting.dart';
import 'package:eqipped_test/component/page_side_bar/notifcation.dart';
import 'package:eqipped_test/component/page_side_bar/user.dart';
import 'package:flutter/material.dart';
import '../dashboard.dart';

class SideMenu extends StatelessWidget {
  // const SideMenu({Key? key}) : super(key: key);
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Drawer(
  //     elevation: 0,
  //     child: Container(
  //       width: double.infinity,
  //       height: SizeConfig.screenHeight,
  //       color: AppColors.secondaryBg,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Container(
  //               height: 100,
  //               alignment: Alignment.topCenter,
  //               padding: const EdgeInsets.only(top: 20),
  //               child: SizedBox(
  //                 width: 35,
  //                 height: 35,
  //                 child: SvgPicture.asset('assets/mac-action.svg'),
  //               ),
  //             ),
  //             IconButton(
  //               onPressed: () {},
  //
  //               icon: SvgPicture.asset(
  //                 'assets/home.svg', color: AppColors.iconGray,),
  //               iconSize: 20,
  //               padding: const EdgeInsets.symmetric(vertical: 20.0),
  //
  //             ),
  //
  //             IconButton(
  //               onPressed: () {},
  //               icon: SvgPicture.asset(
  //                 'assets/home.svg', color: AppColors.iconGray,),
  //               iconSize: 20,
  //               padding: const EdgeInsets.symmetric(vertical: 20.0),
  //             ),
  //
  //             // ignore: deprecated_member_use
  //             IconButton(
  //               onPressed: () {},
  //               icon: SvgPicture.asset(
  //                 'assets/home.svg', color: AppColors.iconGray,),
  //               iconSize: 20,
  //               padding: const EdgeInsets.symmetric(vertical: 20.0),
  //             ),
  //             IconButton(
  //               onPressed: () {},
  //               icon: SvgPicture.asset(
  //                 'assets/home.svg', color: AppColors.iconGray,),
  //               iconSize: 20,
  //               padding: const EdgeInsets.symmetric(vertical: 20.0),
  //             ),
  //             IconButton(
  //               onPressed: () {},
  //               icon: SvgPicture.asset(
  //                 'assets/home.svg', color: AppColors.iconGray,),
  //               iconSize: 20,
  //               padding: const EdgeInsets.symmetric(vertical: 20.0),
  //             ),
  //             IconButton(
  //               onPressed: () {},
  //               icon: SvgPicture.asset(
  //                 'assets/home.svg', color: AppColors.iconGray,),
  //               iconSize: 20,
  //               padding: const EdgeInsets.symmetric(vertical: 20.0),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // }

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    const name = 'Sarah Abs';
    const email = 'sarah@abs.com';
    const urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(220, 218, 215, 255),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserPage(
                  name: 'Prakhar Maheshwari',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              // padding: padding,
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  // buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Dashboard',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Order',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Product',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Vendor',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'User',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notification',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  // const SizedBox(height: 24),
                  // const Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Sitting',
                    icon: Icons.account_tree_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.black;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.black26;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Order_box(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Product(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Vendor(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const User(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Setting(),
        ));
        break;
      //   case 6:
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => Notification(),
      //     ));
    }
  }
}
