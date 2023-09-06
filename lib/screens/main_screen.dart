import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/activity_screen.dart';
import 'package:instagram_clone/screens/home_page.dart';
import 'package:instagram_clone/screens/post_upload_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNaviItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff1C1F2E),
            currentIndex: _selectedBottomNaviItem,
            onTap: (int index) {
              setState(
                () {
                  _selectedBottomNaviItem = index;
                },
              );
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_home.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_active_home.png',
                ),
                label: 'Item1',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_search_navigation.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_search_navigation_active.png',
                ),
                label: 'Item2',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_add_navigation.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_add_navigation_active.png',
                ),
                label: 'Item3',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_activity_navigation.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_activity_navigation_active.png',
                ),
                label: 'Item4',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color(0xffc5c5c5),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.5),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/user.png'),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color(0xfff35383),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.5),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/user.png'),
                    ),
                  ),
                ),
                label: 'Item4',
              )
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNaviItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      PostUploadScreen(),
      ActivityScreen(),
      UserProfileScreen()
    ];
  }
}
