import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Constant_Data.dart';
import 'application_colors.dart';

class SearchField extends StatelessWidget {
   SearchField({
    Key? key,
    required this.onChange,required this.onSearch
  }) : super(key: key);
  final Function(String) onChange;
  final Function onSearch;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged:onChange ,
      decoration: InputDecoration(
        hintText: "Search Student",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}