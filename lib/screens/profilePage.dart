import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/chatUsersModel.dart';
import '../models/postModel.dart';
import 'package:http/http.dart' as http;


class ProfilePage extends StatefulWidget {
  final int account;

  ProfilePage({required this.account});

  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  final List<ChatUsers> user = [];
  final List<Post> posts = [];

  Future<void> fetchAccount(List<ChatUsers> user) async {
    final responseUser = await http
        .get(Uri.parse('https://mindshare-ai.alwaysdata.net/api/account/${widget.account}'));

    if (responseUser.statusCode == 200) {
      final body = jsonDecode(responseUser.body);
      user.add(ChatUsers.fromJson(body as Map<String, dynamic>));

      // If the server did return a 200 OK response,
      setState(() {

      });

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<void> fetchPost(List<Post> posts, ChatUsers user) async {
    final responsePost = await http
        .get(Uri.parse('https://mindshare-ai.alwaysdata.net/api/post/${user.lastName}/${user.firstName}'));

    if (responsePost.statusCode == 200) {
      final body = jsonDecode(responsePost.body);

      for(var i = 0; i < body.length; i++) {
        posts.add(Post.fromJson(body[i] as Map<String, dynamic>));
      }

      // If the server did return a 200 OK response,
      setState(() {

      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAccount(user);
  }

  @override
  Widget build(BuildContext context) {
    if (user.isEmpty) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 30),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 15, 15, 30),
          toolbarHeight: 70,
          title: Image.asset('images/logoMindshare.png',
            height: 60,),
          centerTitle: true,
        ),
      );
    }

    if (posts.isEmpty) {
      fetchPost(posts, user[0]);
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 30),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 15, 15, 30),
          toolbarHeight: 70,
          title: Image.asset('images/logoMindshare.png',
            height: 60,),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/${user[0].lastName}${user[0].firstName}.jpg'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        user[0].lastName + " " + user[0].firstName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      ProfileInfoRow(account: user[0].id),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              // Nombre de posts à afficher
              children: [
                for (int i = 0; i < posts.length; i++)
                  Card(
                    color: Color.fromARGB(255, 15, 15, 34),
                    elevation: 20,
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),
                          Text(
                            posts[i].content,
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            posts[i].date,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ))
        //_ProfilePost(),
    );
  }
}

class ProfileInfoRow extends StatefulWidget {
  final int account;

  ProfileInfoRow({required this.account});

  @override
  _ProfileInfoRow createState() {
    return _ProfileInfoRow();
  }
}

class _ProfileInfoRow extends State<ProfileInfoRow> {
  final List<ProfileInfoItem> items = [];

  Future<void> fetchStats(List<ProfileInfoItem> items) async {
    final responsePost = await http
        .get(Uri.parse('https://mindshare-ai.alwaysdata.net/api/post/stats/${widget.account}'));

    if (responsePost.statusCode == 200) {
      final body = jsonDecode(responsePost.body) as Map<String, dynamic>;

      items.add(ProfileInfoItem("Posts", body["nb_posts"] as int));
      items.add(ProfileInfoItem("Commentaires", body["nb_comments"] as int));

      // If the server did return a 200 OK response,
      setState(() {

      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStats(items);
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        height: 80,
        constraints: const BoxConstraints(maxWidth: 400)
      );
    }

    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (items.indexOf(item) != 0)
                      const VerticalDivider(
                        color: Colors.white,
                      ),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;

  const ProfileInfoItem(this.title, this.value);
}
