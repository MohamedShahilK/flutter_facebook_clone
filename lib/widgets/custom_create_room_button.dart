import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/color/colors.dart';

class CustomCreateRoomButton extends StatelessWidget {
  const CustomCreateRoomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 106,
        child: OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Color.fromARGB(255, 161, 209, 248),
                width: 3,
                style: BorderStyle.solid,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          // child: const SizedBox(), // mandatory otherwise throw an error
          child: Row(
            children: [
              //Shaded video call Icon
              ShaderMask(
                shaderCallback: (bounds) {
                  // return LinearGradient(colors: [Colors.red,Colors.black]).createShader(bounds);
                  return ColorPalette.createRoomGradient.createShader(bounds);
                },
                child: const Icon(
                  Icons.video_call,
                  size: 33,
                  color: Colors
                      .white, //this is given to display current gradient that we given
                ),
              ),

              //Horizon Space
              const SizedBox(width: 6),

              //Text
              const Text('Create\nRoom')
            ],
          ),
        ),
      ),
    );
  }
}
