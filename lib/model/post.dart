class Post {
  // FIELDS
  final int idPost;
  final int account;
  final int? idPostCommented;
  String content;
  String date;

  // CONSTRUCTOR
  Post({
    required this.idPost,
    required this.account,
    required this.idPostCommented,
    required this.content,
    required this.date
  });

  // PUBLIC METHODS
  Map<String, dynamic> toArray() {
    return {
      'id_post': this.idPost,
      'id_account': this.account,
      'id_post_commented': this.idPostCommented,
      'message': this.content,
      'send_date': this.date
    };
  }

  // STATIC METHODS
  static Post fromArray(Map<String, dynamic> array) {
    return Post(
      idPost: array['id_post'] as int,
      account: array['id_account'] as int,
      idPostCommented: array['id_post_commented'] as int?,
      content: array['message'] as String,
      date: array['send_date'] as String
    );
  }
}
