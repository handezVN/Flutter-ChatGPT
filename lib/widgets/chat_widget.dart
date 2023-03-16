import 'package:chatgpt_mobile/constants/constants.dart';
import 'package:chatgpt_mobile/services/assets_manager.dart';
import 'package:chatgpt_mobile/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});
  final String msg;
  final int chatIndex;
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
                (Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(child: TextWidget(label: msg)),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          Icon(Icons.thumb_up_off_alt_outlined,
                              color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.thumb_down_off_alt_outlined,
                              color: Colors.white),
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
