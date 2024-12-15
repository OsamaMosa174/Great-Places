import 'dart:io';

// ignore: camel_case_types
class placelocation {
  final double latitude;
  final double langitude;
  final String address;

  placelocation(
    this.address, {
    required this.latitude,
    required this.langitude,
  });
}

class Place {
  final String id;
  final String title;
  final placelocation? location;
  final File image;

  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
