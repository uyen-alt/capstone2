import 'package:lts_app/models/user_model.dart';

class Post {
  User? user;
  String? caption;
  String? timeAgo;
  String? imageUrl;
  int? likes;
  int? comments;
  int? shares;

  Post({
    this.user,
    this.caption,
    this.timeAgo,
    this.imageUrl,
    this.likes,
    this.comments,
    this.shares,
  });
}
