import 'package:json_annotation/json_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


@JsonSerializable()
class latLng {
  latLng({
    required this.lat,
    required this.lng,
  });

  factory latLng.fromJson(Map<String, dynamic> json) {
    return latLng(lat: json['lat'], lng: json['lng']);
  }

  final double lat;
  final double lng;
}

@JsonSerializable()
class Region {
  Region({
    required this.coords,
    required this.id,
    required this.name,
    required this.zoom,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      coords: LatLng.fromJson(json['coords'])!,
      id: json['id'],
      name: json['name'],
      zoom: json['zoom']
    );
  }

  final LatLng coords;
  final String id;
  final String name;
  final double zoom;
}

@JsonSerializable()
class Office {
  Office({
    required this.address,
    required this.id,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.region,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      address: json['address'],
      id: json['id'],
      image: json['image'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      phone: json['phone'],
      region: json['region'],
    );
  }
  //Map<String, dynamic> toJson() => _$OfficeToJson(this);

  final String address;
  final String id;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String region;
}




@JsonSerializable()
class Locations {
  Locations({
    required this.offices,
    required this.regions,
  });

  factory Locations.fromJson(Map<String, dynamic> json) {
    List<Office> off = json['offices'].map<Office>((json) => Office.fromJson(json)).toList();
    List<Region> reg = json['regions'].map<Region>((json) => Region.fromJson(json)).toList();
    return Locations(
      offices: off,
      regions: reg,
    );
  }
  //Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<dynamic> offices;
  final List<dynamic> regions;
}