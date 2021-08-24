import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarItem extends StatelessWidget {
  final String txt;
  final Function onSelected;
  final bool isSelected;
  const BarItem({Key key, this.txt, this.onSelected, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width:isSelected? 4:0,color: isSelected?Colors.white:Colors.transparent)),
          color: isSelected?Colors.white10:Colors.transparent
        ),
        child: Center(
         child: Text(txt,style: GoogleFonts.lato(fontSize: 20,fontWeight: isSelected?FontWeight.bold:FontWeight.normal,color: isSelected?Colors.white:Colors.grey),)
        ),
      ),
    );
  }
}
