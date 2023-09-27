import 'package:flutter/material.dart';
import 'package:mindshare_ai/screens/chatPage.dart';
import 'package:mindshare_ai/screens/postPage.dart';
import 'package:mindshare_ai/screens/profilePage.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ChatPage();
        break;
      case 1:
        page = ProfilePage();
        break;
      case 2:
        page = PostPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
              child: NavigationRail(
                extended: false,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.message),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.account_box),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.assignment_outlined),
                    label: Text(''),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {

                  // ↓ Replace print with this.
                  setState(() {
                    selectedIndex = value;
                  });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}