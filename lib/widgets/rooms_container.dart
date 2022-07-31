import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:flutter_facebook_clone/widgets/widgets.dart';

class RoomsContainer extends StatelessWidget {
  const RoomsContainer({
    Key? key,
    required this.onlineUsersList,
  }) : super(key: key);

  final List<User> onlineUsersList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      height: 63,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1 +
            onlineUsersList
                .length, // add 1, because we add extra 'Create Room' button
        itemBuilder: (context, index) {
          if (index == 0) {
            return const CustomCreateRoomButton();
          }

          //Online profiles
          final User user = onlineUsersList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ProfileAvatar(
              userImageUrl: user.userImageUrl ?? '',
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}
