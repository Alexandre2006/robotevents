import 'package:robotevents/src/models/id_info.dart';

enum Classification { champion, finalist, semifinalist, quarterfinalist }

enum Designation { tournament, division }

class Award {
  int id;
  IdInfo event;
  int order;
  String title;
  List<String> qualifications;
  Designation? designation;
  Classification? classification;
  List<TeamAwardWinner> teamWinners;
  List<String> individualWinners;

  Award({
    required this.id,
    required this.event,
    required this.order,
    required this.title,
    required this.qualifications,
    this.designation,
    this.classification,
    required this.teamWinners,
    required this.individualWinners,
  });

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(
      id: json['id'],
      event: IdInfo.fromJson(json['event']),
      order: json['order'],
      title: json['title'],
      qualifications: List<String>.from(json['qualifications']),
      designation: json['designation'] != null
          ? Designation.values.firstWhere(
              (e) => e.toString().split('.')[1] == json['designation'])
          : null,
      classification: json['classification'] != null
          ? Classification.values.firstWhere(
              (e) => e.toString().split('.')[1] == json['classification'])
          : null,
      teamWinners: List<TeamAwardWinner>.from(
          json['team_winners'].map((x) => TeamAwardWinner.fromJson(x))),
      individualWinners: List<String>.from(json['individual_winners']),
    );
  }
}

class TeamAwardWinner {
  IdInfo division;
  IdInfo team;

  TeamAwardWinner({required this.division, required this.team});

  factory TeamAwardWinner.fromJson(Map<String, dynamic> json) {
    return TeamAwardWinner(
      division: IdInfo.fromJson(json['division']),
      team: IdInfo.fromJson(json['team']),
    );
  }
}
