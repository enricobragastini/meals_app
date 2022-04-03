import 'package:flutter/material.dart';
import 'package:meals/screens/FavouritesScreen.dart';
import 'package:meals/screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = const [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavouritesScreen(), "title": "Your Favourites"}
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
      ),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Categories",
            icon: const Icon(Icons.category),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: "Favourites",
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
