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
}
