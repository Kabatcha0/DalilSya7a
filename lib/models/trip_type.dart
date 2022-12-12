enum Season { Winter, Summer, Autumn, Spring }

enum TripType { Exploration, Recovery, Activities, Therapy }

class Trip {
  final String id;
  final List<String> categories;
  final Season season;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  Trip(
      {required this.id,
      required this.categories,
      required this.season,
      required this.title,
      required this.imageUrl,
      required this.activities,
      required this.program,
      required this.duration,
      required this.tripType,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
