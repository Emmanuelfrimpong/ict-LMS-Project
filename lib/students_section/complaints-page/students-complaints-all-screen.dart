import 'package:flutter/material.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/authentication/components/rounded_button.dart';
import 'package:ict_lms/public_files/custom-drop-down.dart';
import 'package:ict_lms/public_files/responsive.dart';

class StudentsComplains extends StatefulWidget {
  const StudentsComplains({Key key}) : super(key: key);

  @override
  _StudentsComplainsState createState() => _StudentsComplainsState();
}

class _StudentsComplainsState extends State<StudentsComplains> {
  final myController = TextEditingController();
  String category;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
        child: Container(
      width: Responsive.isMobile(context)
          ? size.width * .8
          : Responsive.isTablet(context)
              ? size.width * .6
              : size.width * .5,
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(.4),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20,),
          CustomDropDown(
            value: category,
            itemColor: Colors.white,
            itemsList: [
              'Login Problem',
              'Quiz Problem',
              'Lessons Problem',
              'Others',
            ],
            hint: 'Select Complaints Type',
            onChanged: (value) {
              setState(() {
                category = value;
              });
            }, backColor: Colors.transparent,),
          Divider(),
          TextField(
            maxLines: 10,
            keyboardType: TextInputType.text,
            controller: myController,
            decoration: InputDecoration(
              hintText: 'Enter Your message',
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RoundedButton(
              color: Colors.white,
              text: 'SUBMIT',
              textColor: primaryColor,
              press: (){
                //todo send complaints
              },
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    ));
  }
}
