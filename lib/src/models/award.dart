import 'package:robotevents/src/models/models.dart';

enum Classification { champion, finalist, semifinalist, quarterfinalist }

enum Designation { tournament, division }

class Award {
  int? id;
  IdInfo? event;
  int? order;
  String? title;
  List<String>? qualifications;
  Designation? designation;
  Classification? classification;
  List<TeamAwardWinner>? teamWinners;
  List<String>? individualWinners;

  Award({
    this.id,
    this.event,
    this.order,
    this.title,
    this.qualifications,
    this.designation,
    this.classification,
    this.teamWinners,
    this.individualWinners,
  });

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(
      id: json['id'],
      event: json['event'] != null ? IdInfo.fromJson(json['event']) : null,
      order: json['order'],
      title: json['title'],
      qualifications: json['qualifications'] != null
          ? List<String>.from(json['qualifications'])
          : null,
      designation: json['designation'] != null
          ? Designation.values.firstWhere(
              (e) => e.toString().split('.')[1] == json['designation'])
          : null,
      classification: json['classification'] != null
          ? Classification.values.firstWhere(
              (e) => e.toString().split('.')[1] == json['classification'])
          : null,
      teamWinners: json['team_winners'] != null
          ? List<TeamAwardWinner>.from(
              json['team_winners'].map((x) => TeamAwardWinner.fromJson(x)))
          : null,
      individualWinners: json['individual_winners'] != null
          ? List<String>.from(json['individual_winners'])
          : null,
    );
  }
}

class TeamAwardWinner {
  IdInfo? division;
  IdInfo? team;

  TeamAwardWinner({this.division, this.team});

  factory TeamAwardWinner.fromJson(Map<String, dynamic> json) {
    return TeamAwardWinner(
      division:
          json['division'] != null ? IdInfo.fromJson(json['division']) : null,
      team: json['team'] != null ? IdInfo.fromJson(json['team']) : null,
    );
  }
}
