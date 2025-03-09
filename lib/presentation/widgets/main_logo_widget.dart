import 'package:flutter/material.dart';

class MainLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Image.asset('lib/assets/images/main_logo.png', fit: BoxFit.cover),
    );
  }
}
