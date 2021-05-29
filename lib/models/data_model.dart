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
  final String teacher2;
  final String teacher3;
  final String place;
  final DateTime dateTime;

  ScheduleModel(this.name, this.nim, this.title, this.teacher1, this.teacher2,
      this.teacher3, this.place, this.dateTime);
}

List<ScheduleModel> dataAtSchedule = [
  ScheduleModel(
      "Saipul Anwar Abdullah Bin Marpaung",
      "195410177",
      "Implementasi GraphQL Pada Sistem Inventori Barang Sekretariat HMJ TI",
      "Pius Anggoro S.kom., M.Cs.",
      "Guntara S.Kom,. M.Kom.",
      "Edi Faisal S.Kom.",
      "U.2.1",
      DateTime.now()),
  ScheduleModel(
      "Opri Nasrullah",
      "155410188",
      "Implementasi Push Notification Pada Firebase Cloud Messaging Untuk Aplikasi Penjadwalan Skripsi Menggunakan Flutter Berbasil Mobile di STMIK Akakom Yogyakarta",
      "Pius Anggoro S.kom., M.Cs.",
      "Guntara S.Kom,. M.Kom.",
      "Edi Faisal S.Kom.",
      "U.2.2",
      DateTime.now()),
];

class NoteModel {
  final DateTime dateTime;
  final String titleNote;
  final String name;
  final String nim;
  final List<String> notes;
  final List<String> notes2;
  final List<String> notes3;

  NoteModel(this.dateTime, this.titleNote, this.name, this.nim, this.notes,
      this.notes2, this.notes3);
}

List<NoteModel> dataAtNote = [
  NoteModel(DateTime.now(), "Catatan Proposal", "Opri Nasrullah", "155410100",
      [lorem, lorem], [lorem, lorem, lorem], [lorem, lorem, lorem]),
  NoteModel(
      DateTime.now(),
      "Catatan Pra Skripsi",
      "Opri Nasrullah",
      "155410100",
      [lorem, lorem, lorem],
      [lorem, lorem, lorem, lorem, lorem],
      [lorem, lorem, lorem]),
  NoteModel(DateTime.now(), "Catatan Skripsi", "Opri Nasrullah", "155410100",
      [lorem, lorem], [lorem, lorem, lorem], [lorem, lorem]),
  NoteModel(DateTime.now(), "Catatan Revisi Skripsi", "Opri Nasrullah",
      "155410100", [lorem, lorem], [lorem, lorem], [lorem, lorem, lorem]),
];

class User {
  final String name;
  final String noid;
  final String type;

  User(this.name, this.noid, this.type);
}

List<User> dataUsers = [
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Pius Dianggoro S.Kom., M.Cs. jsdhgfjhg", "155410100", "Dosen"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Ilham Rais Irvanto S.Pd.", "155410100", "Dosen"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Pius Dianggoro S.Kom., M.Cs.", "155410100", "Dosen"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Ilham Rais Irvanto S.Pd.", "155410100", "Dosen"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Pius Dianggoro S.Kom., M.Cs.", "155410100", "Dosen"),
  User("Opri Nasrullah", "155410100", "Mahasiswa"),
  User("Ilham Rais Irvanto S.Pd.", "155410100", "Dosen"),
];
