import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/sidebar/home_profile.dart';
import 'package:provider/provider.dart';

class Temp2 extends StatelessWidget {
  String name;
  int cnt = 0;
  Temp2(String name) {
    this.name = name;
    print('name ' + this.name);
  }
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserInfo>>(context) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return HomeProfile(finaluser: users[index], finalname: name);
        },
      ),
    );
  }
}

class Temp22 extends StatelessWidget {
  String course;
  int cnt = 0;
  Temp22(String course) {
    this.course = course;
    print('course ' + this.course);
  }
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserInfo>>(context) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return HomeProfile2(finaluser: users[index], finalcourse: course);
        },
      ),
    );
  }
}

class Temp23 extends StatelessWidget {
  String department;
  int cnt = 0;
  Temp23(String department) {
    this.department = department;
    print('course ' + this.department);
  }
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserInfo>>(context) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return HomeProfile3(
              finaluser: users[index], finaldepartment: department);
        },
      ),
    );
  }
}

class Temp24 extends StatelessWidget {
  String institue;
  int cnt = 0;
  Temp24(String institue) {
    this.institue = institue;
    print('institue ' + this.institue);
  }
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserInfo>>(context) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return HomeProfile4(finaluser: users[index], finalinstitue: institue);
        },
      ),
    );
  }
}

class Temp25 extends StatelessWidget {
  String interest;
  int cnt = 0;
  Temp25(String interest) {
    this.interest = interest;
    print('institue ' + this.interest);
  }
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserInfo>>(context) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return HomeProfile5(finaluser: users[index], finalinterest: interest);
        },
      ),
    );
  }
}
