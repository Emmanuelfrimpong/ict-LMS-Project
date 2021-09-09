import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:ict_lms/models/quiz-data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/responsive.dart';

class ViewQuizPage extends StatefulWidget {
  const ViewQuizPage({Key key, this.quizzes}) : super(key: key);
  final Quizzes quizzes;
  @override
  _ViewQuizPageState createState() => _ViewQuizPageState();
}

class _ViewQuizPageState extends State<ViewQuizPage> {
  List<Map<String, dynamic>> questions = [];
  bool start=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.quizzes.questions.forEach((element) {
      questions.add({
        'question': element['question'],
        'selectedAnswer': '',
        'answer': element['answer'],
        'optionA': element['optionA'],
        'optionB': element['optionD'],
        'optionC': element['optionC'],
        'optionD': element['optionD'],
        'id': element['id'],
        'score': element['score'],
      });
    });
    questions.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context)
                      ? 10
                      : Responsive.isTablet(context)
                          ? 15
                          : 25),
              child: Responsive.isMobile(context)
                  ? Container()
                  : Row(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: questions.length,
                                itemBuilder: (context, int index) {
                                  List<String> options = [
                                    'A. ${questions[index]['optionA']}',
                                    'B. ${questions[index]['optionB']}',
                                    'C. ${questions[index]['optionC']}',
                                    'D. ${questions[index]['optionD']}'
                                  ];
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        Text(
                                          '${index + 1}',
                                          style: GoogleFonts.lato(
                                              color: primaryColor, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          questions[index]['question'],
                                          style: GoogleFonts.lato(
                                              color: primaryColor, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                   subtitle:RadioGroup<Strint>,
                                   /* subtitle: RadioGroup<String>.builder(
                                      groupValue: questions[index]['selectedAnswer'],
                                      activeColor: Colors.green,
                                      onChanged: (value) => setState(() {
                                        questions[index]['selectedAnswer'] = value;
                                      }),
                                      items: options,
                                      itemBuilder: (item) => RadioButtonBuilder(
                                        item,
                                      ),
                                    ),*/
                                  );
                                }))
                      ],
                    ))),
    );
  }
}
