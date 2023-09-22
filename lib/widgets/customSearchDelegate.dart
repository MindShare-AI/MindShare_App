import 'package:flutter/material.dart';
import '../models/chatUsersModel.dart';
import 'conversationList.dart';

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
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

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var user in chatUsers) {
      if (user.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user.name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var user in chatUsers) {
      if (user.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user.name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ConversationList(
          name: matchQuery[index],
          messageText: chatUsers[index].messageText,
          imageUrl: chatUsers[index].imageURL,
          time: chatUsers[index].time,
          isMessageRead: (index == 0 || index == 3) ? true : false,
        );
      },
    );
  }
}