import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/color/colors.dart';
import 'package:flutter_facebook_clone/widgets/widgets.dart';

import '../models/models.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return StoryCard(
                userImageUrl: currentUser.userImageUrl,
                isAddStory: true,
              );
            }

            final eachStories = stories[index - 1];
            return StoryCard(eachStories: eachStories);
          },
        ));
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    this.eachStories,
    this.isAddStory = false,
    this.userImageUrl,
  }) : super(key: key);

  final Story? eachStories;
  final String? userImageUrl;
  final bool isAddStory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl:
                  !isAddStory ? eachStories!.storyImageUrl : userImageUrl!,
              width: 110,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 7,
            left: 5,
            child: isAddStory
                ? CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero, // important
                      icon: const Icon(
                        Icons.add,
                        size: 28,
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 22,
                    backgroundColor: ColorPalette.facebookBlue,
                    child: ProfileAvatar(
                      userImageUrl: eachStories!.user.userImageUrl ?? '',
                    ),
                  ),
          ),

          //Text Start
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              isAddStory ? 'Add to Story' : eachStories!.user.name ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //For Foreground
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              isAddStory ? 'Add to Story' : eachStories!.user.name ?? '',
              style: TextStyle(
                foreground: Paint()
                  ..color = Colors.grey
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = .4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          //Text End
        ],
      ),
    );
  }
}
