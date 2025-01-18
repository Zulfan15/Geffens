class Earthquake {
  final String date;
  final String time;
  final String magnitude;
  final String depth;
  final String region;
  final String coordinates;

  Earthquake({
    required this.date,
    required this.time,
    required this.magnitude,
    required this.depth,
    required this.region,
    required this.coordinates,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    final info = json['Infogempa']['gempa'];
    return Earthquake(
      date: info['Tanggal'],
      time: info['Jam'],
      magnitude: info['Magnitude'],
      depth: info['Kedalaman'],
      region: info['Wilayah'],
      coordinates: info['Coordinates'],
    );
  }
}
