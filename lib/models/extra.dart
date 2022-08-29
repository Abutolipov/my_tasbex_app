import 'package:flutter/material.dart';

import 'base.dart';

class MyApp extends StatefulWidget {
  static const id="sad";
  _State createState() => _State();
}

class _State extends State<MyApp> {
  PageController pageController = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.page?.round()!= _currentPage) {
        setState(() {
          _currentPage = pageController.page.round();
        });
      }
    });
  }
  List<Widget> item = [
    DeterminatePage(),
    Text("Bosh"),
    Text("Bosh"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: item,
      ),
      bottomNavigationBar: _show(),
    );
  }

  Widget _show() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Book"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Image"),
      ],
      currentIndex: _currentPage,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: (page) {
        if (page != _currentPage) {
           setState(() {
            _currentPage = page;
            pageController.animateToPage(page, duration: Duration(milliseconds: 20), curve: Curves.easeInOutCubic);
          });
        }
      },
    );
  }
}
