import 'package:robotevents/src/models/models.dart';

enum Grade { college, highSchool, middleSchool, elementarySchool }

class Team {
  int id;
  String number;
  String? teamName;
  String? robotName;
  String? organization;
  Location? location;
  bool? registered;
  IdInfo program;
  Grade? grade;

  Team({
    required this.id,
    required this.number,
    this.teamName,
    this.robotName,
    this.organization,
    this.location,
    this.registered,
    required this.program,
    this.grade,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      number: json['number'],
      teamName: json['team_name'],
      robotName: json['robot_name'],
      organization: json['organization'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      registered: json['registered'],
      program: IdInfo.fromJson(json['program']),
      grade: json['grade'] != null
          ? json['grade'] == 'College'
              ? Grade.college
              : json['grade'] == 'High School'
                  ? Grade.highSchool
                  : json['grade'] == 'Middle School'
                      ? Grade.middleSchool
                      : Grade.elementarySchool
          : null,
    );
  }
}
