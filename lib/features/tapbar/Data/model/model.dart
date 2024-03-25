class aqar_model {
  final String aqarname;
  final String date;
  final String aqarnumber;
  final String contry;
  final String city;

  aqar_model(
      {required this.aqarname,
      required this.date,
      required this.aqarnumber,
      required this.contry,
      required this.city});

  @override
  String toString() {
    return 'aqar_model{aqarname: $aqarname, date: $date, aqarnumber: $aqarnumber, contry: $contry, city: $city}';
  }
}
class aqaod_model {
  final String aqarname;
  final String date;
  final String unit;
  final String renter;
  final String time;

  aqaod_model(
      {required this.aqarname,
      required this.date,
      required this.unit,
      required this.renter,
      required this.time});

  @override
  String toString() {
    return 'aqaod_model{aqarname: $aqarname, date: $date, unit: $unit, renter: $renter, time: $time}';
  }
}
