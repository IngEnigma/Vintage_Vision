import 'package:flutter/material.dart';

class MainLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset('lib/assets/images/main_logo.png', fit: BoxFit.cover),
    );
  }
}
