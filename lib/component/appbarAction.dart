import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/colors.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/calendar.svg',
            width: 20.0,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/ring.svg',
            width: 20.0,
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Row(
          children: const [
            CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/id/1291318636/photo/put-more-in-get-more-out.jpg?s=1024x1024&w=is&k=20&c=8EjNKuwU5vSrbGEdVXxKH9aNf5Fd33pcq1DPOrR7d1M="),
            ),
            Icon(Icons.arrow_drop_down_outlined, color: AppColors.primary)
          ],
        ),
      ],
    );
  }
}