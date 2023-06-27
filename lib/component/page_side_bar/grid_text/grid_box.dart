// import 'package:flutter/material.dart';
//
// class GridOrder extends StatelessWidget {
//   const GridOrder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 18.0),
//       child: GridView.builder(
//         itemCount: data.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           // crossAxisSpacing: 10
//         ),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Card(
//               color: data[index]["color"],
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               child: Padding(
//                 // padding: const EdgeInsets.all(0.0),
//                 padding: const EdgeInsets.only(
//                     left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           '  Heart Rate',
//                           style: TextStyle(color: colorwhite, fontSize: 16),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(30),
//                                   bottomLeft: Radius.circular(30),
//                                   bottomRight: Radius.circular(30)),
//                               color: Color.fromRGBO(255, 255, 255, 0.38)),
//                           child: const Text("108"),
//                         )
//                       ],
//                     ),
//                     Container(
//                         alignment: Alignment.topLeft,
//                         padding: const EdgeInsets.only(left: 10, bottom: 20),
//                         child: Text(
//                           '144 bpm',
//                           style: TextStyle(fontSize: 25, color: colorwhite),
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
