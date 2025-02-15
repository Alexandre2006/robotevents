import 'package:robotevents/src/models/id_info.dart';

class Season {
  int? id;
  String? name;
  IdInfo? program;
  DateTime? start;
  DateTime? end;
  int? yearsStart;
  int? yearsEnd;

  Season({
    this.id,
    this.name,
    this.program,
    this.start,
    this.end,
    this.yearsStart,
    this.yearsEnd,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: json['id'],
      name: json['name'],
      program:
          json['program'] != null ? IdInfo.fromJson(json['program']) : null,
      start: json['start'] != null ? DateTime.parse(json['start']) : null,
      end: json['end'] != null ? DateTime.parse(json['end']) : null,
      yearsStart: json['years_start'],
      yearsEnd: json['years_end'],
    );
  }
}
