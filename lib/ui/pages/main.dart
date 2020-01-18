// To be retrived from DB
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:slugflutter/database/controllers/localDBcontroller.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:slugflutter/database/queries/queries.dart';
import 'package:slugflutter/ui/dialogs/stats.dart';
import 'package:slugflutter/ui/dialogs/user_info.dart';
import 'package:slugflutter/ui/themes/theme.dart';
import 'package:slugflutter/ui/dialogs/add_find.dart';
import 'app_info.dart';

class MainPage extends StatefulWidget {

  MainPage({Key key }) : super (key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>  {
  _MainPageState();

  @override
  Widget build(BuildContext context) {
    //TODO: Stop calling .getAllSimpleUserData every build. Only needed when User Location has changed.
    return FutureBuilder(
      future: LocalDBController.getAllSimpleUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var user = snapshot.data;
          User.fromMap(user);
          return _pageMainWidget();
        }
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: CustomTheme.getTheme.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.getTheme.textSelectionColor),
          )
        );
      },
    );
  }

  @override
  initState() { // ignore: must_call_super
    var userData = LocalDBController.getAllSimpleUserData();
    userData.then((user) async {
      if (user['fylke'] == null) {
        var _submitted = await UserInfoDialog.showUserInfoDialog(context);
        if (_submitted == true)  {

          setState(() {
            
          });
        }
      }
    });
  }

  Future<void> _refresh() async {
    setState(() {
      
    });
  }


  RefreshIndicator _pageMainWidget() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child:  ListView(
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
                padding: const EdgeInsets.only(top: 5.0, left: 30.0),
                child: Text('Mine funn',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5.0, right: 30),
                alignment: Alignment.centerRight,
                child: Text('${User.toMap()['totalFinds']}',
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
            padding: EdgeInsets.only(top: 10.0, left: 30, right: 30),
            child: Divider(
              color: CustomTheme.getTheme.textSelectionColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 5.0, left: 30.0),
                child: Text('Min kommune',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5.0, right: 30.0),
                child: _getKommuneFindings(User.toMap()['kommune']),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30, right: 30),
            child: Divider(
              color: CustomTheme.getTheme.textSelectionColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 5.0, left: 30.0),
                child: Text('Mitt fylke',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.getTheme.textSelectionColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5.0, right: 30.0),
                child: _getFylkeFindings(User.toMap()['fylke'])
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 45.0),
                child: Builder(
                  builder: (context) => RawMaterialButton(
                    onPressed: () => StatsDialog.showStatsDialog(context),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20.0,
                            spreadRadius: 5.0, 
                            offset: Offset(
                              10.0,
                              10.0,
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
                padding: EdgeInsets.only(top: 80, left: 90.0),
                child: Builder(
                  builder: (context) => RawMaterialButton(
                    onPressed: () async {
                      var _submitted = await AddFindDialog.showAddFindDialog(context);
                      if (_submitted == true)  {
                        setState(() {
                          
                        });
                      }
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
            padding: EdgeInsets.only(right: 20.0),
            child: Builder(
              builder: (context) => RawMaterialButton(
                onPressed: () async {
                  var _submitted = await UserInfoDialog.showUserInfoDialog(context);
                  if (_submitted == true)  {
                    setState(() {
                      
                    });
                  }
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
      ),
    );
    
  }

  _getKommuneFindings(String kommune) {
    return Query(
      options: QueryOptions(
        documentNode: Queries.getSlugfindingsByKommune(),
        variables: {
          'kommune': kommune
        }
      ),
      builder: (result, {refetch, fetchMore }) {
        
        if (result.data != null) {
          List res = result.data['getSlugfindingsByKommune'];
          if (res.isNotEmpty) {
            int findings = res.map((f) => f['count']).reduce((a,b )=>a+b);
            return Text('$findings',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: CustomTheme.getTheme.textSelectionColor,
              ),
            );
          }
        }
        if (result.loading) {
          return Text('Laster...',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomTheme.getTheme.textSelectionColor,
          ),
        );
        }
        return Text('0',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: CustomTheme.getTheme.textSelectionColor,
          ),
        );
      }
    );
  }

  _getFylkeFindings(String fylke) {
    return Query(
      options: QueryOptions(
        documentNode: Queries.getSlugfindingsByFylke(),
        variables: {
          'fylke': fylke
        }
      ),
      builder: (result, {refetch, fetchMore }) {
        if (result.data != null) {
          List res = result.data['getSlugfindingsByFylke'];
          
          if (res.isNotEmpty) {
            int findings = res.map((f) => f['count']).reduce((a,b )=>a+b);
            return Text('$findings',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: CustomTheme.getTheme.textSelectionColor,
              ),
            );
          }
        }
        if (result.loading) {
          return Text('Laster...',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomTheme.getTheme.textSelectionColor,
          ),
        );
        }
        return Text('0',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: CustomTheme.getTheme.textSelectionColor,
          ),
        );
      }
    );
  }
}