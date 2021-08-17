import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_lms/models/students_data.dart';
import 'package:ict_lms/public_files/application_colors.dart';
import 'package:ict_lms/public_files/search_box.dart';

class StudentTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentTableState();
  }
}

class StudentTableState extends State<StudentTable> {
  List<Students> _items = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = dummyData().generateItems();
    });
  }

  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: const Text('ID'),
        numeric: false, // Deliberately set to false to avoid right alignment.
      ),
      DataColumn(
        label: const Text('Firstname'),
        numeric: false,
        tooltip: 'Students Firstname',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort(
                (item1, item2) => item1.firstName.compareTo(item2.firstName));
          } else {
            _items.sort(
                (item1, item2) => item2.firstName.compareTo(item1.firstName));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Surname'),
        numeric: false, // Deliberately set to false to avoid right alignment.
        tooltip: 'Student Surname',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items
                .sort((item1, item2) => item1.surname.compareTo(item2.surname));
          } else {
            _items
                .sort((item1, item2) => item2.surname.compareTo(item1.surname));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Gender'),
        numeric: false,
        tooltip: 'Student Gender',
      ),
      DataColumn(
        label: const Text('Class'),
        numeric: false,
        tooltip: 'Student Class',
      ),
      DataColumn(
        label: const Text('Status'),
        numeric: false,
        tooltip: 'Student Current State',
      ),
      DataColumn(
        label: const Text('Action'),
        numeric: true,
        tooltip: 'Enable / disable, Edit or Delete Student ',
      ),
    ];
  }

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
          Text(item.firstName),
        ),
        DataCell(Text(item.surname)),
        DataCell(
          Text(item.stGender),
        ),
        DataCell(
          Text(item.stClass),
        ),
        DataCell(
          Text(item.stStatus),
        ),
        DataCell(Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  item.stStatus == 'Disabled'
                      ? FontAwesomeIcons.checkSquare
                      : FontAwesomeIcons.userTimes,
                  color:
                      item.stStatus == 'Disabled' ? Colors.green : Colors.red,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.userEdit,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: secondaryColor,
                )),
          ],
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*.45,
                child: SearchField(
                  onChange: (value) {},
                  onSearch: () {},
                ),
              ),
             Spacer(),
              TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: secondaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.userPlus,color: Colors.white,),
                  label: Text('New Student',style: GoogleFonts.lato(color: Colors.white),)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columnSpacing: 0,
                dividerThickness: 5,
                onSelectAll: (bool isSelected) {
                  if (isSelected != null) {
                    _items.forEach((item) {
                      item.isSelected = isSelected;
                    });

                    setState(() {});
                  }
                },
                dataRowColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) =>
                        states.contains(MaterialState.selected)
                            ? primaryColor
                            : Color.fromARGB(100, 215, 217, 219)),
                // dataRowHeight: 80,
                dataTextStyle: const TextStyle(
                    fontStyle: FontStyle.normal, color: Colors.black),
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => primaryColor),
                headingRowHeight: 50,
                headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
                horizontalMargin: 5,
                showBottomBorder: true,
                showCheckboxColumn: false,
                columns: _createColumns(),
                rows: _items.map((item) => _createRow(item)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
