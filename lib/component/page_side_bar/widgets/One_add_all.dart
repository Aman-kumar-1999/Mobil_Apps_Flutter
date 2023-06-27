import 'package:flutter/material.dart';

class One_addAll extends StatelessWidget {
  List data = [
    {"color": const Color(0xFF42A5F5)},
  ];

  final colorwhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        alignment: Alignment.topLeft,
        height: 200,
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2/1,
            // crossAxisSpacing: 10
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 50,
                child: Card(
                  color: data[index]["color"],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Heart Rate',
                            style: TextStyle(color: colorwhite, fontSize: 16),
                          ),

                          Container(
                            alignment: Alignment.topLeft,

                            padding: const EdgeInsets.all(60),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                color: Color.fromRGBO(255, 255, 255, 0.38)),
                            child: InkWell(
                                onTap: () {
                                  print("Add User");
                                },
                                child: Text("+")
                            ),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '144 bpm',
                            style: TextStyle(fontSize: 25, color: colorwhite),
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
