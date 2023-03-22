import 'package:flutter/material.dart';
import 'package:lts_app/screens/AlertScreen.dart';
import 'package:lts_app/tab_location_screen.dart';

class HomeContainerWidget extends StatefulWidget {
  const HomeContainerWidget({Key? key}) : super(key: key);

  @override
  State<HomeContainerWidget> createState() => _HomeContainerWidgetState();
}

class _HomeContainerWidgetState extends State<HomeContainerWidget> {
  int tabIndex = 0;

  Widget _getBodyWidget(int index) {
    if (index == 0) {
      return const TabLocationScreen();
    } else if (index == 1) {
      // return QAContent();
      return const AlertScreen();
    } else if (index == 2) {
      return someThing();
    } else {
      return someThing();
    }
  }

  Widget someThing() {
    return const Center(
      child: Text('example'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getBodyWidget(tabIndex),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color.fromRGBO(106, 0, 191, 1),
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(
            () => tabIndex = index,
          ),
          currentIndex: tabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer), label: 'Messenger'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shield_sharp), label: 'Alert'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Visibility(
          visible: tabIndex == 0,
          child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(106, 0, 191, 1),
            child: const Icon(Icons.add),
            onPressed: () => setState(() {}),
          ),
        ));
  }
}
