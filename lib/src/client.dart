import 'package:dio/dio.dart';
import 'package:robotevents/src/models/models.dart';
import 'package:robotevents/src/routes/events/events.dart';
import 'package:robotevents/src/routes/events/programs.dart';
import 'package:robotevents/src/routes/events/seasons.dart';
import 'package:robotevents/src/routes/events/teams.dart';

class RobotEvents {
  late final Dio dioClient;

  // Constructor
  RobotEvents(String apiKey) {
    dioClient = Dio(
      BaseOptions(
        method: "GET",
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        sendTimeout: Duration(seconds: 5),
        baseUrl: "https://www.robotevents.com/api/v2",
        headers: {"Authorization": "Bearer $apiKey"},
        preserveHeaderCase: false,
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
        validateStatus: (status) => status == 200,
        receiveDataWhenStatusError: true,
        followRedirects: true,
        maxRedirects: 0,
        persistentConnection: false,
        requestEncoder: null,
        responseDecoder: null,
        listFormat: ListFormat.csv,
      ),
    );
  }

  // Events enpdoints
  Future<PaginatedEvent> getEvents({
    List<int>? id,
    List<String>? sku,
    List<int>? team,
    List<int>? season,
    DateTime? start,
    DateTime? end,
    String? region,
    List<EventLevel>? level,
    List<EventType>? type,
    int page = 1,
    int limit = 25,
  }) async =>
      getEventsEndpoint(dioClient, id, sku, team, season, start, end, region,
          level, type, page, limit);

  Future<Event> getEvent(int id) async => getEventEndpoint(dioClient, id);

  Future<PaginatedTeam> getEventTeams(int id,
          {List<String>? number,
          bool? registered,
          List<Grade>? grade,
          List<String>? country,
          int page = 1,
          int limit = 25}) async =>
      getEventTeamsEndpoint(
          dioClient, id, number, registered, grade, country, page, limit);

  Future<PaginatedSkill> getEventSkills(
    int id, {
    List<int>? team,
    List<SkillType>? type,
    int page = 1,
    int limit = 25,
  }) async =>
      getEventSkillsEndpoint(dioClient, id, team, type, page, limit);

  Future<PaginatedAward> getEventAwards(
    int id, {
    List<int>? team,
    List<String>? winner,
    int page = 1,
    int limit = 25,
  }) async =>
      getEventAwardsEndpoint(dioClient, id, team, winner, page, limit);

  Future<PaginatedMatch> getEventMatches(
    int id,
    int div, {
    List<int>? team,
    List<int>? round,
    List<int>? instance,
    List<int>? matchnum,
    int page = 1,
    int limit = 25,
  }) async =>
      getEventMatchesEndpoint(
          dioClient, id, div, team, round, instance, matchnum, page, limit);

  Future<PaginatedRanking> getEventFinalistRankings(
    int id,
    int div, {
    List<int>? team,
    List<int>? rank,
    int page = 1,
    int limit = 25,
  }) async =>
      getEventFinalistRankingsEndpoint(
          dioClient, id, div, team, rank, page, limit);

  Future<PaginatedRanking> getEventRankings(
    int id,
    int div, {
    List<int>? team,
    List<int>? rank,
    int page = 1,
    int limit = 25,
  }) async =>
      getEventRankingsEndpoint(dioClient, id, div, team, rank, page, limit);

  // Teams endpoints
  Future<PaginatedTeam> getTeams({
    List<int>? id,
    List<String>? number,
    List<int>? event,
    bool? registered,
    List<int>? program,
    List<Grade>? grade,
    List<String>? country,
    page = 1,
    limit = 25,
  }) async =>
      getTeamsEndpoint(dioClient, id, number, event, registered, program, grade,
          country, page, limit);

  Future<Team> getTeam(int id) async => getTeamEndpoint(dioClient, id);

  Future<PaginatedEvent> getTeamEvents(int id,
          {List<String>? sku,
          List<int>? season,
          DateTime? start,
          DateTime? end,
          List<EventLevel>? level,
          int page = 1,
          int limit = 25}) async =>
      getTeamEventsEndpoint(
          dioClient, id, sku, season, start, end, level, page, limit);

  Future<PaginatedMatch> getTeamMatches(int id,
          {List<int>? event,
          List<int>? season,
          List<int>? round,
          List<int>? instance,
          List<int>? matchnum,
          int page = 1,
          int limit = 25}) async =>
      getTeamMatchesEndpoint(
          dioClient, id, event, season, round, instance, matchnum, page, limit);

  Future<PaginatedRanking> getTeamRankings(int id,
          {List<int>? event,
          List<int>? rank,
          List<int>? season,
          int page = 1,
          int limit = 25}) async =>
      getTeamRankingsEndpoint(dioClient, id, event, rank, season, page, limit);

  Future<PaginatedSkill> getTeamSkills(int id,
          {List<int>? event,
          List<SkillType>? type,
          List<int>? season,
          int page = 1,
          int limit = 25}) async =>
      getTeamSkillsEndpoint(dioClient, id, event, type, season, page, limit);

  Future<PaginatedAward> getTeamAwards(int id,
          {List<int>? event,
          List<int>? season,
          int page = 1,
          int limit = 25}) async =>
      getTeamAwardsEndpoint(dioClient, id, event, season, page, limit);

  // Programs endpoints
  Future<PaginatedProgram> getPrograms({
    List<int>? ids,
    int page = 1,
    int limit = 25,
  }) async =>
      getProgramsEndpoint(dioClient, ids, page, limit);

  Future<Program> getProgram(int id) async => getProgramEndpoint(dioClient, id);

  // Seasons endpoints
  Future<PaginatedSeason> getSeasons(
          {List<int>? id,
          List<int>? program,
          List<int>? team,
          DateTime? start,
          DateTime? end,
          bool? active,
          int page = 1,
          int limit = 25}) async =>
      getSeasonsEndpoint(
          dioClient, id, program, team, start, end, active, page, limit);

  Future<Season> getSeason(int id) async => getSeasonEndpoint(dioClient, id);

  Future<PaginatedEvent> getSeasonEvents(int id,
          {List<String>? sku,
          List<int>? team,
          DateTime? start,
          DateTime? end,
          List<EventLevel>? level,
          int page = 1,
          int limit = 25}) async =>
      getSeasonEventsEndpoint(
          dioClient, id, sku, team, start, end, level, page, limit);
}
