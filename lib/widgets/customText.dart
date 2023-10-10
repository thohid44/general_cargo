import 'package:flutter/material.dart';

class customText extends StatelessWidget {
  String title;
  Color color;
  dynamic size;
  var margin=0.0;
  FontWeight fontWeight;
  customText(this.title, this.color, this.size, this.fontWeight, this.margin);

  @override
  Widget build(BuildContext context) {
    return Container(
    
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: Text(
          title,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: fontWeight,
            
          ),
          textAlign: TextAlign.center,
        ));
  }
}

