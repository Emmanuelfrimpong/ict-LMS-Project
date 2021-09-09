import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/responsive.dart';

enum KTDialogType { Warning, Info, Danger, Success }

class KTDialogContent extends StatelessWidget {
  final String title, contentText, btn1Text, btn2Text;
  final Function btn1Press, btn2Press;
  final KTDialogType ktDialogType;
  const KTDialogContent(
      {Key key,
      @required this.btn1Press,
      this.btn2Press,
      this.title,
      this.contentText,
      @required this.btn1Text,
      this.btn2Text,
      this.ktDialogType = KTDialogType.Info})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isMobile(context)? EdgeInsets.all(1):EdgeInsets.symmetric(horizontal: 58),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }
  contentBox(context) {
    return Padding(
      padding: Responsive.isMobile(context)? EdgeInsets.all(1):EdgeInsets.symmetric(horizontal: 58),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, top: 100, right: 15, bottom: 15),
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: primaryColor),
                )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  contentText,
                  style: TextStyle(fontSize: 16,color: primaryColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (btn1Text.isNotEmpty)
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  elevation: 5,
                                  enableFeedback: true),
                              onPressed: btn1Press,
                              child: Text(
                                btn1Text,
                                style: GoogleFonts.lato(color: Colors.white),
                              )),
                        SizedBox(
                          width: 20,
                        ),
                        if (btn2Text.isNotEmpty)
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  elevation: 5,
                                  enableFeedback: true),
                              onPressed: btn2Press,
                              child: Text(
                                btn2Text,
                                style: TextStyle(color: Colors.white),
                              ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ktDialogType == KTDialogType.Info
                            ? AssetImage(
                                'assets/animated/info.gif',
                              )
                            : ktDialogType == KTDialogType.Warning
                                ? AssetImage(
                                    'assets/animated/warning.gif',
                                  )
                                : ktDialogType == KTDialogType.Success
                                    ? AssetImage(
                                        'assets/animated/correct.gif',
                                      )
                                    : ktDialogType == KTDialogType.Danger
                                        ? AssetImage(
                                            'assets/animated/warning.gif',
                                          )
                                        : AssetImage(
                                            'assets/animated/warning.gif',
                                          ),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KTDialog {
  final String title, contentText, btn1Text, btn2Text;
  final Function btn1Press, btn2Press;
  final KTDialogType ktDialogType;
  final BuildContext context;
  final bool dismissable;
  KTDialog(this.context,
      {this.title = 'Dialog Title',
      this.contentText = 'Dialog Content',
      this.btn1Text = '',
      this.btn2Text = '',
      this.btn1Press,
      this.btn2Press,
      this.dismissable = false,
      this.ktDialogType = KTDialogType.Info});

  Future<void> show() {
    return showDialog(
        context: context,
        barrierDismissible: dismissable,
        builder: (BuildContext context) {
          return KTDialogContent(
              title: title,
              ktDialogType: ktDialogType,
              contentText: contentText,
              btn1Text: btn1Text,
              btn2Text: btn2Text,
              btn1Press: btn1Press,
              btn2Press: btn2Press);
        });
  }
}
