import 'package:flutter/material.dart';
import 'package:mindshare_ai/models/chatUsersModel.dart';
import 'package:mindshare_ai/widgets/conversationList.dart';
import '../widgets/customSearchDelegate.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "images/pdp1.jpg",
        time: "Now"),
    ChatUsers(name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "images/pdp2.jpg",
        time: "Yesterday"),
    ChatUsers(name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "images/pdp3.jpg",
        time: "31 Mar"),
    ChatUsers(name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "images/pdp4.jpg",
        time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "images/pdp5.jpg",
        time: "23 Mar"),
    ChatUsers(name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "images/pdp6.jpg",
        time: "17 Mar"),
    ChatUsers(name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "images/pdp7.jpg",
        time: "24 Feb"),
    ChatUsers(name: "John Wick",
        messageText: "How are you?",
        imageURL: "images/pdp8.jpg",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations", style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: AppBar(
                  title: const Text(
                    "search",
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        // method to show the search bar
                        showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      icon: const Icon(Icons.search),
                    )
                  ],
                ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}

