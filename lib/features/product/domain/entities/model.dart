
class ProductModel {
  final List image;
  final String name;
  final String price;
  final double rating;
  final String discount;
  final String date;
  final String bio;

  ProductModel(
      {required this.image,
        required this.name,
        required this.rating,
        required this.price,
        required this.discount,
        required this.date,
        required this.bio});
}







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
