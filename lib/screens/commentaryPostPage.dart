import 'package:flutter/material.dart';
import '../models/postModel.dart';

class CommentaryPost extends StatefulWidget {
  int account;

  CommentaryPost({required this.account});

  @override
  _CommentaryPost createState() {
    return _CommentaryPost();
  }
}

class _CommentaryPost extends State<CommentaryPost> {
  List<Post> posts = [
    Post(
        id_post: 1,
        account: 1,
        content: "C'est Incroyable ce qu'il se passe aujourd'hui !!",
        date: "01/08/2022",
        post_commented: 1),
    Post(
        id_post: 2,
        account: 2,
        content: "J'aime trop les bonbons ;)",
        date: "21/04/2023",
        post_commented: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 15, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 15, 34),
        toolbarHeight: 40,
        title: Text("Réponses (2)"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length, // Nombre de posts à afficher
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 15, 15, 34),
            elevation: 4,
            margin: EdgeInsets.all(4),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1526372362028-3a8667a8f35e?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                              maxRadius: 30,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Jenna Style",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade400),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Text(
                    posts[index].content,
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    posts[index].date,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
