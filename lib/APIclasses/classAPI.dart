class Album {
  final int place_id;
  final String licence;
  final String osm_type;
  final int osm_id;
  final String lat;
  final String lon;
  final int place_rank;
  final String category;
  final String type;
  final double importance;
  final String addresstype;
  final String name;
  final String display_name;
  final Address address;

  const Album({
    required this.place_id,
    required this.licence,
    required this.osm_type,
    required this.osm_id,
    required this.lat,
    required this.lon,
    required this.place_rank,
    required this.category,
    required this.type,
    required this.importance,
    required this.addresstype,
    required this.name,
    required this.display_name,
    required this.address,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      place_id: json['place_id'],
      licence: json['licence'],
      osm_type: json['osm_type'],
      osm_id: json['osm_id'],
      lat: json['lat'],
      lon: json['lon'],
      place_rank: json['place_rank'],
      category: json['category'],
      type: json['type'],
      importance: json['importance'],
      addresstype: json['addresstype'],
      name: json['name'],
      display_name: json['display_name'],
      address: Address.fromJson(json['address']),
    );
  }
}
class Address {
  final String historic;
  final String house_number;
  final String road;
  final String city_district;
  final String municipality;
  final String county;
  final String state;
  final String ISO3166;
  final String region;
  final String ISO31662;
  final String postcode;
  final String country;
  final String country_code;

  const Address({
    required this.historic,
    required this.house_number,
    required this.road,
    required this.city_district,
    required this.municipality,
    required this.county,
    required this.state,
    required this.ISO3166,
    required this.region,
    required this.ISO31662,
    required this.postcode,
    required this.country,
    required this.country_code,
});
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      historic: json['historic'],
      house_number: json['house_number'],
      road: json['road'],
      city_district: json['city_district'],
      municipality: json['municipality'],
      county: json['county'],
      state: json['state'],
      ISO3166: json['ISO3166-2-lvl6'],
      region: json['region'],
      ISO31662: json['ISO3166-2-lvl4'],
      postcode: json['postcode'],
      country: json['country'],
      country_code: json['country_code'],
    );
  }
}