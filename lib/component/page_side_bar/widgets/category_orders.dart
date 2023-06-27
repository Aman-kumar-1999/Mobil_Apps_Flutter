import 'package:flutter/material.dart';

class CategoryOrder extends StatelessWidget {
  const CategoryOrder({Key? key}) : super(key: key);

  // late int dropDownValue = 0;
  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(5.0),
      color: Color(0xFF42A5F5),
      child:  ListTile(
        leading: Text('TOTAL ORDER'),
        trailing: DropdownButtonExample(),
      )

    );

  }
}

const List<String> list = <String>['All', 'Today', 'Weekly', 'Monthly'];
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: DropdownButton<String>(
        value: dropdownValue,
        // icon: const Icon(Icons.arrow_downward),
        // elevation: 16,
        // style: const TextStyle(color: Colors.deepPurple),
        // underline: Container(
        //   height: 2,
        //   color: Colors.deepPurpleAccent,
        // ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

