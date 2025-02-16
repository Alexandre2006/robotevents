import 'package:robotevents/src/models/models.dart';

class Ranking {
  int? id;
  IdInfo? event;
  IdInfo? division;
  int? rank;
  IdInfo? team;
  int? wins;
  int? losses;
  int? ties;
  int? wp;
  int? ap;
  int? sp;
  int? highScore;
  num? averageScore;
  int? totalPoints;

  Ranking({
    this.id,
    this.event,
    this.division,
    this.rank,
    this.team,
    this.wins,
    this.losses,
    this.ties,
    this.wp,
    this.ap,
    this.sp,
    this.highScore,
    this.averageScore,
    this.totalPoints,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      id: json['id'],
      event: json['event'] != null ? IdInfo.fromJson(json['event']) : null,
      division:
          json['division'] != null ? IdInfo.fromJson(json['division']) : null,
      rank: json['rank'],
      team: json['team'] != null ? IdInfo.fromJson(json['team']) : null,
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
