import 'package:flutter/material.dart';
import 'package:slugflutter/main.dart';
import 'package:slugflutter/ui/pages/stats/mystats.dart';
import 'package:slugflutter/ui/themes/theme.dart';


class StatsDialog  {

  static Future<bool> showStatsDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return AlertDialog(
        backgroundColor: CustomTheme.getTheme.dialogBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
        title: Text('Statistikk',
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
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(45),
                    side: BorderSide(color: Colors.white)
                  ),
                  color: Colors.white,
                  child: Text(
                    'Min statistikk',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: CustomTheme.getTheme.dialogBackgroundColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MyStats()
                      ),
                    );
                  },
                ),
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
      );
    });
  }
}