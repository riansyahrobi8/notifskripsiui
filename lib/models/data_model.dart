import 'package:notifskripsiui/utils/constanta_strings.dart';

class HomeModel {
  final String title;
  final String desc;
  final DateTime dateTime;

  HomeModel(this.title, this.desc, this.dateTime);
}

List<HomeModel> dataAtHome = [
  HomeModel("Pengumuman Pendadaran Bulan Maret 2021", lorem, DateTime.now()),
  HomeModel("Pengumuman Pendadaran Bulan Agustus 2020", lorem, DateTime.now()),
  HomeModel("Pengumuman Pendadaran Bulan Maret 2020", lorem, DateTime.now()),
];

class ScheduleModel {
  final String name;
  final String nim;
  final String titleSchedule;
  final String teacher1;
  final String otherTeacher;
  final String place;
  final DateTime dateTime;

  ScheduleModel(this.name, this.nim, this.titleSchedule, this.teacher1,
      this.otherTeacher, this.place, this.dateTime);
}

class NoteModel {
  final DateTime dateTime;
  final String titleNote;
  final List<String> notes;

  NoteModel(this.dateTime, this.titleNote, this.notes);
}
