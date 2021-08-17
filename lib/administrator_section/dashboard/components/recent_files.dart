import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ict_lms/models/students_data.dart';
import 'package:ict_lms/public_files/Constant_Data.dart';
import 'package:ict_lms/public_files/application_colors.dart';


class RecentFiles extends StatefulWidget {
  const RecentFiles({
    Key key,
  }) : super(key: key);

  @override
  _RecentFilesState createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {

  DataRow _createRow(Students item) {
    return DataRow(
      // index: item.id, // for DataRow.byIndex
      key: ValueKey(item.stId),
      selected: item.isSelected,
      onSelectChanged: (bool isSelected) {
        if (isSelected != null) {
          item.isSelected = isSelected;

          setState(() {});
        }
      },
      color: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
      states.contains(MaterialState.selected)
          ? primaryColor.withOpacity(.5)
          : Color.fromARGB(100, 215, 217, 219)),
      cells: [
        DataCell(
          Text(item.stId.toString()),
        ),
        DataCell(
          Text('${item.surname} ${item.firstName}' ),
        ),
        DataCell(
          Text(item.stGender),
        ),
        DataCell(
          Text(item.stClass),
        ),
        DataCell(
          Text(item.stStatus),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recently Visited Students ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text("ID"),
                ),
                DataColumn(
                  label: Text("Student Name"),
                ),
                DataColumn(
                  label: Text("Gender"),
                ),
                DataColumn(
                  label: Text("Time"),
                ),

              ], rows: [],
              // rows: List.generate(
              //   demoRecentFiles.length,
              //   (index) => recentFileDataRow(demoRecentFiles[index]),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}


