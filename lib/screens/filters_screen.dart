import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName = "/filters";

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      drawer: const MainDrawer(),
      body: const Center(child: Text("Filters")),
    );
  }
}
