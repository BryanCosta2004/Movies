class SpokenLanguage {
  final String isoCode;
  final String name;

  SpokenLanguage({
    required this.isoCode,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      isoCode: json['iso_639_1'],
      name: json['name'],
    );
  }
}