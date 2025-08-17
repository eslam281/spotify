import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  const BasicAppButton({
    super.key, required this.title, required this.onPressed, this.height
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height??80),
      ),
      child: Text(title,style:const TextStyle(color: Colors.white),),);
  }
}
