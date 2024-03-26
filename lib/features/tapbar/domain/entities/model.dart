class PropertyModel {
  final String aqarname;
  final String date;
  final String aqarnumber;
  final String contry;
  final String city;

  PropertyModel(
      {required this.aqarname,
      required this.date,
      required this.aqarnumber,
      required this.contry,
      required this.city});
}

class ContractsModel {
  final String aqarname;
  final String date;
  final String unit;
  final String renter;
  final String time;

  ContractsModel(
      {required this.aqarname,
      required this.date,
      required this.unit,
      required this.renter,
      required this.time});
}
