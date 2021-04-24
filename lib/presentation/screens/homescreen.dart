import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:whatsapp_clone/presentation/pages/sub/call_page.dart';
import 'package:whatsapp_clone/presentation/pages/sub/camera_page.dart';
import 'package:whatsapp_clone/presentation/pages/sub/chat_page.dart';
import 'package:whatsapp_clone/presentation/pages/sub/status_page.dart';
import 'package:whatsapp_clone/presentation/widgets/custom_tab_bar.dart';
import 'package:whatsapp_clone/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchBar searchBar;
  int _currentPageIndex = 1;

  List<Widget> _pages = [CameraPage(), ChatPage(), StatusPage(), CallsPage()];

  PageController _pageViewController = PageController(initialPage: 1);

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: new Text('WhatsApp Clone'),
        actions: [
          searchBar.getSearchAction(context),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.more_vert),
          SizedBox(
            width: 5,
          ),
        ]);
  }

  _HomeScreenState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _currentPageIndex != 0 ? searchBar.build(context) : null,
        body: Column(
          children: [
            searchBar.isSearching.value == false
                ? _currentPageIndex != 0
                    ? CustomTabBar(index: _currentPageIndex)
                    : Container(
                        height: 0,
                        width: 0,
                      )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            Expanded(
              child: PageView.builder(
                controller: _pageViewController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                    print(_currentPageIndex);
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (_, index) {
                  return _pages[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
