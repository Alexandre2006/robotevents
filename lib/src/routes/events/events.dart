import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:robotevents/src/models/models.dart';
import 'package:robotevents/src/utils.dart';

Future<PaginatedEvent> getEventsEndpoint(
  // Dio Client (Required)
  Dio client,
  // Filters (Optional)
  List<int>? id,
  List<String>? sku,
  List<int>? team,
  List<int>? season,
  DateTime? start,
  DateTime? end,
  String? region,
  List<EventLevel>? level,
  List<EventType>? type,
) async {
  // Prepare query parameters
  final Map<String, dynamic> queryParameters = {};
  if (id != null) queryParameters['id'] = id.join(',');
  if (sku != null) queryParameters['sku'] = sku.join(',');
  if (team != null) queryParameters['team'] = team.join(',');
  if (season != null) queryParameters['season'] = season.join(',');
  if (start != null) queryParameters['start'] = dateTimeToRfc3339(start);
  if (end != null) queryParameters['end'] = dateTimeToRfc3339(end);
  if (region != null) queryParameters['region'] = region;
  if (level != null) {
    queryParameters['level'] =
        level.map((e) => e.toString().split('.').last).join(',');
  }
  if (type != null) {
    queryParameters['type'] =
        type.map((e) => e.toString().split('.').last).join(',');
  }

  try {
    // Make the request
    final response =
        await client.get('/events', queryParameters: queryParameters);

    // Parse the response on success
    Map<String, dynamic> json = jsonDecode(response.toString());
    // DEBUG LOG JSON
    print(json);
    return PaginatedEvent.fromJson(json);
  } on Exception {
    rethrow;
  }
}
