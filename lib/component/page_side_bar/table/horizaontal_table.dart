import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class Horizontal_table extends StatefulWidget {

  @override
  _Horizontal_tableState createState() => _Horizontal_tableState();
}

class _Horizontal_tableState extends State<Horizontal_table> {
  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  @override
  void initState(){
    user.initData(100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getBodyWidget();

  }
  Widget _getBodyWidget() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 120,
          rightHandSideColumnWidth: 600,
          isFixedHeader: true,

          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: user.userInfo.length,
          rowSeparatorWidget: const Divider(
            color: Colors.black54,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: Color(0xFF42A5F5),
          rightHandSideColBackgroundColor: Color(0xFF42A5F5),
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      ElevatedButton(

        // padding: EdgeInsets.all(0),
        child: _getTitleItemWidget(
            'Sr No. ${sortType == sortName ? (isAscending ? '  ↓' : '  ↑') : ''}',
            120,Color(0xFF42A5F5)),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {

          });
        },
      ),

      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Vendor ID', 100,Colors.white38,),
      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Date', 100,Colors.white38),
      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Vendor Name', 100,Colors.white38),
      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Place', 100,Colors.white38),
      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Contact', 100,Colors.white38),
      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Document-1', 100,Colors.white38),

      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Document-2', 100,Colors.white38),
      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Status', 100,Colors.white38),
      Container(width: 2,height: 56,color: Colors.white38,),
      _getTitleItemWidget('Action', 100,Colors.white38),
      // Container(width: 2,height: 56,color: Colors.white,),
      // ElevatedButton(
      //   // padding: EdgeInsets.all(0),
      //   child: _getTitleItemWidget('Attendance${sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''}', 100,Colors.red),
      //   onPressed: () {
      //     sortType = sortStatus;
      //     isAscending = !isAscending;
      //     user.sortStatus(isAscending);
      //     setState(() {
      //
      //     });
      //   },
      // ),
      // Container(width: 2,height: 56,color: Colors.white,),
      // _getTitleItemWidget('Start Time', 100,Colors.red),
      // Container(width: 2,height: 56,color: Colors.white,),
      // _getTitleItemWidget('End Time', 200,Colors.red),
    ];
  }

  Widget _getTitleItemWidget(String label, double width,color) {
    return Container(
      color: color,
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      color: Colors.white38,
      width: 120,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(user.userInfo[index].Sr_id,style: const TextStyle(fontSize: 18,color: Colors.black),),
    );
  }
  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(user.userInfo[index].Vendor_id,style: TextStyle(fontSize: 18),),
        ),
        Container(width: 2,height: 56,color: Colors.white38,),
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                  user.userInfo[index].status
                      ? Icons.clear
                      : Icons.check,
                  color: user.userInfo[index].status ? Colors.red : Colors
                      .green),
              Text(user.userInfo[index].status ? 'absent' : 'present',style: TextStyle(fontSize: 18),)
            ],
          ),
        ),
        Container(width: 2,height: 56,color: Colors.white10,),
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(user.userInfo[index].start_time,style: const TextStyle(fontSize: 18),),
        ),
        Container(width: 2,height: 56,color: Colors.white38,),
        Container(
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(user.userInfo[index].end_time,style: const TextStyle(fontSize: 18),),
        ),
      ],
    );
  }
}

Student user = Student();

class Student {
  List<StudentInfo> _userInfo = <StudentInfo>[];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      _userInfo.add(StudentInfo(
          "Sr_id$i", i % 3 == 0, 'Vendor_id$i', '10:00 AM', '12:30 PM'));
    }
  }

  List<StudentInfo> get userInfo => _userInfo;

set userInfo(List<StudentInfo> value) {
  _userInfo = value;
}

///
/// Single sort, sort Name's id
void sortName(bool isAscending) {
  _userInfo.sort((a, b) {
    var aId = int.tryParse(a.Sr_id.replaceFirst('Student_', ''));
    var bId = int.tryParse(b.Vendor_id.replaceFirst('Student_', ''));
    return (aId! - bId!) * (isAscending ? 1 : -1);
  });
}
  void sortStatus(bool isAscending) {
    _userInfo.sort((a, b) {
      if (a.status == b.status) {
        int? aId = int.tryParse(a.Sr_id.replaceFirst('User_', ''));
        int? bId = int.tryParse(b.Vendor_id.replaceFirst('User_', ''));
        return (aId!- bId!);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class StudentInfo {
  String Sr_id;
  bool status;
  String Vendor_id;
  String start_time;
  String end_time;

  StudentInfo(this.Sr_id, this.status, this.Vendor_id, this.start_time,
      this.end_time);
}
