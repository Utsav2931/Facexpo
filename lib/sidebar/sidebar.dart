import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/services/auth.dart';
import 'package:flutter_gif_trail/services/database.dart';
import 'package:flutter_gif_trail/sidebar/home.dart';
import 'package:flutter_gif_trail/sidebar/profilepage.dart';
import 'package:flutter_gif_trail/sidebar/temp.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import '../sidebar/menu_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SideBar extends StatefulWidget {
  String uid;
 
  SideBar(String uid) {
    this.uid = uid;

    print('uid2 ' + this.uid);
  }
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
   final users = Provider.of<List<UserInfo>>(context);
   UserInfo finaluser = UserInfo();
     //for (var doc in user.documents) {
      //if (doc.data['uid'] == widget.uid) {
       // if (doc.data['check'] == 'true') {
      //  UserInfo finaluser = UserInfo();
      if (users != null)
      users.forEach((user) {
        print(user.name);
        print(user.id);
        if (user.uid == widget.uid) {
          finaluser = user;
        }
      });
    print('Final Name:' + finaluser.name);

   // if (finaluser.check == 'true'){

    
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userData,
      
      child: Container(
        
        child: StreamBuilder<bool>(
           
          initialData: false,
          stream: isSidebarOpenedStream,
          builder: (context, isSideBarOpenedAsync) {
            return AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
              right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.black,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                          ),
                          ListTile(
                            title: Text(
                              //doc.data['name'],
                             finaluser.name  ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              //doc.data['email'],
                             finaluser.email,
                              style: TextStyle(
                                color: Color(0xFF1BB5FD),
                                fontSize: 18,
                              ),
                            ),
                            leading: CircleAvatar(
                              
                              radius: 40,
                                  
                        
                        child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                            ),   
                          ),
                          Divider(
                            height: 64,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItem(
                            icon: Icons.home,
                            title: "Home",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeSearch()));
                            },
                          ),
                          MenuItem(
                            icon: Icons.person,
                            title: "View Profile",
                            onTap: () {
                              print('pressed');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Temp(
                                            widget.uid,
                                          )));
                            },
                          ),
                          MenuItem(
                            icon: Icons.person,
                            title: "Update profile",
                            onTap: () {
                              onIconPressed();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage(
                                            uid: widget.uid,
                                          )));
                            },
                          ),
                          Divider(
                            height: 64,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItem(
                            icon: Icons.settings,
                            title: "Settings",
                          ),
                          GestureDetector(
                            onTap: () async {
                              dynamic result = await _auth.signOut();
                              if (result == null) {
                                print('Error');
                              }
                            },
                            child: MenuItem(
                              icon: Icons.exit_to_app,
                              title: "Logout",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.9),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 110,
                          color: Colors.black,
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
     //}}}
class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
