import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../color/colors.dart';
import '../models/models.dart';
import 'widgets.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.eachPost,
  }) : super(key: key);

  final Post eachPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      // padding: const EdgeInsets.fromLTRB(10, 12, 10, 6),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topSection(),
          const SizedBox(height: 8),

          //Description / Caption of post
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            child: Text(eachPost.caption),
          ),

          //Image
          eachPost.postImageUrl != null
              ? CachedNetworkImage(
                  imageUrl: eachPost.postImageUrl ?? '',
                )
              : const SizedBox.shrink(),

          //Bottom Section
          _bottomSection()
        ],
      ),
    );
  }

  Padding _bottomSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: [
          // 1st Row
          Row(
            children: [
              //Likes
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: ColorPalette.facebookBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.thumb_up,
                        size: 11,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      eachPost.likes.toString(),
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              //Comments and Shares
              Text(
                '${eachPost.comments} Comments',
                style: TextStyle(
                    color: Colors.grey[600], fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 8),
              Text(
                '${eachPost.shares} Shares',
                style: TextStyle(
                    color: Colors.grey[600], fontWeight: FontWeight.w400),
              ),
            ],
          ),

          const Divider(),

          // 2nd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Like Button
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.thumbUpOutline,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  label: Text(
                    'Like',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),

              //Comment Button
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.commentOutline,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  label: Text(
                    'Comment',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),

              //Share Button
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.shareOutline,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  label: Text(
                    'Share',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding _topSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 6),
      child: Row(
        children: [
          //Avatar
          ProfileAvatar(
            userImageUrl: eachPost.user.userImageUrl ?? '',
          ),

          //Space
          const SizedBox(width: 8),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //User Name
              Text(
                eachPost.user.name ?? 'No title',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              Row(
                children: [
                  //Time Ago
                  Text(
                    '${eachPost.timeAgo} •',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  //earth icon
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 10,
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          Icon(
            Icons.more_horiz,
            color: Colors.grey[600],
            size: 18,
          )
        ],
      ),
    );
  }
}
