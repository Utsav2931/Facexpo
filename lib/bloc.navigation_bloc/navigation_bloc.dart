import 'package:flutter/cupertino.dart';

import '../pages/myaccountspage.dart';
import '../pages/myorderspage.dart';
import '../sidebar/temp.dart';
import '../pages/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/database.dart';
import '../sidebar/home_profile.dart';
import '../sidebar/home.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  
  @override
  NavigationStates get initialState => HomeSearch();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        //yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
    }
  }
}
