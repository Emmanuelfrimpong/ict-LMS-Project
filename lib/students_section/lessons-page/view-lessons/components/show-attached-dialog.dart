import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';

class AttachedFilesPage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> files;
  const AttachedFilesPage({Key key, this.title, this.files}) : super(key: key);

  @override
  _AttachedFilesPageState createState() => _AttachedFilesPageState();
}

class _AttachedFilesPageState extends State<AttachedFilesPage> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: contentBox(context)
    );
  }
  contentBox(context){
    return Container(
      padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
          + Constants.padding, right: Constants.padding,bottom: Constants.padding
      ),
      margin: EdgeInsets.only(top: Constants.avatarRadius),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Constants.padding),
          boxShadow: [
            BoxShadow(color: Colors.black,offset: Offset(0,10),
                blurRadius: 10
            ),
          ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
          SizedBox(height: 15,),
          widget.files != null && widget.files.length > 0
              ? ListView.builder(
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: (){
                    //todo send user to view page
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(defaultPadding * 0.75),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(widget.files[index]['type'] ==
                                    'pdf'
                                    ? 'assets/icons/pdf.png'
                                    : widget.files[index]['type'] == 'docs'
                                    ? 'assets/icons/docs.png'
                                    : widget.files[index]['type'] == 'image'
                                    ? 'assets/icons/image.png'
                                    : widget.files[index]['type'] ==
                                    'video'
                                    ? 'assets/icons/video.png'
                                    : widget.files[index]['type'] ==
                                    'audio'
                                    ? 'assets/icons/audio.png'
                                    : 'assets/icons/file.png'))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          widget.files[index]['title'],
                          style: GoogleFonts.adamina(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            shrinkWrap: true,
            itemCount: widget.files.length,
          )
              : Text(
            'No Attached Files',
            style: GoogleFonts.laila(color: Colors.grey),
          ),
          SizedBox(height: 22,),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(child: Text('Close'),
              style: TextButton.styleFrom(backgroundColor: Colors.white,),
              onPressed: (){
              Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}