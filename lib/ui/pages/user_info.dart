import 'package:flutter/material.dart';
import 'package:slugflutter/database/controllers/localDBcontroller.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:slugflutter/ui/pages/main.dart';
import 'package:slugflutter/ui/themes/theme.dart';
import 'package:slugflutter/utils/kommuner.dart';

class UserInfo extends StatefulWidget  {
  @override
  _UserInfoState createState() => _UserInfoState();

}

class _UserInfoState extends State<UserInfo> {

  List<String> _fylker = [
    'Agder',
    'Innlandet',
    'Møre og Romsdal',
    'Nordland',
    'Oslo',
    'Rogaland',
    'Telemark og Vestfold',
    'Troms og Finnmark',
    'Trøndelag',
    'Vestland',
    'Viken',
    ]; 
  List<String> _kommuner = []; // Get set when fylke has been choosen
  String _selectedFylke;
  String _selectedKommune;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.getTheme.backgroundColor,
      body: Builder(
        builder: (context) => AlertDialog(
          backgroundColor: CustomTheme.getTheme.dialogBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Bruker info',
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
                  child: Text('Velg Fylke',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Center(
                          child: Text('Velg Fylke')
                        ),
                        value: _selectedFylke,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedKommune = null;
                            _selectedFylke = newValue;
                            _kommuner = kommuner[_selectedFylke];
                          });
                        },
                        items: _fylker.map((fylke) {
                          return DropdownMenuItem(
                            child: Center(
                              child: Text(fylke)
                            ),
                            value: fylke,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text('Velg Kommune',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Center(
                          child: Text('Velg Kommune'),
                        ),
                        value: _selectedKommune,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedKommune = newValue;
                          });
                        },
                        items: _kommuner.map((kommune) {
                          return DropdownMenuItem(
                            child: Center(
                              child: Text(kommune)
                            ),
                            value: kommune,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () { 
                          if (_selectedKommune == null || _selectedFylke == null) {
                            return;
                          }

                          LocalDBController.updateUser(_selectedFylke, _selectedKommune);
                          
                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(
		                        builder: (context) => MainPage())
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
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          if (User.getKommune == null || User.getFylke == null) {
                            return;
                          }

                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(
		                        builder: (context) => MainPage())
	                        );
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