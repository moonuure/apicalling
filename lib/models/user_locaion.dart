class UserLocation {
  final String? city;
  final String? state;
  final String? country;
  final LocationStreet? street;
  final String? postcode;
  final LocationCoordinates? coordinates;
  final LocatTimeZone? timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.street,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> e) {
    final timezone = LocatTimeZone.fromMap(e?['timezone']);

    final Coordinates = LocationCoordinates.fromMap(e['location']);

    final street = LocationStreet.fromMap(e?['street']);

    return UserLocation(
      city: e['location']['city'],
      state: e['location']['state'],
      country: e['location']['country'],
      street: street,
      postcode: e['location']['postcode'].toString(),
      coordinates: Coordinates,
      timezone: timezone,
    );
  }
}

class LocationCoordinates {
  final String? latitude;
  final String? longtude;

  LocationCoordinates({
    required this.latitude,
    required this.longtude,
  });
  factory LocationCoordinates.fromMap(Map<String, dynamic> e) {
    return LocationCoordinates(
        latitude: e?['latitude'], longtude: e?['longtude']);
  }
}

class LocatTimeZone {
  final String? offset;
  final String? description;
  LocatTimeZone({
    required this.offset,
    required this.description,
  });
  factory LocatTimeZone.fromMap(Map<String, dynamic> e) {
    return LocatTimeZone(offset: e?['offset'], description: e?['description']);
  }
}

class LocationStreet {
  final int? number;
  final String? name;
  LocationStreet({
    required this.number,
    required this.name,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> e) {
    return LocationStreet(number: e?['number'], name: e?['name']);
  }
}
