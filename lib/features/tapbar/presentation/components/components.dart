import 'package:fawry_app/features/tapbar/Data/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final aqar_model item;

  CustomCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Material(
        elevation: 2,
        child: Center(
          child: Card(
            color: Colors.grey[300],
            surfaceTintColor: Colors.grey,
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.white,
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                const Text(
                                  'اسم العقار : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.aqarname),
                                const Spacer(),
                                const Text(
                                  'تاريخ الاضافه : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.date),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'رقم العقار : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.aqarnumber),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'الدوله : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.contry),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                const Text(
                                  'المدينه : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.city),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: RichText(
                                      text: const TextSpan(
                                    text: 'المزيد',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14),
                                  )),
                                ),
                                RichText(
                                    text: const TextSpan(
                                        text: ' >  ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))),
                                // Text('التاريخ  :  '),
                                // Text(item.date),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCards extends StatelessWidget {
  final aqaod_model item;

  CustomCards({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Material(
        elevation: 2,
        child: Center(
          child: Card(
            color: Colors.grey[300],
            surfaceTintColor: Colors.grey,
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.white,
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                const Text(
                                  'اسم العقار : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.aqarname),
                                const Spacer(),
                                const Text(
                                  'تاريخ الاضافه : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.date),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'الوحده : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.unit),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'المستاجر : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.renter),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                const Text(
                                  'مده العقد : ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(item.time),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: RichText(
                                      text: const TextSpan(
                                    text: 'المزيد',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14),
                                  )),
                                ),
                                RichText(
                                    text: const TextSpan(
                                        text: ' >  ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))),
                                // Text('التاريخ  :  '),
                                // Text(item.date),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
// class CustomCards extends StatelessWidget {
//   final aqaod_model item;
//
//   CustomCards({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       child: Center(
//         child: Card(
//           child: ListView.builder(
//               itemCount: 1,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SizedBox(
//                     height: 120,
//                     child: Column(
//                       children: [
//                         Row(
//                           // crossAxisAlignment: CrossAxisAlignment.end,
//                           // mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Text('اسم العقار   :  '),
//                             Text(item.aqarname),
//                             const Spacer(),
//                             const Text('التاريخ  :  '),
//                             Text(item.date),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.end,
//                           // crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             const Text('الوحده  :  '),
//                             Text(item.unit),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Text('المستاجر :  '),
//                             Text(item.renter),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Text('مده العقد : '),
//                             Text(item.time),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }
