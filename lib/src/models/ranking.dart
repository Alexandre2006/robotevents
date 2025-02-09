import 'package:robotevents/src/models/id_info.dart';

class Ranking {
  int id;
  IdInfo event;
  IdInfo division;
  int rank;
  IdInfo team;
  int wins;
  int losses;
  int ties;
  int wp;
  int ap;
  int sp;
  int highScore;
  num averageScore;
  int totalPoints;

  Ranking({
    required this.id,
    required this.event,
    required this.division,
    required this.rank,
    required this.team,
    required this.wins,
    required this.losses,
    required this.ties,
    required this.wp,
    required this.ap,
    required this.sp,
    required this.highScore,
    required this.averageScore,
    required this.totalPoints,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      id: json['id'],
      event: IdInfo.fromJson(json['event']),
      division: IdInfo.fromJson(json['division']),
      rank: json['rank'],
      team: IdInfo.fromJson(json['team']),
      wins: json['wins'],
      losses: json['losses'],
      ties: json['ties'],
      wp: json['wp'],
      ap: json['ap'],
      sp: json['sp'],
      highScore: json['high_score'],
      averageScore: json['average_score'],
      totalPoints: json['total_points'],
    );
  }
}
