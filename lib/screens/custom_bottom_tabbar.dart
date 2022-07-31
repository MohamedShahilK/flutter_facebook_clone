import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/color/colors.dart';
import 'package:flutter_facebook_clone/screens/home_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomBottomTabBar extends StatefulWidget {
  const CustomBottomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomTabBar> createState() => _CustomBottomTabBarState();
}

class _CustomBottomTabBarState extends State<CustomBottomTabBar> {
  final _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        // body: _screens[_selectedIndex],
        // body: _screens.elementAt(_selectedIndex),
        // body: TabBarView(
        //   physics: const NeverScrollableScrollPhysics(), // to remove scrolling by swiping the screen
        //   children: _screens,
        // ),

        //TabBarView are bit laggy on web.So instead of it, using IndexedStack()
        //Another benefit of using IndexedStack is if we scroll and then change tabs we maintain our
        //scroll position and also screen will not re-render, ie; we come to same position when we went(But not in tabbarview)
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: _tabBar(),
      ),
    );
  }

  //TabBar
  TabBar _tabBar() {
    return TabBar(
      // labelColor: ColorPalette.facebookBlue,
      // unselectedLabelColor: Colors.black45,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorPalette.facebookBlue,
            width: 2,
          ),
        ),
      ),
      // tabs: _icons
      //     .map(
      //       (e) => Tab(
      //         child: Icon(e),
      //       ),
      //     )
      //     .toList(),

      tabs: _icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  child: Icon(
                    e,
                    color: i == _selectedIndex
                        ? ColorPalette.facebookBlue
                        : Colors.black45,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: (newIndex) {
        setState(() {
          _selectedIndex = newIndex;
        });
      },
    );
  }
}
