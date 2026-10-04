class AvailableTimeModel {
  final double time;
  final String title;

  AvailableTimeModel({required this.time, required this.title});

  static List<AvailableTimeModel> get times => [
    AvailableTimeModel(time: 10.00, title: 'AM'),
    AvailableTimeModel(time: 12.00, title: 'AM'),
    AvailableTimeModel(time: 02.00, title: 'PM'),
    AvailableTimeModel(time: 03.00, title: 'PM'),
    AvailableTimeModel(time: 04.00, title: 'PM'),
  ];
  static List<AvailableTimeModel> get minutes => [
    AvailableTimeModel(time: 30, title: 'Minit'),
    AvailableTimeModel(time: 40, title: 'Minit'),
    AvailableTimeModel(time: 25, title: 'Minit'),
    AvailableTimeModel(time: 10, title: 'Minit'),
    AvailableTimeModel(time: 35, title: 'Minit'),
  ];
}
