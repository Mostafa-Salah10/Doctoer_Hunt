class SlotModel {
  final String id;
  final bool isBooked;
  final bool isAfternoon;

  SlotModel({
    required this.id,
    required this.isBooked,
    this.isAfternoon = false,
  });

  factory SlotModel.fromJson(Map<String, dynamic> json, {required String id}) {
    return SlotModel(
      id: id,
      isBooked: json['isBooked'] ?? false,
      isAfternoon: id.contains('PM') || id.contains('pm'),
    );
  }
}
