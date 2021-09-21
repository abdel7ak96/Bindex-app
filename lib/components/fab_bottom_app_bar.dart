import 'package:flutter/material.dart';

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar({ Key? key, required this.selectedTabIndex, required this.setSelectedTabIndex}) : super(key: key);

  final int selectedTabIndex;
  final Function setSelectedTabIndex;

  @override
  _FABBottomAppBarState createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends State<FABBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FABBottomAppBarItem(
              iconWidget: Icons.search,
              text: 'Search',
              index: 0,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
          FABBottomAppBarItem(
              iconWidget: Icons.map,
              text: 'Explore',
              index: 1,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
          const SizedBox(width: 40.0),
          FABBottomAppBarItem(
              iconWidget: Icons.question_answer,
              text: 'Messages',
              index: 2,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
          FABBottomAppBarItem(
              iconWidget: Icons.person_outline,
              text: 'Profile',
              index: 3,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
        ],
      ),
    );
  }
}

class FABBottomAppBarItem extends StatelessWidget {
  const FABBottomAppBarItem(
      {Key? key,
      required this.iconWidget,
      required this.text,
      required this.index,
      required this.selectedIndex,
      required this.change})
      : super(key: key);

  final IconData iconWidget;
  final String text;
  final int index;
  final int selectedIndex;
  final Function change;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(35.0),
        onTap: () {
          change(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconWidget,
                  color:
                      index == selectedIndex ? Colors.black : Colors.black38),
              Text(text,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: index == selectedIndex
                          ? Colors.black
                          : Colors.black38))
            ],
          ),
        ),
      ),
    );
  }
}