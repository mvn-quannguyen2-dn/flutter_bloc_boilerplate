// Cores
import 'package:flutter/material.dart';
// Blocs
import 'package:flutter_bloc_boilerplate/blocs/app_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/export_blocs.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';
// Pages
import 'package:flutter_bloc_boilerplate/views/pages/home/home_page.dart';
import 'package:flutter_bloc_boilerplate/views/pages/settings/settings_page.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation>
    with WidgetsBindingObserver {
  int selectedIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      AppBloc.appStateBloc.add(OnResume());
    }
    if (state == AppLifecycleState.paused) {
      AppBloc.appStateBloc.add(OnBackground());
    }
  }

  Future<void> _onItemTapped(index) async {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: <Widget>[
          HomePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: TranslateHelper.of(context).translate('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: TranslateHelper.of(context).translate('settings'),
          ),
        ],
        iconSize: 30,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
