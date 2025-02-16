import 'package:dio/dio.dart';
import 'package:robotevents/src/models/models.dart';
import 'package:robotevents/src/routes/events/events.dart';

class RobotEvents {
  late final dioClient;

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
}
