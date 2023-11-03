import 'package:flutter/material.dart';
import 'package:food_recipes/constance.dart';
import 'package:food_recipes/screens/favourites_screen.dart';
import 'package:food_recipes/screens/home_screen.dart';

class Layout extends StatefulWidget {
  static List<Widget> screens = [
    const HomeScreen(),
    const FavouritesScreen(),
  ];

  static int currentIndex = 0;

  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Layout.screens.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(
            Icons.menu,
            size: 30,
            color: mainColor,
          ),
          title: Text(
            'Favourite Recipe',
            style: TextStyle(
              color: mainColor,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Icon(
              Icons.search,
              color: mainColor,
              size: 30,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, offset: Offset(0, -.4)),
            ],
          ),
          padding: const EdgeInsets.only(bottom: 5),
          child: TabBar(
            labelColor: mainColor,
            indicatorColor: mainColor,
            dividerHeight: 0,
            tabs: const [
              Tab(
                child: Icon(
                  Icons.home_outlined,
                  size: 27,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.favorite_outline,
                  size: 27,
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                Layout.currentIndex = index;
              });
            },
          ),
        ),
        body: Layout.screens[Layout.currentIndex],
      ),
    );
  }
}
