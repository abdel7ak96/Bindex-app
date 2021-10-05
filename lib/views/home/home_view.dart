import 'package:flutter/material.dart';
import '../../components/fab_bottom_app_bar.dart';
import '../../components/search.dart';
import '../../services/auth.dart';

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

    AuthService auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: PageView(
          onPageChanged: setCurrentPageIndex,
          controller: _pageController,
          children: [
            const Center(
              child: Search(),
            ),
            const Center(
              child: Text("2"),
            ),
            const Center(
              child: Text("3"),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  auth.signOut();
                },
                child: const Text('Sign out')
              )
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
