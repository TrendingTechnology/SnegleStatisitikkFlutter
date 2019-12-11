
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CancelButton extends StatefulWidget {
  
  @override
  _CancelButtonState createState() => _CancelButtonState();
}

class _CancelButtonState extends State<CancelButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.0,
        width: 100.0,
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
        child: FittedBox(
          child: FloatingActionButton(
            child: Image.asset("assets/buttons/cancel_button.png"),
            onPressed: () => Navigator.pop(context)
          ),
        ),
      );
    }
}