import 'dart:convert';

class GetEventsResponse {
  GetEventsResponse({
    required this.events,
  });

  final List<EventModel> events;

  factory GetEventsResponse.fromJson(String str) =>
      GetEventsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetEventsResponse.fromMap(Map<String, dynamic> json) => GetEventsResponse(
        events: List<EventModel>.from(json["events"].map((x) => EventModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "events": List<dynamic>.from(events.map((x) => x.toMap())),
      };
}

class EventModel {
  EventModel({
    required this.id,
    required this.datetimeUtc,
    required this.venue,
    required this.performers,
    required this.isOpen,
    required this.datetimeLocal,
    required this.shortTitle,
    required this.announceDate,
    required this.createdAt,
    required this.title,
    required this.description,
  });

  final int id;
  final DateTime datetimeUtc;
  final Venue venue;
  final List<Performer> performers;
  final bool isOpen;
  final DateTime datetimeLocal;
  final String shortTitle;
  final DateTime announceDate;
  final DateTime createdAt;
  final String title;
  final String description;

  factory EventModel.fromJson(String str) => EventModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventModel.fromMap(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        datetimeUtc: DateTime.parse(json["datetime_utc"]),
        venue: Venue.fromMap(json["venue"]),
        performers: List<Performer>.from(
            json["performers"].map((x) => Performer.fromMap(x))),
        isOpen: json["is_open"],
        datetimeLocal: DateTime.parse(json["datetime_local"]),
        shortTitle: json["short_title"],
        announceDate: DateTime.parse(json["announce_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "datetime_utc": datetimeUtc.toIso8601String(),
        "venue": venue.toMap(),
        "performers": List<dynamic>.from(performers.map((x) => x.toMap())),
        "is_open": isOpen,
        "datetime_local": datetimeLocal.toIso8601String(),
        "short_title": shortTitle,
        "announce_date": announceDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "title": title,
        "description": description,
      };
}

class Performer {
  Performer({
    required this.image,
  });

  final String image;

  factory Performer.fromJson(String str) => Performer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Performer.fromMap(Map<String, dynamic> json) => Performer(
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
      };
}

class Venue {
  Venue({
    required this.state,
    required this.postalCode,
    required this.name,
    required this.address,
    required this.city,
    required this.id,
    required this.displayLocation,
  });

  final String state;
  final String postalCode;
  final String name;
  final String address;
  final String city;
  final int id;
  final String displayLocation;

  factory Venue.fromJson(String str) => Venue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venue.fromMap(Map<String, dynamic> json) => Venue(
        state: json["state"],
        postalCode: json["postal_code"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        id: json["id"],
        displayLocation: json["display_location"],
      );

  Map<String, dynamic> toMap() => {
        "state": state,
        "postal_code": postalCode,
        "name": name,
        "address": address,
        "city": city,
        "id": id,
        "display_location": displayLocation,
      };
}
