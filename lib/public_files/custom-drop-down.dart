import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatelessWidget {
  final value;
  final List<String> itemsList;
  final Color dropdownColor, backColor,itemColor;
  final Function(dynamic value) onChanged;
  final String hint;
  const CustomDropDown({
    @required this.value,
    @required this.itemsList,
    this.dropdownColor,
    this.backColor=Colors.white,
    @required this.hint,
    @required this.onChanged,
    this.itemColor=Colors.black54,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              hint: Text(
                hint,
                style: TextStyle(color: itemColor),
              ),
              dropdownColor: dropdownColor,
              value: value,
              items: itemsList
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: itemColor),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => onChanged(value),
            ),
          );
  }
}
