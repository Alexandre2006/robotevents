import 'package:robotevents/src/models/award.dart';
import 'package:robotevents/src/models/event.dart';
import 'package:robotevents/src/models/match_obj.dart';
import 'package:robotevents/src/models/program.dart';
import 'package:robotevents/src/models/ranking.dart';
import 'package:robotevents/src/models/season.dart';
import 'package:robotevents/src/models/skill.dart';
import 'package:robotevents/src/models/team.dart';

class PageMeta {
  int currentPage;
  int from;
  int lastPage;
  int perPage;
  int to;
  int total;

  PageMeta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory PageMeta.fromJson(Map<String, dynamic> json) {
    return PageMeta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class PaginatedTeam {
  PageMeta meta;
  List<Team> data;

  PaginatedTeam({
    required this.meta,
    required this.data,
  });

  factory PaginatedTeam.fromJson(Map<String, dynamic> json) {
    return PaginatedTeam(
      meta: PageMeta.fromJson(json['meta']),
      data: List<Team>.from(json['data'].map((team) => Team.fromJson(team))),
    );
  }
}

class PaginatedEvent {
  PageMeta meta;
  List<Event> data;

  PaginatedEvent({
    required this.meta,
    required this.data,
  });

  factory PaginatedEvent.fromJson(Map<String, dynamic> json) {
    return PaginatedEvent(
      meta: PageMeta.fromJson(json['meta']),
      data:
          List<Event>.from(json['data'].map((event) => Event.fromJson(event))),
    );
  }
}

class PaginatedAward {
  PageMeta meta;
  List<Award> data;

  PaginatedAward({
    required this.meta,
    required this.data,
  });

  factory PaginatedAward.fromJson(Map<String, dynamic> json) {
    return PaginatedAward(
      meta: PageMeta.fromJson(json['meta']),
      data:
          List<Award>.from(json['data'].map((award) => Award.fromJson(award))),
    );
  }
}

class PaginatedSeason {
  PageMeta meta;
  List<Season> data;

  PaginatedSeason({
    required this.meta,
    required this.data,
  });

  factory PaginatedSeason.fromJson(Map<String, dynamic> json) {
    return PaginatedSeason(
      meta: PageMeta.fromJson(json['meta']),
      data: List<Season>.from(
        json['data'].map((season) => Season.fromJson(season)),
      ),
    );
  }
}

class PaginatedRanking {
  PageMeta meta;
  List<Ranking> data;

  PaginatedRanking({
    required this.meta,
    required this.data,
  });

  factory PaginatedRanking.fromJson(Map<String, dynamic> json) {
    return PaginatedRanking(
      meta: PageMeta.fromJson(json['meta']),
      data: List<Ranking>.from(
        json['data'].map((ranking) => Ranking.fromJson(ranking)),
      ),
    );
  }
}

class PaginatedMatch {
  PageMeta meta;
  List<MatchObj> data;

  PaginatedMatch({
    required this.meta,
    required this.data,
  });

  factory PaginatedMatch.fromJson(Map<String, dynamic> json) {
    return PaginatedMatch(
      meta: PageMeta.fromJson(json['meta']),
      data: List<MatchObj>.from(
        json['data'].map((match) => MatchObj.fromJson(match)),
      ),
    );
  }
}

class PaginatedSkill {
  PageMeta meta;
  List<Skill> data;

  PaginatedSkill({
    required this.meta,
    required this.data,
  });

  factory PaginatedSkill.fromJson(Map<String, dynamic> json) {
    return PaginatedSkill(
      meta: PageMeta.fromJson(json['meta']),
      data: List<Skill>.from(
        json['data'].map((skill) => Skill.fromJson(skill)),
      ),
    );
  }
}

class PaginatedProgram {
  PageMeta meta;
  List<Program> data;

  PaginatedProgram({
    required this.meta,
    required this.data,
  });

  factory PaginatedProgram.fromJson(Map<String, dynamic> json) {
    return PaginatedProgram(
      meta: PageMeta.fromJson(json['meta']),
      data: List<Program>.from(
        json['data'].map((program) => Program.fromJson(program)),
      ),
    );
  }
}
