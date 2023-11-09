import 'package:flutter/material.dart';
import '../models/postModel.dart';
import 'commentaryPostPage.dart';

void main() => runApp(PostPageApp());

class PostPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostPage(),
    );
  }
}

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  List<Post> posts = [
    Post(id_post: 1, account: 1,content: "C'est Incroyable ce qu'il se passe aujourd'hui !!", date: "01/08/2022", post_commented: 0),
    Post(id_post: 2, account: 2,content: "J'aime trop les bonbons ;)", date: "21/04/2023", post_commented: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 15, 30),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: Image.asset('images/logoMindshare.png',
          height: 60,),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length, // Nombre de posts à afficher
        itemBuilder: (context, index) {
          return Card(
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
                              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1511623785848-021573a3a04f?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                              maxRadius: 30,
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("John Wick", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                                    SizedBox(height: 6,),
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
                  Text(posts[index].content,
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      posts[index].date,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.6)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      const Text(
                        "2 Réponses", //Nombre de commentaires aux posts
                        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                      IconButton(
                        icon: Icon(Icons.comment, color: Colors.white70,),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return CommentaryPost(account: 1);
                          }));
                        },
                      )

                      /*IconButton(
                        icon: Icon(Icons.share, color: Colors.white70,),
                        onPressed: () {
                          // Action à effectuer lorsque l'utilisateur appuie sur le bouton de partage.
                        },
                      ),*/
                    ],
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





