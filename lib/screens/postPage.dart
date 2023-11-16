import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/postModel.dart';
import 'commentaryPostPage.dart';
import 'package:http/http.dart' as http;

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
  List<Post> posts = [];

  Future<void> fetchPost(List<Post> posts) async {
    final response = await http
        .get(Uri.parse('https://mindshare-ai.alwaysdata.net/api/post'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      for(var i = 0; i < body.length; i++) {
        posts.add(Post.fromJson(body[i] as Map<String, dynamic>));
      }

      // If the server did return a 200 OK response,
      setState(() {

      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPost(posts);

  }

  @override
  Widget build(BuildContext context) {
    if (posts.length > 0) {
      return Scaffold(
          backgroundColor: Color.fromARGB(255, 15, 15, 30),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 15, 15, 30),
            toolbarHeight: 70,
            title: Image.asset('images/logoMindshare.png',
              height: 60,),
            centerTitle: true,
          ),
          body:
          ListView.builder(
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
                          Text(
                          "Réponses", //Nombre de commentaires aux posts
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
          )
      );
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
    );
  }
}
