class Students {
  int stId;
  String firstName, surname, stClass, stStatus, stGender;
  bool isSelected;
  String lastSeen;
  Students(
      {required this.stId,
      required this.firstName,
      required this.surname,
      required this.stClass,
      required this.stStatus,
      required this.stGender,
      required this.isSelected,
      required this.lastSeen});
}

class dummyData {
  List<Students> generateItems() {
    List<Students> data = [
      Students(
          stClass: 'JHS 1',
          isSelected: false,
          lastSeen: '1627708809000',
          stGender: 'Male',
          stId: 10001,
          stStatus: 'Enabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 2',
          isSelected: false,
          lastSeen: 'Online',
          stGender: 'Male',
          stId: 10002,
          stStatus: 'Enabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 3',
          isSelected: false,
          lastSeen: '1627665609000',
          stGender: 'Male',
          stId: 10003,
          stStatus: 'Disabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 2',
          isSelected: false,
          lastSeen: 'Online',
          stGender: 'Female',
          stId: 10004,
          stStatus: 'Disabled',
          surname: 'Nyamaah',
          firstName: 'Rebecca'),
      Students(
          stClass: 'JHS 1',
          isSelected: false,
          lastSeen: '1627704900000',
          stGender: 'Male',
          stId: 10005,
          stStatus: 'Enabled',
          surname: 'Amos',
          firstName: 'Julius'),
      Students(
          stClass: 'JHS 2',
          isSelected: false,
          lastSeen: 'Online',
          stGender: 'Male',
          stId: 10006,
          stStatus: 'Enabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 3',
          isSelected: false,
          lastSeen: 'Online',
          stGender: 'Male',
          stId: 10007,
          stStatus: 'Disabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 2',
          isSelected: false,
          lastSeen: 'Online',
          stGender: 'Female',
          stId: 10008,
          stStatus: 'Disabled',
          surname: 'Nyamaah',
          firstName: 'Rebecca'),
      Students(
          stClass: 'JHS 1',
          isSelected: false,
          lastSeen: 'Online',
          stGender: 'Male',
          stId: 10009,
          stStatus: 'Enabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 2',
          isSelected: false,
          lastSeen: 'Online',
          stGender: 'Male',
          stId: 10010,
          stStatus: 'Enabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 3',
          isSelected: false,
          lastSeen: '1627751700000',
          stGender: 'Male',
          stId: 10011,
          stStatus: 'Disabled',
          surname: 'Appiah',
          firstName: 'Frank'),
      Students(
          stClass: 'JHS 2',
          isSelected: false,
          lastSeen: '1627791300000',
          stGender: 'Female',
          stId: 10012,
          stStatus: 'Disabled',
          surname: 'Nyamaah',
          firstName: 'Rebecca')
    ];
    return data;
  }
}
