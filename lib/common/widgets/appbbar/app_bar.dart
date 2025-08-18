import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 50, height: 50,
          decoration: BoxDecoration(
              color:context.isDarkMode? Colors.white.withAlpha(8):Colors.black.withAlpha(10),
              shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back_ios_new
              ,size: 15,)),
      )
    );
  }
}
