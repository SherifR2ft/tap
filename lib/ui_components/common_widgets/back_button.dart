import 'package:flutter/material.dart';

class BackButtonCustomize extends StatelessWidget {
  const BackButtonCustomize({
    Key? key,
    this.backButtonFunc,
  }) : super(key: key);
  final Function()? backButtonFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: backButtonFunc ??
          () {
            Navigator.maybePop(context);
          },
      child: const Icon(Icons.arrow_back_ios_sharp, size: 25),
    );
  }
}
