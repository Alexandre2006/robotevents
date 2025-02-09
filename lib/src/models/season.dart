import 'package:robotevents/src/models/id_info.dart';

class Season {
  int id;
  String name;
  IdInfo program;
  DateTime start;
  DateTime end;
  int yearsStart;
  int yearsEnd;

  Season({
    required this.id,
    required this.name,
    required this.program,
    required this.start,
    required this.end,
    required this.yearsStart,
    required this.yearsEnd,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: json['id'],
      name: json['name'],
      program: IdInfo.fromJson(json['program']),
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      yearsStart: json['years_start'],
      yearsEnd: json['years_end'],
    );
  }
}
