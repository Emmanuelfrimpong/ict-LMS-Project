
import 'package:flutter/material.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/authentication/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function onView;
   RoundedPasswordField({
    Key key,
    this.onChanged,
     this.onView,
     this.isInvisible=true
  }) : super(key: key);
  final bool isInvisible;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: isInvisible,
        onChanged: onChanged,
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.length < 6) {
            return 'Please Password can not be less than 6';
          } else
            return null;
        },
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed:onView ,
            icon: Icon(
              isInvisible?Icons.visibility:Icons.visibility_off,
              color: Colors.black,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
