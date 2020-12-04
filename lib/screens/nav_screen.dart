import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    MdiIcons.accountGroupOutline,
    Icons.menu
  ];

  int _selectedInded = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) 
            ? PreferredSize(
              preferredSize: Size(screenSize.width, 100.0),
              child: CustomAppbar(
                currentUser : currentUser,
                icons: _icons,
                selectedIndex: _selectedInded,
              onTap: (index) => setState(() => _selectedInded = index)
              ),
            )
          : null,
        body: IndexedStack(
          index: _selectedInded,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context) ? CustomTabBar(
          icons: _icons,
          selectedIndex: _selectedInded,
          onTap: (index) => setState(() => _selectedInded = index)
        ) : SizedBox.shrink()
      ),
    );
  }
}