import 'package:flutter/material.dart';
import '../models/postModel.dart';

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
    Post(username: "gueez",content: "Salut mon reuf", date: "01/08/2022"),
    Post(username: "zefezf",content: "Zefez", date: "21/04/2023"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length, // Nombre de posts à afficher
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posts[index].username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(posts[index].content,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Text(
                      posts[index].date,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.comment),
                        onPressed: () {
                          // Action à effectuer lorsque l'utilisateur appuie sur le bouton de commentaire.
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // Action à effectuer lorsque l'utilisateur appuie sur le bouton de like.
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          // Action à effectuer lorsque l'utilisateur appuie sur le bouton de partage.
                        },
                      ),
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



