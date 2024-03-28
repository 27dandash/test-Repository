import 'package:fawry_app/features/product/domain/entities/model.dart';
import 'package:fawry_app/features/product/presentation/controlles/cubit.dart';
import 'package:fawry_app/features/product/presentation/controlles/states.dart';
import 'package:fawry_app/features/tapbar/presentation/screens/tapbar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  final ProductModel item;

  ProductCard({super.key, required this.item});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 880,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocConsumer<ProductCubit, ProductStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = ProductCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TapBarView();
                      },
                    ));
                  },
                ),
                title: Center(
                    child: Text(
                      'تفاصيل المنتج',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 24),
                    )),
              ),
              body: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 260,
                            child: PageView.builder(
                              controller: cubit.pageController,
                              itemCount: cubit.imageUrls.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(
                                  cubit.imageUrls[index],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Positioned(
                            top: 34,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite,
                                      color: cubit.getIconColor()),
                                  // Use getIconColor for dynamic color
                                  onPressed: () {
                                    cubit.toggleFavorite();
                                  },
                                ),
                                SizedBox(
                                  width: 230,
                                ),
                                Container(
                                    height: 40,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[700],
                                        borderRadius: BorderRadius.horizontal(
                                          // left: Radius.circular(15),
                                          right: Radius.circular(15),
                                        )),
                                    child: Center(child: Text('50% off'))),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 8,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.imageUrls.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              width: 40,
                              decoration: BoxDecoration(
                                color: cubit.currentPage == index
                                    ? Colors.blue
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  'سعر المنتج : ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.item.price,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                                Text(
                                  ' ر.س',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'تاريخ الاضافه :',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.item.date,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 45,
                                color: Colors.grey[200],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          cubit.decreaseNumber();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      cubit.number.toString(),
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          cubit.increaseNumber();
                                          if (cubit.number >= 10) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Number is 10 or more!')),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  //rating stars
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Text(widget.item.bio,style: TextStyle(fontSize: 13,color: Colors.grey),),
                    ),
                    Text(
                      'السمات',
                      style: TextStyle(fontSize: 17),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('اللون'),
                              SizedBox(
                                width: 190,
                              ),
                              Text('الحجم'),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text('اللون'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 140,
                                    width: 111,
                                    child: ListView.builder(
                                      itemCount: cubit.ColorsList.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            cubit.ColorsList[index],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          leading: Icon(
                                              Icons.check_circle_outline,
                                              color:
                                              index == cubit.colorItemIndex
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          onTap: () {
                                            cubit.colorItemIndex = index;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  Text('الحجم'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 140,
                                    width: 121,
                                    child: ListView.builder(
                                      itemCount: cubit.SizesList.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            cubit.SizesList[index],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          leading: Icon(
                                              Icons.check_circle_outline,
                                              color:
                                              index == cubit.sizeItemIndex
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          onTap: () {
                                            cubit.sizeItemIndex = index;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 50,
                      width: 400,
                      child: TextButton(
                        onPressed: () {
                          if (cubit.colorItemIndex != -1 &&
                              cubit.sizeItemIndex != -1) {
                            String selectedColor =
                            cubit.ColorsList[cubit.colorItemIndex];
                            String selectedSize =
                            cubit.SizesList[cubit.sizeItemIndex];
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Your Result"),
                                  content: SizedBox(
                                    height: 80,
                                    child: Column(
                                      children: [
                                        Text("You selected: $selectedColor"),
                                        Text("You selected: $selectedSize"),
                                        Text("You selected: ${cubit.number}"),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please select an item!"),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'اضافه الى السله',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
