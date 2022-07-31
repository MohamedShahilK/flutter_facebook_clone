import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_facebook_clone/color/colors.dart';
import 'package:flutter_facebook_clone/data/story_data.dart';
import 'package:flutter_facebook_clone/data/user_data.dart';
import 'package:flutter_facebook_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //AppBar
          SliverAppBar(
            // brightness: Brightness.light,
            // systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.white,
            // centerTitle: true,
            floating: true,
            actions: [
              CircularButton(
                  icon: Icons.search, iconSize: 28, onPressed: () {}),
              CircularButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 28,
                onPressed: () {},
              ),
            ],
            title: const Text(
              'facebook',
              style: TextStyle(
                color: ColorPalette.facebookBlue,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.2,
              ),
            ),
          ),
//----------------------------------------------------------------------------------------------------

          //CreatePostContainer
          const SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),

//----------------------------------------------------------------------------------------------------

          //RoomsContainer
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: RoomsContainer(onlineUsersList: onlineUsers),
            ),
          ),

//----------------------------------------------------------------------------------------------------

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            child: StoriesSection(currentUser: currentUser , stories:stories),
          ),
        )

        ],
      ),
    );
  }
}
