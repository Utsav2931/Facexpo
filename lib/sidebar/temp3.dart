import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/services/database.dart';
import 'package:flutter_gif_trail/sidebar/temp2.dart';
import 'package:provider/provider.dart';

class Temp3 extends StatelessWidget {
  String name;
  Temp3({this.name});
  @override
  Widget build(BuildContext context) {
    print('Search Name:' + name);
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userData,
      child: Container(
        child: Temp2(name),
      ),
    );
  }
}

class Temp32 extends StatelessWidget {
  String course;
  Temp32({this.course});
  @override
  Widget build(BuildContext context) {
    print('Search Name:' + course);
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userData,
      child: Container(
        child: Temp22(course),
      ),
    );
  }
}

class Temp33 extends StatelessWidget {
  String department;
  Temp33({this.department});
  @override
  Widget build(BuildContext context) {
    print('Department Name:' + department);
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userData,
      child: Container(
        child: Temp23(department),
      ),
    );
  }
}

class Temp34 extends StatelessWidget {
  String institue;
  Temp34({this.institue});
  @override
  Widget build(BuildContext context) {
    print('Institue Name:' + institue);
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userData,
      child: Container(
        child: Temp24(institue),
      ),
    );
  }
}

class Temp35 extends StatelessWidget {
  String interest;
  Temp35({this.interest});
  @override
  Widget build(BuildContext context) {
    print('Institue Name:' + interest);
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userData,
      child: Container(
        child: Temp25(interest),
      ),
    );
  }
}
