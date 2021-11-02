import 'package:flutter/material.dart';
import '../../components/fab_bottom_app_bar.dart';

// Pages
import 'pages/search.dart';
import 'pages/profile.dart';
import 'pages/messages.dart';
import 'pages/explore.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
            Explore(),
            Messages(),
            Profile()
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
