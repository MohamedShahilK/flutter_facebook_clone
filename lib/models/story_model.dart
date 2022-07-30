import 'package:flutter_facebook_clone/models/user_model.dart';

class Story {
  final User user;
  final String storyImageUrl;
  final bool isViewed;

  const Story({
    required this.user,
    required this.storyImageUrl,
    this.isViewed = false,
  });
}