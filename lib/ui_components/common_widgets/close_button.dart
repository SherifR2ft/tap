import 'package:flutter/material.dart';

class CloseButtonCustom extends StatelessWidget {
  const CloseButtonCustom({
    Key? key,
    this.loginScreen = false,
    this.height = 35,
    this.width = 35,
    this.onTap,
  }) : super(key: key);
  final double height;
  final bool loginScreen;
  final double width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.close,
        size: width - 10,
      ),
    );
  }
}
