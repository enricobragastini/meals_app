import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "/filters";
  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"]!;
    _vegetarian = widget.currentFilters["vegetarian"]!;
    _vegan = widget.currentFilters["vegan"]!;
    _lactoseFree = widget.currentFilters["lactose"]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildSwitchListTile(String title, String description,
        bool currentValue, void Function(dynamic) updateValue) {
      return SwitchListTile(
          title: Text(title),
          subtitle: Text(description),
          value: currentValue,
          onChanged: updateValue);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              setState(() {
                widget.saveFilters({
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegetarian": _vegetarian,
                  "vegan": _vegan,
                });
              });
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(children: [
            _buildSwitchListTile(
                "Gluten-Free", "Only include gluten-free meals.", _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile("Lactose-Free",
                "Only include lactose-free meals.", _lactoseFree, (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildSwitchListTile(
                "Vegetarian", "Only include vegetarian meals.", _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile("Vegan", "Only include vegan meals.", _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
          ]))
        ],
      ),
    );
  }
}
