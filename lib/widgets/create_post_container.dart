import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              //image
              ProfileAvatar(userImageUrl: currentUser.userImageUrl ?? ''),
              const SizedBox(width: 8),

              //TextField
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What/'s on your mind?",
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10, thickness: .5),

          //You can also wrap Row into sizedbox with specified height to show 'VerticalDivider'.

          //This class is useful, for example, when unlimited height is available and you would like
          //a child that would otherwise attempt to expand infinitely to instead size itself
          //to a more reasonable height.
          // Avoid using 'IntrinsicHeight/IntrinsicWidth' where possible. In the worst case, this widget can result in a layout that is O(N²) in the depth of the tree.
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Live Button
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    MdiIcons.video,
                    color: Colors.red,
                  ),
                  label: const Text('Live'),
                ),
                const VerticalDivider(width: 12, thickness: .5),

                //Photo Button
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text('Photo'),
                ),
                const VerticalDivider(width: 12, thickness: .5),

                //Room Button
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text('Room'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
