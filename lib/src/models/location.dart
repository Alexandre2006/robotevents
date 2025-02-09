class Location {
  String venue;
  String address_1;
  String address_2;
  String city;
  String region;
  String postcode;
  String country;
  Coordinates coordinates;

  Location(
    this.venue,
    this.address_1,
    this.address_2,
    this.city,
    this.region,
    this.postcode,
    this.country,
    this.coordinates,
  );

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      json['venue'],
      json['address_1'],
      json['address_2'],
      json['city'],
      json['region'],
      json['postcode'],
      json['country'],
      Coordinates.fromJson(json['coordinates']),
    );
  }
}

class Coordinates {
  double lat;
  double lon;

  Coordinates(this.lat, this.lon);

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      json['lat'],
      json['lon'],
    );
  }
}
