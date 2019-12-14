import 'package:flutter/material.dart';
import 'package:slugflutter/database/controllers/localDBcontroller.dart';
import 'package:slugflutter/ui/themes/theme.dart';

class AddFind extends StatefulWidget  {
  @override
  AddFindState createState() => AddFindState();

}

class AddFindState extends State<AddFind> {

  final _number = GlobalKey<FormState>();
  final _formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.getTheme.backgroundColor,
      body: Builder(
        builder: (context) => AlertDialog(
          backgroundColor: CustomTheme.getTheme.dialogBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Fangst',
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
                  padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Text('Antall',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: CustomTheme.getTheme.textSelectionColor,
                      fontWeight: FontWeight.bold
                    ),
                    controller: _formController,
                    key: _number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () { 
                          if (!isNumeric(_formController.text)) {
                            return;
                          }
                          // TODO: Update Local DB.
                          
                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.pop(context);
                        },
                        child: Container( 
                          child: Image(
                            image: AssetImage('assets/buttons/check_button.png'),
                            width: 65.0,
                            height: 65.0,
                          ),
                        ),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.pop(context);
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
                    ],
                  ),
                ),
              ], 
            ),
          ),
        ),
      ),
    );
  }
}

bool isNumeric(String numberOfSnails) {
  String _numberOfSnails = numberOfSnails.trim();
  if(_numberOfSnails == null || _numberOfSnails.contains('.') || _numberOfSnails.contains('-') || _numberOfSnails.contains(',')) {
    return false;
  }
  return int.tryParse(_numberOfSnails) != null;
}