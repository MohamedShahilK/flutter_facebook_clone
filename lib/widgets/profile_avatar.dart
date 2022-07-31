import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/color/colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.userImageUrl,
    this.isActive = false,
  }) : super(key: key);

  final String userImageUrl;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(userImageUrl),
        ),

        //Green active indicator
        isActive
            ? Positioned(
                bottom: 0,
                right: 5,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color: ColorPalette.online,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
