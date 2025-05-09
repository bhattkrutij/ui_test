import 'package:flutter/material.dart';
import 'package:ui_test/utils/strings.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String? selectedKey;

  final List<MenuItem> menuItems = [
    MenuItem(title: home, key: home),
    MenuItem(title: items, key: items),
    MenuItem(title: banking, key: banking),

    MenuItem(
      title: sales,
      key: sales,
      subItems: [MenuItem(title: salseMenu1, key: salseMenu1), MenuItem(title: salseMenu2, key: salseMenu2)],
    ),
    MenuItem(title: purchases, key: purchases),
    MenuItem(title: timeTracking, key: timeTracking),
    MenuItem(title: accountant, key: accountant),
    MenuItem(title: reports, key: reports),
    MenuItem(title: documents, key: documents),
    MenuItem(title: payrolls, key: payrolls),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      color: Colors.grey[100],
      child: ListView(children: menuItems.map((item) => _buildMenuItem(item)).toList()),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    final bool isSelected = selectedKey == item.key;

    if (item.subItems.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.transparent),
          ),
          child: ListTile(
            title: Text(item.title, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
            tileColor: isSelected ? Colors.white : Colors.black,
            onTap: () {
              setState(() {
                selectedKey = item.key;
              });
            },
          ),
        ),
      );
    } else {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          collapsedTextColor: Colors.black,
          collapsedIconColor: Colors.black,
          collapsedBackgroundColor: Colors.transparent,
          title: Text(
            item.title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              backgroundColor: isSelected ? Colors.blue : Colors.transparent,
            ),
          ),
          children:
              item.subItems.map((subItem) {
                final bool isSubSelected = selectedKey == subItem.key;
                return ListTile(
                  title: Text(subItem.title, style: TextStyle(color: isSubSelected ? Colors.blue : Colors.black)),
                  tileColor: isSubSelected ? Colors.green : Colors.transparent,
                  onTap: () {
                    setState(() {
                      selectedKey = subItem.key;
                    });
                  },
                );
              }).toList(),
          onExpansionChanged: (_) {
            setState(() {
              selectedKey = item.key;
            });
          },
        ),
      );
    }
  }
}

class MenuItem {
  final String title;
  final String key;
  final List<MenuItem> subItems;

  MenuItem({required this.title, required this.key, this.subItems = const []});
}
