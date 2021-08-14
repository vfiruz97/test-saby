import 'package:flutter/material.dart';
import 'package:test/presentation/second_page/second_page.dart';
import 'package:test/presentation/widgets/dot_button_widget.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  void _jumpToPage(int pageIndex) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            currentPageIndex = page;
          });
        },
        controller: _pageController,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () => _jumpToPage(1),
              child: const Text('Next'),
            ),
          ),
          const SecondPage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DotButtonWidget(
              showActiveColor: currentPageIndex == 0,
              onTap: () => _jumpToPage(0),
            ),
            const SizedBox(width: 10),
            DotButtonWidget(
              showActiveColor: currentPageIndex == 1,
              onTap: () => _jumpToPage(1),
            ),
          ],
        ),
      ),
    );
  }
}
