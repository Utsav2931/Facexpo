import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/services/database.dart';
import 'package:flutter_gif_trail/sidebar/view_profile.dart';
import 'package:provider/provider.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class Temp extends StatelessWidget  {
  String uid;
  Temp(String uid) {
    this.uid = uid;
    print('uid3 ' + this.uid);
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userData,
      child: Scaffold(
        body: ViewProfile(uid),
      ),
    );
  }
}
