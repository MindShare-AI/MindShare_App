import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mindshare_ai/model/post.dart';


class PostAccess {
  // STATIC METHODS
  static Future<List<Post>> getAllPosts() async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/post'));

    // request successfully
    if (response.statusCode == 200) {
      List<Post> posts = [];

      for (Map<String, dynamic> currentPostArray in jsonDecode(response.body)) {
        final Post currentPost = Post.fromArray(currentPostArray);

        // check if it's a post or a comment
        if (currentPost.idPostCommented == null) {
          posts.add(currentPost);
        }
      }

      return posts;

    // request failed
    } else {
      throw Exception("API request failed to get all posts");
    }
  }

  static Future<Post> getPost(int idPost) async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/post/$idPost'));

    // request successfully
    if (response.statusCode == 200) {
      return Post.fromArray(jsonDecode(response.body));

      // request failed
    } else {
      throw Exception("API request failed to get specific post with this id :"
          "$idPost");
    }
  }

  static Future<List<Post>> getCommentsOfPost(int idPost) async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/post/comments/$idPost'));

    // request successfully
    if (response.statusCode == 200) {
      List<Post> comments = [];

      for (Map<String, dynamic> currentCommentArray in jsonDecode(response.body)) {
        comments.add(Post.fromArray(currentCommentArray));
      }

      return comments;

      // request failed
    } else {
      throw Exception("API request failed to get comments of this post : $idPost");
    }
  }

  static Future<Post> getPostsOfAccount(String lastName, String firstName) async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/'
            'post/$lastName/$firstName'));

    // request successfully
    if (response.statusCode == 200) {
      return Post.fromArray(jsonDecode(response.body));

      // request failed
    } else {
      throw Exception("API request failed to get posts of this account :"
          "$lastName $firstName");
    }
  }

  static Future<Map<String, int>> getStatsOfAccount(int idAccount) async {
    // http request
    final response = await http.get(
        Uri.parse('https://mindshare-ai.alwaysdata.net/api/post/'
            'stats/$idAccount'));

    // request successfully
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

      // request failed
    } else {
      throw Exception("API request failed to get stats of this account : $idAccount");
    }
  }
}
