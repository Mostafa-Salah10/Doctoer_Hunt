class AvailableTimeModel {
  final double time;
  final String title;

  AvailableTimeModel({required this.time, required this.title});

  static List<AvailableTimeModel> get times => [
    AvailableTimeModel(time: 10.00, title: 'am'),
    AvailableTimeModel(time: 12.00, title: 'am'),
    AvailableTimeModel(time: 02.00, title: 'pm'),
    AvailableTimeModel(time: 03.00, title: 'pm'),
    AvailableTimeModel(time: 04.00, title: 'pm'),
  ];
  static List<AvailableTimeModel> get minutes => [
    AvailableTimeModel(time: 30, title: 'minutes'),
    AvailableTimeModel(time: 40, title: 'minutes'),
    AvailableTimeModel(time: 25, title: 'minutes'),
    AvailableTimeModel(time: 10, title: 'minutes'),
    AvailableTimeModel(time: 35, title: 'minutes'),
  ];
}
