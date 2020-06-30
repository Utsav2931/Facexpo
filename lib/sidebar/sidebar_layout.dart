import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/sidebar/view_profile.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';
import 'package:flutter_gif_trail/services/database.dart';
import 'package:provider/provider.dart';

class SideBarLayout extends StatelessWidget {
  String uid;
  

  SideBarLayout(String uid) {
    this.uid = uid;
    print('uid ' + this.uid);
  }
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<QuerySnapshot>(context);
   // final users = Provider.of<List<UserInfo>>(context);
 // UserInfo finaluser = UserInfo();

        return StreamProvider<List<UserInfo>>.value(
     
      value: DatabaseService().userData,
            child: Scaffold(
        body: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: Stack(
            children: <Widget>[
              BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
                  return navigationState as Widget;
                },
              ),
              SideBar(
                uid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
