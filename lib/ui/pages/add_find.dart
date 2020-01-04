import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:slugflutter/database/controllers/APIcontroller.dart';
import 'package:slugflutter/database/controllers/localDBcontroller.dart';
import 'package:slugflutter/database/mutations/mutations.dart';
import 'package:slugflutter/ui/themes/theme.dart';

class AddFindDialog  {

  static final _number = GlobalKey<FormState>();
  static final _formController = TextEditingController();
  static var _kommune = '';
  static var _fylke = '';

  static Future<bool> showAddFindDialog(BuildContext context) async {

    // Getting the User location from SQLite
    LocalDBController.getUserLocation()
    .then((value) => {
      _kommune = value[0]['kommune'],
      _fylke = value[0]['fylke']
    })
    .catchError((err) => print(err));

    return showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return AlertDialog(
        backgroundColor: CustomTheme.getTheme.dialogBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
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
                  decoration: InputDecoration(
                    hintText: 'Antall segler funnet', 
                    border: InputBorder.none
                  ),
                  autofocus: true,
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
                    Mutation(
                      builder: (
                        RunMutation runMutation, 
                        QueryResult result) 
                        {
                        
                        return RawMaterialButton(
                          onPressed: () async {
                            if (!isNumeric(_formController.text)) {
                              return;
                            }

                            runMutation(
                              APIController.addFinding(
                                _kommune, 
                                _fylke, 
                                int.parse(_formController.text)
                              )
                            );

                          },
                          child: Container( 
                            child: Image(
                              image: AssetImage('assets/buttons/check_button.png'),
                              width: 65.0,
                              height: 65.0,
                            ),
                          ),
                          shape: CircleBorder(),
                        );
                      },
                      options: MutationOptions(
                        documentNode: Mutations.addFindingsMutation(),
                        onCompleted: (result) => {
                          // If the result from the mutation != null, add to local DB.
                          if (result != null) {
                            LocalDBController.addFinding(int.parse(_formController.text))
                            .then((newTotalFinding) {
                              _formController.text = '';
                              Navigator.of(context).pop(true);
                            })
                          }
                        }, 
                        onError: (_) => null, // TODO: If error, popup to user that an error has occured and what error it is.
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        _formController.text = '';
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
                  ],
                ),
              ),
            ], 
          ),
        ),
      );
    });
  }
}

bool isNumeric(String numberOfSnails) {
  String _numberOfSnails = numberOfSnails.trim();
  if(_numberOfSnails == null || _numberOfSnails.contains('.') || _numberOfSnails.contains('-') || _numberOfSnails.contains(',')) {
    return false;
  }
  return int.tryParse(_numberOfSnails) != null;
}