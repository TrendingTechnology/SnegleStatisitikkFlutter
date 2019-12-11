import 'package:flutter/material.dart';
import 'package:slugflutter/ui/themes/theme.dart';

class UserInfo extends StatelessWidget {
  UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.getTheme.backgroundColor,
      body: Center(
        child:  Text("User Info")
      )
    );
  }

}