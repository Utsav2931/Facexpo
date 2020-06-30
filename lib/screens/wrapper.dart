import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/Setup/loading.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/sidebar/sidebar_layout.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return AfterSplash();
    } else {
      print('Done');
      return SideBarLayout(
        user.uid,
      );
    }
  }
}
