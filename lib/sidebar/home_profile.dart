import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/services/database.dart';
import 'package:flutter_gif_trail/sidebar/temp.dart';
import 'package:provider/provider.dart';

class HomeProfile extends StatelessWidget {
  UserInfo finaluser;
  String finalname;
  HomeProfile({this.finaluser, this.finalname});
  //String name = finaluser.name;
  @override
  Widget build(BuildContext context) {
    String name = finaluser.name;
    String expert = finaluser.expertise;
    if (equalsIgnoreCase(name, finalname)) {
      return StreamProvider<List<UserInfo>>.value(
        value: DatabaseService().userData,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('$name'),
                    subtitle: Text('Expert in $expert field'),
                  ),
                  SizedBox(height: 8.0),
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('View Profile'),
                    onPressed: () {
                      print('touched');
                      print(finaluser.name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Temp(finaluser.uid)));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      int l1 = 0;
      if (finalname != null) {
        l1 = finalname.length;
      }

      int l2 = 0;
      if (finaluser.name != null) {
        l2 = finaluser.name.length;
      }
      bool flag = false;
      for (int i = 0; i < l2 - l1 + 1; i++) {
        print('Name:::' + finaluser.name.substring(i, i + l1));

        if (equalsIgnoreCase(finaluser.name.substring(i, i + l1),finalname))
          flag = true;
      }
      print(flag);
      if (flag) {
        return StreamProvider<List<UserInfo>>.value(
          value: DatabaseService().userData,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      title: Text('$name'),
                      subtitle: Text('Expert in $expert field'),
                    ),
                    SizedBox(height: 8.0),
                    FlatButton.icon(
                      icon: Icon(Icons.person),
                      label: Text('View Profile'),
                      onPressed: () {
                        print('touched');
                        print(finaluser.name);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Temp(finaluser.uid)));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    
    }
  }
}

class HomeProfile2 extends StatelessWidget {
  UserInfo finaluser;
  String finalcourse;
  HomeProfile2({this.finaluser, this.finalcourse});
  //String name = finaluser.name;
  @override
  Widget build(BuildContext context) {
    String name = finaluser.name;
    String course = finaluser.course;
    String expert = finaluser.expertise;
    if (equalsIgnoreCase(course, finalcourse)) {
      return StreamProvider<List<UserInfo>>.value(
        value: DatabaseService().userData,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('$name'),
                    subtitle: Text('Expert in $expert field'),
                  ),
                  SizedBox(height: 8.0),
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('View Profile'),
                    onPressed: () {
                      print('touched');
                      print(finaluser.name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Temp(finaluser.uid)));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class HomeProfile3 extends StatelessWidget {
  UserInfo finaluser;
  String finaldepartment;
  HomeProfile3({this.finaluser, this.finaldepartment});
  //String name = finaluser.name;
  @override
  Widget build(BuildContext context) {
    String name = finaluser.name;
    String department = finaluser.department;
    String expert = finaluser.expertise;
    if (equalsIgnoreCase(department, finaldepartment)) {
      return StreamProvider<List<UserInfo>>.value(
        value: DatabaseService().userData,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('$name'),
                    subtitle: Text('Expert in $expert field'),
                  ),
                  SizedBox(height: 8.0),
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('View Profile'),
                    onPressed: () {
                      print('touched');
                      print(finaluser.name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Temp(finaluser.uid)));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class HomeProfile4 extends StatelessWidget {
  UserInfo finaluser;
  String finalinstitue;
  HomeProfile4({this.finaluser, this.finalinstitue});
  //String name = finaluser.name;
  @override
  Widget build(BuildContext context) {
    String name = finaluser.name;
    String institue = finaluser.instituename;
    String expert = finaluser.expertise;
    if (equalsIgnoreCase(institue, finalinstitue)) {
      return StreamProvider<List<UserInfo>>.value(
        value: DatabaseService().userData,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('$name'),
                    subtitle: Text('Expert in $expert field'),
                  ),
                  SizedBox(height: 8.0),
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('View Profile'),
                    onPressed: () {
                      print('touched');
                      print(finaluser.name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Temp(finaluser.uid)));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class HomeProfile5 extends StatelessWidget {
  UserInfo finaluser;
  String finalinterest;
  HomeProfile5({this.finaluser, this.finalinterest});
  //String name = finaluser.name;
  @override
  Widget build(BuildContext context) {
    String name = finaluser.name;
    String interest = finaluser.expertise;
    String expert = finaluser.expertise;
    if (equalsIgnoreCase(interest, finalinterest)) {
      return StreamProvider<List<UserInfo>>.value(
        value: DatabaseService().userData,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('$name'),
                    subtitle: Text('Expert in $expert field'),
                  ),
                  SizedBox(height: 8.0),
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('View Profile'),
                    onPressed: () {
                      print('touched');
                      print(finaluser.name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Temp(finaluser.uid)));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      int l1 = 0;
      if (finalinterest != null) {
        l1 = finalinterest.length;
      }

      int l2 = 0;
      if (finaluser.expertise != null) {
        l2 = finaluser.expertise.length;
      }
      bool flag = false;
      for (int i = 0; i < l2 - l1 + 1; i++) {
        print('Name:::' + finaluser.expertise.substring(i, i + l1));

        if (equalsIgnoreCase(finaluser.expertise.substring(i, i + l1),finalinterest))
          flag = true;
      }
      print(flag);
      if (flag) {
        return StreamProvider<List<UserInfo>>.value(
          value: DatabaseService().userData,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: ClipOval(
                          child: Image.network(
                            (finaluser.image!=null)?
                                                //fullPathImage+'?alt=media' : " ",
                                                //fit: BoxFit.fill

                            '${finaluser.image}' + '?alt=media': " ",
                        fit: BoxFit.fill,
                        ),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      title: Text('$name'),
                      subtitle: Text('Expert in $expert field'),
                    ),
                    SizedBox(height: 8.0),
                    FlatButton.icon(
                      icon: Icon(Icons.person),
                      label: Text('View Profile'),
                      onPressed: () {
                        print('touched');
                        print(finaluser.name);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Temp(finaluser.uid)));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
      return Container();
    }
  }
}
bool equalsIgnoreCase(String string1, String string2) {
  return string1?.toLowerCase() == string2?.toLowerCase();
}