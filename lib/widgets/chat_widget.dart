import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:project/constants/constants.dart';
import 'package:project/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: msg,
                        )
                      : shouldAnimate
                          ? DefaultTextStyle(
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              child: AnimatedTextKit(
                                isRepeatingAnimation: false,
                                repeatForever: false,
                                displayFullTextOnTap: true,
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TyperAnimatedText(
                                    msg.trim(),
                                  ),
                                ],
                              ),
                            )
                          : SelectableText(
                              msg.trim(),
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Color.fromARGB(255, 53, 138, 56),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.green,
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
