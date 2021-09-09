import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/application_colors.dart';

class AttachedFiles extends StatelessWidget {
  const AttachedFiles({Key key, this.files, this.width}) : super(key: key);
  final List<Map<String, dynamic>> files;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .28,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: primaryColor)),
      child: Column(
        children: [
          Text(
            'Attached Media',
            style: GoogleFonts.lato(
                color: primaryColor,
                decoration: TextDecoration.underline,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          files != null && files.length > 0
              ? ListView.builder(
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
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
                                      image: AssetImage(files[index]['type'] ==
                                              'pdf'
                                          ? 'assets/icons/pdf.png'
                                          : files[index]['type'] == 'docs'
                                              ? 'assets/icons/docs.png'
                                              : files[index]['type'] == 'image'
                                                  ? 'assets/icons/image.png'
                                                  : files[index]['type'] ==
                                                          'video'
                                                      ? 'assets/icons/video.png'
                                                      : files[index]['type'] ==
                                                              'audio'
                                                          ? 'assets/icons/audio.png'
                                                          : 'assets/icons/file.png'))),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                files[index]['title'],
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
                  itemCount: files.length,
                )
              : Text(
                  'No Attached Files',
                  style: GoogleFonts.laila(color: Colors.grey),
                )
        ],
      ),
    );
  }
}
