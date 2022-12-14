import 'dart:convert';

import 'package:gplaces/src/models/fetch_place/place.dart';

/// The FetchPlaceResponse contains [Place]
class FetchPlaceResponse {
  final Place? place;

  FetchPlaceResponse({this.place});

  factory FetchPlaceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FetchPlaceResponse(
      place: json['details'] == null ? null : Place.fromJson(json['details']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'place': place,
      };

  static FetchPlaceResponse parseResult(String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return FetchPlaceResponse.fromJson(parsed);
  }

  @override
  bool operator ==(other) =>
      other is FetchPlaceResponse && other.place == place;

  @override
  int get hashCode => place.hashCode;
}
