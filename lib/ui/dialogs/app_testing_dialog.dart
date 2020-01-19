import 'package:flutter/material.dart';
import 'package:SnegleStatistikkflutter/ui/themes/theme.dart';

class TestingDialog {
  static Future<bool> showTestDialog(BuildContext context)  {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: CustomTheme.getTheme.dialogBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
        title: Text('App under testing',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0
            ),
            textAlign: TextAlign.center,
          ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Divider(
                color: Colors.white,
              ),
              Text('App under testing,\nalle funn vil bli\nresatt 1. mars 2020!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                  ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Container( 
                    child: Image(
                      image: AssetImage('assets/buttons/white_cancel_button.png'),
                      width: 65.0,
                      height: 65.0,
                    ),
                  ),
                  shape: CircleBorder(),
                ),
              )
            ], 
          ),
        ),
      )
    );
  }
}