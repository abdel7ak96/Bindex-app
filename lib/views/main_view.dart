import 'package:flutter/material.dart';
import '../components/fab_bottom_app_bar.dart';
import '../components/search.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  void setCurrentPageIndex(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: PageView(
          onPageChanged: setCurrentPageIndex,
          controller: _pageController,
          children: const [
            Center(
              child: Search(),
            ),
            Center(
              child: Text("2"),
            ),
            Center(
              child: Text("3"),
            ),
            Center(
              child: Text("4"),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        elevation: 2.0,
        tooltip: 'Add a book',
      ),
      bottomNavigationBar: FABBottomAppBar(
          selectedTabIndex: _currentPageIndex,
          setSelectedTabIndex: (index) => {_pageController.jumpToPage(index)}),
    );
  }
}
