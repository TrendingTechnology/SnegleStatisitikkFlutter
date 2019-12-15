// To be retrived from DB
import 'package:flutter/material.dart';
import 'package:slugflutter/database/controllers/localDBcontroller.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:slugflutter/ui/pages/stats.dart';
import 'package:slugflutter/ui/pages/user_info.dart';
import 'package:slugflutter/ui/themes/theme.dart';

import 'add_find.dart';
import 'app_info.dart';

class MainPage extends StatefulWidget {
  MainPage({ Key key }) : super (key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>  {

  int totalFinds = User.getTotalFinds;
  int fylke = 0;
  int kommune = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slug stat app',
      home: Scaffold(
        backgroundColor: CustomTheme.getTheme.backgroundColor,
        body: Center(
          child: FutureBuilder(
            future: LocalDBController.checkUserData(),
            builder: (context, snapshot) {
              return _pageMainWidget();
            },
          )
        )
      )
    );
  }

  ListView _pageMainWidget() {
    return ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Builder(
                  builder: (context) => RawMaterialButton(
                    onPressed: () =>
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => AppInfo()
                        ),
                      ),
                      child: Image(
                        image: AssetImage('assets/images/dying_slug.png'),
                        width: 257.0,
                        height: 252.0,
                      ),
                    shape: CircleBorder(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, left: 50.0),
                    child: Text('Mine funn',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.getTheme.textSelectionColor
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, right: 50),
                    alignment: Alignment.centerRight,
                    child: Text('$totalFinds',
                      textAlign: TextAlign.start,
                      style: TextStyle(                        
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.getTheme.textSelectionColor
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                child: Divider(
                  color: CustomTheme.getTheme.textSelectionColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, left: 50.0),
                    child: Text('Min kommune',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.getTheme.textSelectionColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, right: 50.0),
                    child: Text('$kommune',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.getTheme.textSelectionColor,
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                child: Divider(
                  color: CustomTheme.getTheme.textSelectionColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, left: 50.0),
                    child: Text('Mitt fylke',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.getTheme.textSelectionColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, right: 50.0),
                    child: Text('$fylke',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.getTheme.textSelectionColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Builder(
                      builder: (context) => RawMaterialButton(
                        onPressed: () =>
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => Stats()),
                          ),   
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 20.0, // has the effect of softening the shadow
                                spreadRadius: 5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  10.0, // horizontal, move right 10
                                  10.0, // vertical, move down 10
                                ),
                              ),
                            ],
                            shape: BoxShape.circle
                          ),
                          child: Image(
                            image: AssetImage('assets/buttons/stats_button.png'),
                            width: 120.0,
                            height: 120.0,
                          ),
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100, left: 50.0),
                    child: Builder(
                      builder: (context) => RawMaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => AddFind()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 20.0, // has the effect of softening the shadow
                                spreadRadius: 5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  10.0, // horizontal, move right 10
                                  10.0, // vertical, move down 10
                                ),
                              ),
                            ],
                            shape: BoxShape.circle
                          ),   
                          child: Image(
                            image: AssetImage('assets/buttons/add_button.png'),
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Builder(
                  builder: (context) => RawMaterialButton(
                    onPressed: () =>
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => UserInfo()),
                      ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20.0, // has the effect of softening the shadow
                            spreadRadius: 5.0, // has the effect of extending the shadow
                            offset: Offset(
                              10.0, // horizontal, move right 10
                              10.0, // vertical, move down 10
                            ),
                          ),
                        ],
                        shape: BoxShape.circle
                      ),  
                      child: Image(
                        image: AssetImage('assets/buttons/user_button.png'),
                        width: 80.0,
                        height: 80.0,
                      ),
                    ),
                    shape: CircleBorder(),
                  ),
                ),
              ),
            ],
          );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}