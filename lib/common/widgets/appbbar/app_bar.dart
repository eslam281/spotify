import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? actions;
  final bool? showArow;
  final Color? backgroundColor;
  const BasicAppBar({super.key, this.title, this.showArow =true, this.actions,  this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:backgroundColor?? Colors.transparent,
      elevation: 0,
      title: title,centerTitle: true,
      actions: [
         actions ?? const SizedBox(),
      ] ,
      leading: showArow! ? IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
                color: context.isDarkMode? Colors.white.withAlpha(8):Colors.black.withAlpha(10),
                shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back_ios_new
              ,size: 15,)),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
