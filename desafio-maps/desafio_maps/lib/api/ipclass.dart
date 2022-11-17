class Album {
  final String status;
  final String city;
  final String isp;

  const Album({
    required this.status,
    required this.city,
    required this.isp,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      status: json['status'],
      city: json['city'],
      isp: json['isp'],
    );
  }
}