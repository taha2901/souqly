import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:souq/core/theming/colors.dart';
import 'package:souq/features/cart/ui/cart_page.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const CartPage(),
      const FavoritesPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.home,
          color: Colors.white,
        ),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorsManager.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
        title: "Cart",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorsManager.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.heart,
          color: Colors.white,
        ),
        title: "Favorites",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorsManager.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
        title: "Profile",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorsManager.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            // onTap: () => Navigator.pop(context),
            child: Image.asset('assets/Frame 33101.png')),
        title: currentIndex == 1
            ? Text(
                "My Cart",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : Container(),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: PersistentTabView(
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(35.0),
          colorBehindNavBar: Colors.white,
        ),

        context,

        controller: _controller,
        screens: _buildScreens(),
        onItemSelected: (value) {
          setState(() {
            currentIndex = value;
            debugPrint('Current Index is $currentIndex');
          });
        },
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
        isVisible: true,
        backgroundColor: Colors.teal,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favorites Page'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
