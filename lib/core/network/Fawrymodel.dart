// // // // class Fawrymodel {
// // // //   int? id;
// // // //   String? code;
// // // //   String? name;
// // // //   String? namePrimaryLang;
// // // //   String? nameSecondaryLang;
// // // //   List<Null>? cityDataModels;
// // // //
// // // //   Fawrymodel(
// // // //       {this.id,
// // // //       this.code,
// // // //       this.name,
// // // //       this.namePrimaryLang,
// // // //       this.nameSecondaryLang,
// // // //       this.cityDataModels});
// // // //
// // // //   Fawrymodel.fromJson(Map<String, dynamic> json) {
// // // //     id = json['id'];
// // // //     code = json['code'];
// // // //     name = json['name'];
// // // //     namePrimaryLang = json['namePrimaryLang'];
// // // //     nameSecondaryLang = json['nameSecondaryLang'];
// // // //     if (json['cityDataModels'] != null) {
// // // //       cityDataModels = <Null>[];
// // // //       json['cityDataModels'].forEach((v) {
// // // //         cityDataModels!.add( Null.fromJson(v));
// // // //       });
// // // //     }
// // // //   }
// // // //
// // // //   Map<String, dynamic> toJson() {
// // // //     final Map<String, dynamic> data = new Map<String, dynamic>();
// // // //     data['id'] = this.id;
// // // //     data['code'] = this.code;
// // // //     data['name'] = this.name;
// // // //     data['namePrimaryLang'] = this.namePrimaryLang;
// // // //     data['nameSecondaryLang'] = this.nameSecondaryLang;
// // // //     if (this.cityDataModels != null) {
// // // //       data['cityDataModels'] =
// // // //           this.cityDataModels!.map((v) => v.toJson()).toList();
// // // //     }
// // // //     return data;
// // // //   }
// // // // }
// // //
// // // class Fawrymodel {
// // //   int? id;
// // //   String? code;
// // //   String? name;
// // //   String? namePrimaryLang;
// // //   String? nameSecondaryLang;
// // //   List<Fawrymodel>? cityDataModels;
// // //   List<Fawrymodel>? areaDataModels;
// // //   List<dynamic>? streetDataModels;
// // //
// // //   Fawrymodel({
// // //     this.id,
// // //     this.code,
// // //     this.name,
// // //     this.namePrimaryLang,
// // //     this.nameSecondaryLang,
// // //     this.cityDataModels,
// // //     this.areaDataModels,
// // //     this.streetDataModels,
// // //   });
// // //   Fawrymodel.fromJson(Map<String, dynamic> json) {
// // //     id = json['id'];
// // //     code = json['code'];
// // //     name = json['name'];
// // //     namePrimaryLang = json['namePrimaryLang'];
// // //     nameSecondaryLang = json['nameSecondaryLang'];
// // //     // if (json['cityDataModels'] != null) {
// // //     //   cityDataModels = <Null>[];
// // //     //   json['cityDataModels'].forEach((v) {
// // //     //     cityDataModels!.add(new Null.fromJson(v));
// // //     //   });
// // //     // }
// // //   }
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final Map<String, dynamic> data = new Map<String, dynamic>();
// // //     data['id'] = this.id;
// // //     data['code'] = this.code;
// // //     data['name'] = this.name;
// // //     data['namePrimaryLang'] = this.namePrimaryLang;
// // //     data['nameSecondaryLang'] = this.nameSecondaryLang;
// // //     // if (this.cityDataModels != null) {
// // //     //   data['cityDataModels'] =
// // //     //       this.cityDataModels!.map((v) => v.toJson()).toList();
// // //     // }
// // //     return data;
// // //   }
// // // }
// //
// // class fawry {
// //   int? id;
// //   String? code;
// //   String? name;
// //   String? namePrimaryLang;
// //   String? nameSecondaryLang;
// //
// //   fawry(
// //       {this.id,
// //         this.code,
// //         this.name,
// //         this.namePrimaryLang,
// //         this.nameSecondaryLang,
// //         });
// //
// //   fawry.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     code = json['code'];
// //     name = json['name'];
// //     namePrimaryLang = json['namePrimaryLang'];
// //     nameSecondaryLang = json['nameSecondaryLang'];
// //
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['code'] = this.code;
// //     data['name'] = this.name;
// //     data['namePrimaryLang'] = this.namePrimaryLang;
// //     data['nameSecondaryLang'] = this.nameSecondaryLang;
// //
// //     return data;
// //   }
// // }
//
// class Fawry {
//   int? id;
//   String? code;
//   String? name;
//   String? namePrimaryLang;
//   String? nameSecondaryLang;
//   List<Fawry>? cityDataModels;
//   List<Fawry>? areaDataModels;
//   List<dynamic>? streetDataModels;
//
//   Fawry({
//     this.id,
//     this.code,
//     this.name,
//     this.namePrimaryLang,
//     this.nameSecondaryLang,
//     this.cityDataModels,
//     this.areaDataModels,
//     this.streetDataModels,
//   });
//
//   Fawry copyWith({
//     int? id,
//     String? code,
//     String? name,
//     String? namePrimaryLang,
//     String? nameSecondaryLang,
//     List<Fawry>? cityDataModels,
//     List<Fawry>? areaDataModels,
//     List<dynamic>? streetDataModels,
//   }) =>
//       Fawry(
//         id: id ?? this.id,
//         code: code ?? this.code,
//         name: name ?? this.name,
//         namePrimaryLang: namePrimaryLang ?? this.namePrimaryLang,
//         nameSecondaryLang: nameSecondaryLang ?? this.nameSecondaryLang,
//         cityDataModels: cityDataModels ?? this.cityDataModels,
//         areaDataModels: areaDataModels ?? this.areaDataModels,
//         streetDataModels: streetDataModels ?? this.streetDataModels,
//       );
//
//   Fawry.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     code = json['code'];
//     name = json['name'];
//     namePrimaryLang = json['namePrimaryLang'];
//     nameSecondaryLang = json['nameSecondaryLang'];
//     if (json['cityDataModels'] != null) {
//       cityDataModels = <Fawry>[];
//       json['cityDataModels'].forEach((v) {
//         cityDataModels!.add(new Fawry.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['code'] = this.code;
//     data['name'] = this.name;
//     data['namePrimaryLang'] = this.namePrimaryLang;
//     data['nameSecondaryLang'] = this.nameSecondaryLang;
//     if (this.cityDataModels != null) {
//       data['cityDataModels'] =
//           this.cityDataModels!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class FawryModel {
  int? id;
  String? code;
  String? name;
  String? namePrimaryLang;
  String? nameSecondaryLang;
  List<FawryModel>? cityDataModels;

  FawryModel(
      {this.id,
        this.code,
        this.name,
        this.namePrimaryLang,
        this.nameSecondaryLang,
        this.cityDataModels});

  FawryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    namePrimaryLang = json['namePrimaryLang'];
    nameSecondaryLang = json['nameSecondaryLang'];
    if (json['cityDataModels'] != null) {
      cityDataModels = <FawryModel>[];
      json['cityDataModels'].forEach((v) {
        cityDataModels!.add(new FawryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['namePrimaryLang'] = this.namePrimaryLang;
    data['nameSecondaryLang'] = this.nameSecondaryLang;
    if (this.cityDataModels != null) {
      data['cityDataModels'] =
          this.cityDataModels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
