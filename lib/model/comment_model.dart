import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  List<CommentElement> comments;
  int total;
  int skip;
  int limit;

  Comment({
    required this.comments,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comments: List<CommentElement>.from(
            json["comments"].map((x) => CommentElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class CommentElement {
  int id;
  String body;
  int postId;
  User user;

  CommentElement({
    required this.id,
    required this.body,
    required this.postId,
    required this.user,
  });

  factory CommentElement.fromJson(Map<String, dynamic> json) => CommentElement(
        id: json["id"],
        body: json["body"],
        postId: json["postId"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "postId": postId,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String username;

  User({
    required this.id,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}
