import 'package:flutter/material.dart';

import '../models/chatUsersModel.dart';
import '../models/postModel.dart';
import 'commentaryPostPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ChatUsers user = ChatUsers(
    name: "Debra Hawkins",
    imageURL:
        'https://images.unsplash.com/photo-1575739967915-f06fdc268a5b?auto=format&fit=crop&q=80&w=1982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  );

  final List<Post> posts = [
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
    Post(
        id_post: 1,
        account: 1,
        content: "C'est Incroyable ce qu'il se passe aujourd'hui !!",
        date: "01/08/2022",
        post_commented: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 30),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 100),
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
                                image: NetworkImage(user.imageURL)),
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
                        user.name,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'message',
                        elevation: 0,
                        backgroundColor: Colors.grey.shade500,
                        label: const Text("Message"),
                        icon: const Icon(Icons.message_rounded),
                      ),
                      const SizedBox(height: 16),
                      const _ProfileInfoRow(),
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
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1575739967915-f06fdc268a5b?auto=format&fit=crop&q=80&w=1982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                      maxRadius: 30,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Debra Hawkins",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "2 Réponses",
                                //Nombre de commentaires aux posts
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.comment,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CommentaryPost(account: 1);
                                  }));
                                },
                              )
                            ],
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

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Posts", 900), // Compter le nombres de posts
    ProfileInfoItem("Réponses", 120), // Compter le nombres de réponses
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0)
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
