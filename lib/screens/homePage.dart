import 'package:flutter/material.dart';
//import 'package:mindshare_ai/screens/chatPage.dart';
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
      /* Update case 0:
        page = ChatPage();
        break;*/
      case 0:
        page = PostPage();
        break;
      case 1:
        page = ProfilePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body:
        Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: page,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 15, 15, 30),
                items: const [
                  /*BottomNavigationBarItem(
                  icon: Icon(Icons.message, color: Colors.white,),
                  label: '',
                  ),*/
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_outlined, color: Colors.white,),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.account_box, color: Colors.white,),
                  label: '',
                  ),
                ],
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  }, currentIndex: selectedIndex)
          );
  }
}