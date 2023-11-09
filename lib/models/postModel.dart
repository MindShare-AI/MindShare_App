class Post{
  final int id_post;
  final int account;
  final String content;
  final String date;
  final int post_commented;

  Post({
    required this.id_post,
    required this.account,
    required this.content,
    required this.date,
    required this.post_commented,
  });
}