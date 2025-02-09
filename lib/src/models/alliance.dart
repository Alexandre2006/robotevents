import 'package:robotevents/src/models/id_info.dart';

enum AllianceColor { red, blue }

class Alliance {
  AllianceColor color;
  int score;
  List<AllianceTeam> teams;

  Alliance({required this.color, required this.score, required this.teams});

  factory Alliance.fromJson(Map<String, dynamic> json) {
    return Alliance(
      color: json['color'] == 'red' ? AllianceColor.red : AllianceColor.blue,
      score: json['score'],
      teams: (json['teams'] as List)
          .map((team) => AllianceTeam.fromJson(team))
          .toList(),
    );
  }
}

class AllianceTeam {
  IdInfo team;
  bool sitting;

  AllianceTeam({required this.team, required this.sitting});

  factory AllianceTeam.fromJson(Map<String, dynamic> json) {
    return AllianceTeam(
      team: IdInfo.fromJson(json['team']),
      sitting: json['sitting'],
    );
  }
}
