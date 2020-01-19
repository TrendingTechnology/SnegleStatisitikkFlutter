import 'package:flutter/material.dart';
import 'package:SnegleStatistikkflutter/database/controllers/localDBcontroller.dart';
import 'package:SnegleStatistikkflutter/ui/themes/theme.dart';
import 'package:SnegleStatistikkflutter/utils/fylker_og_kommuner.dart' as KommunerOgFylker;

class UserInfoDialog  {

  static final ValueNotifier<String> _kommuneHint = ValueNotifier<String>('Velg Kommune');
  static List<String> _fylker = KommunerOgFylker.fylker;
  static List<String> _kommuner = []; // Gets initialized when fylke has been chosen
  static String _selectedFylke;
  static String _selectedKommune;
  static String _fylkeHint = 'Velg Fylke';

  static Future<bool> showUserInfoDialog(BuildContext context) {
    var location = LocalDBController.getUserLocation();
    return location.then((result) {
      var _userLocation = result;
      _fylkeHint = _userLocation[0]['fylke'] != null ? _userLocation[0]['fylke'] : 'Velg Fylke';
      _kommuneHint.value = _selectedFylke == null ? _userLocation[0]['kommune'] : 'Velg Kommune';
      return showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState)  {
              return AlertDialog(
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
                                child: Text(_fylkeHint)
                              ),
                              value: _selectedFylke,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedKommune = null;
                                  _kommuneHint.value = 'Velg Kommune';
                                  _selectedFylke = newValue;
                                  _kommuner = KommunerOgFylker.kommuner[_selectedFylke];
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
                                child: ValueListenableBuilder(
                                  builder: (context, value, child)  {
                                    String _hint = value == null ? 'Velg Kommune' : value;
                                    return Text(_hint);
                                  },
                                  valueListenable: _kommuneHint,
                                )
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
                                LocalDBController.updateUserLocation(_selectedFylke, _selectedKommune);
                                Navigator.of(context).pop(true);
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
                                var location = LocalDBController.getUserLocation();
                                location.then((_location)  {
                                  // Check if fylke or kommune has not been set.
                                  if (_location[0]['fylke'] == null || _location[0]['kommune'] == null) {
                                    return;
                                  }
                                  Navigator.of(context).pop(false);
                                });
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
            },
          );
        }
      );
    });
  }
}