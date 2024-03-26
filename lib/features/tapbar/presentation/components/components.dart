import 'package:fawry_app/features/tapbar/domain/entities/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel item;

  PropertyCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 151,
      child: Center(
        child: Material(
          elevation: 10,
          // color: Colors.orange,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0, // soften the shadow
                    )
                  ],
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                height: 143,
                width: 378,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
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
                                  fontSize: 15),
                            )),
                          ),
                          RichText(
                              text: const TextSpan(
                                  text: ' >  ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContractsCard extends StatelessWidget {
  final ContractsModel item;

  ContractsCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 151,
      child: Center(
        child: Material(
          elevation: 10,
          // color: Colors.orange,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ],
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                height: 143,
                width: 378,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
