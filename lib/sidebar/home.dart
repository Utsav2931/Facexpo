import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/sidebar/temp3.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
int show = 1;
String filteroption;

class HomeSearch extends StatefulWidget with NavigationStates {
 static TextStyle HLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

  static BoxDecoration HBoxDecorationStyle = BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
        offset: Offset(0, 2),
      ),
    ],
  );
  @override
  _HomeSearchState createState() => _HomeSearchState();
}


class _HomeSearchState extends State<HomeSearch> {
  String name;
  //final List<String> field = ['Name', 'Course', 'Department', 'Institute'];

  void _showSettingpanel() {
    showModalBottomSheet(
     // backgroundColor: Colors.black,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Column(
              children: <Widget>[
                Filter(),
                SizedBox(height: 50.0),
                RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    if (filteroption == 'Course') {
                      setState(() {
                        show = 2;
                        Navigator.pop(context);
                      });
                    }
                    if (filteroption == 'Name') {
                      setState(() {
                        show = 1;
                        Navigator.pop(context);
                      });
                    }
                    if (filteroption == 'Department') {
                      setState(() {
                        show = 3;
                        Navigator.pop(context);
                      });
                    }
                    if (filteroption == 'Institute') {
                      setState(() {
                        show = 4;
                        Navigator.pop(context);
                      });
                    }
                    if (filteroption == 'Interest') {
                      setState(() {
                        show = 5;
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text('Done'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (show == 1) {
      return Scaffold(
      
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.filter_list,color: Colors.white,),
             
              label: Text('Filter'),
              textColor: Colors.white,
              onPressed: () => _showSettingpanel(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 0),
          child: Column(
            children: <Widget>[
              
                
                  
                  SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: HomeSearch.HBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                     onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.black, fontFamily: "OpenSans"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                         hintText: " Search Here ",
                         hintStyle: TextStyle(color:Colors.black),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                       
                        
                      ),
                    ),
                  ),
              SizedBox(height: 30),
              RaisedButton(
                child: Text('search',
            
                ),
               
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
      
                ),
                color: Colors.white,
                onPressed: () {
                  print('pressed');
                  print(name);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Temp3(name: name)));
                },
              )
            ],
          ),
        ),
      );
    } else if (show == 2) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Course'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.filter_list,color: Colors.white,),
              label: Text('Filter'),
              textColor: Colors.white,
              onPressed: () => _showSettingpanel(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 0),
          child: Column(
            children: <Widget>[
             
              SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: HomeSearch.HBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                     onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.black, fontFamily: "OpenSans"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                         hintText: " Search Here ",
                         hintStyle: TextStyle(color:Colors.black),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                       
                        
                      ),
                    ),
                  ),
              SizedBox(height: 30.0),
              RaisedButton(
                child: Text('search'
                ),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Colors.white,
                onPressed: () {
                  print('pressed');
                  print(name);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Temp32(course: name)));
                },
              )
            ],
          ),
        ),
      );
    } else if (show == 3) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Department'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.filter_list,color: Colors.white,),
              label: Text('Filter'),
              textColor: Colors.white,
              onPressed: () => _showSettingpanel(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 0),
          child: Column(
            children: <Widget>[
              
              SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: HomeSearch.HBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                     onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.black, fontFamily: "OpenSans"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                         hintText: " Search Here ",
                         hintStyle: TextStyle(color:Colors.black),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                       
                        
                      ),
                    ),
                  ),
              SizedBox(height: 30.0),
              RaisedButton(
                child: Text('search'),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Colors.white,
                onPressed: () {
                  print('pressed');
                  print(name);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Temp33(department: name)));
                },
              )
            ],
          ),
        ),
      );
    } else if (show == 4) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Institue'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.filter_list,color: Colors.white,),
              label: Text('Filter'),
              textColor: Colors.white,
              onPressed: () => _showSettingpanel(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 0),
          child: Column(
            children: <Widget>[
              
              SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: HomeSearch.HBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                     onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.black, fontFamily: "OpenSans"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                         hintText: " Search Here ",
                         hintStyle: TextStyle(color:Colors.black),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                       
                        
                      ),
                    ),
                  ),
              SizedBox(height: 30.0),
              RaisedButton(
                child: Text('search'),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Colors.white,
                onPressed: () {
                  print('pressed');
                  print(name);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Temp34(institue: name)));
                },
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Interest'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.filter_list,color: Colors.white,),
              label: Text('Filter'),
              textColor: Colors.white,
              onPressed: () => _showSettingpanel(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 0),
          child: Column(
            children: <Widget>[
              
              SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: HomeSearch.HBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      
                     onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.black, fontFamily: "OpenSans"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                         hintText: " Search Here ",
                         hintStyle: TextStyle(color:Colors.black),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                       
                        
                      ),
                    ),
                  ),
              SizedBox(height: 30.0),
              RaisedButton(
                child: Text('search'
                ),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Colors.white,
                onPressed
                : () {
                  print('pressed');
                  print(name);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Temp35(interest: name)));
                },
              )
            ],
          ),
        ),
      );
    }
  }
}

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final List<String> field = [
    'Name',
    'Course',
    'Department',
    'Institute',
    'Interest'
  ];
  //filteroption = 'Name';
  @override
  Widget build(BuildContext context) {
 
    return DropdownButtonFormField(
      
      value: filteroption?? 'Name',
      items: field.map((fields) {
        return DropdownMenuItem(
          
          value: fields,
          child: Text('$fields',style: TextStyle(color: Colors.black),),
        );
      }).toList(),
      onChanged: (val) {
        setState(() {
          filteroption = val;
          
          
        });
      },
      //style:new TextStyle(color:Colors.white),
    );
  }
}