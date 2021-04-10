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
  final String title;
  final String teacher1;
  final String otherTeacher;
  final String place;
  final DateTime dateTime;

  ScheduleModel(this.name, this.nim, this.title, this.teacher1,
      this.otherTeacher, this.place, this.dateTime);
}

List<ScheduleModel> dataAtSchedule = [
  ScheduleModel(
      "Saipul Anwar Abdullah Bin Marpaung",
      "195410177",
      "Implementasi GraphQL Pada Sistem Inventori Barang Sekretariat HMJ TI",
      "Pius Anggoro S.kom., M.Cs.",
      "Guntara S.Kom,. M.Kom. & Edi Faisal S.Kom.",
      "U 2.1.1",
      DateTime.now()),
  ScheduleModel(
      "Opri Nasrullah",
      "155410188",
      "Implementasi Push Notification Pada Firebase Cloud Messaging Untuk Aplikasi Penjadwalan Skripsi Menggunakan Flutter Berbasil Mobile di STMIK Akakom Yogyakarta",
      "Pius Anggoro S.kom., M.Cs.",
      "Guntara S.Kom,. M.Kom. & Edi Faisal S.Kom.",
      "U 2.1.1",
      DateTime.now()),
];

class NoteModel {
  final DateTime dateTime;
  final String titleNote;
  final List<String> notes;

  NoteModel(this.dateTime, this.titleNote, this.notes);
}
