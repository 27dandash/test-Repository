import 'package:fawry_app/features/product/domain/entities/model.dart';
import 'package:fawry_app/features/product/presentation/components/star_rating.dart';
import 'package:fawry_app/features/product/presentation/controlles/cubit.dart';
import 'package:fawry_app/features/product/presentation/controlles/states.dart';
import 'package:fawry_app/features/tapbar/presentation/screens/tapbar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  final ProductModel item;

  ProductCard({super.key, required this.item});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void initState() {
    ProductCubit.get(context).pageController.addListener(() {
      setState(() {
        ProductCubit.get(context).currentPage =
            ProductCubit.get(context).pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 880,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocConsumer<ProductCubit, ProductStates>(
          listener: (context, state) {
          },
          builder: (context, state) {
            var cubit = ProductCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const TapBarView();
                      },
                    ));
                  },
                ),
                title: const Center(
                    child: Text(
                  'تفاصيل المنتج',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                )),
              ),
              body: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
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
                              itemCount: cubit.image.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(
                                  cubit.image[index],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                        Positioned(
                            top: 34,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite,
                                      color: cubit.getIconColor()),
                                  onPressed: () {
                                    cubit.toggleFavorite();
                                  },
                                ),
                                const SizedBox(
                                  width: 230,
                                ),
                                Container(
                                    height: 40,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[900],
                                        borderRadius: const BorderRadius.horizontal(
                                          right: Radius.circular(15),
                                        )),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'off% ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          widget.item.discount,
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ))),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.image.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  width: 36,
                                  decoration: BoxDecoration(
                                    color: cubit.currentPage == index
                                        ? Colors.blue[700]
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'سعر المنتج : ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.item.price,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                                const Text(
                                  ' ر.س',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'تاريخ الاضافه :',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.item.date,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 45,
                                width: 120,
                                color: Colors.grey[200],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.grey,
                                            size: 18,
                                            weight: 200,
                                          ),
                                          onPressed: () {
                                            cubit.decreaseNumber();
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      cubit.number.toString(),
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                          size: 18,
                                          weight: 200,
                                        ),
                                        onPressed: () {
                                          cubit.increaseNumber();
                                          if (cubit.number >= 10) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Number is 10 or more! Your number is ${cubit.number}')),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  StarRatingWidget(rating:widget.item.rating),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Text(
                        widget.item.bio,
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      children: [
                        Text(
                          'السمات',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'اللون',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 155,
                              ),
                              Text('الحجم', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,
                                width: 111,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cubit.ColorsList.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      visualDensity: const VisualDensity(
                                          horizontal: -4, vertical: 0),
                                      title: Text(
                                        cubit.ColorsList[index],
                                        style: const TextStyle(fontSize: 12),
                                      ),

                                      leading: Icon(
                                        index == cubit.colorItemIndex
                                            ? Icons.check_circle
                                            : Icons.circle_outlined,
                                        color: index == cubit.colorItemIndex
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),

                                      onTap: () {
                                        setState(() {
                                          cubit.colorItemIndex = index;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              Container(
                                height: 160,
                                width: 120,

                                child: ListView.builder(

                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cubit.SizesList.length,
                                  itemBuilder: (context, index) {
                                    return  Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(50)),


                                      ),
                                      child: ListTile(
                                          visualDensity: const VisualDensity(
                                              horizontal: -4, vertical: 0),
                                          title: Text(
                                            cubit.SizesList[index],
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          leading: Icon(
                                            index == cubit.sizeItemIndex
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            color: index == cubit.sizeItemIndex
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              cubit.sizeItemIndex = index;
                                            });
                                          },
                                        ),
                                    );

                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
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
                                        title: const Text("Your Result"),
                                        content: SizedBox(
                                          height: 120,
                                          child: Column(
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "You selected: $selectedColor"),
                                              Text(
                                                  "You selected: $selectedSize"),
                                              Text(
                                                  "You selected: ${cubit.number}"),
                                              Row(
                                                children: [
                                                  const Text('is Favorite : '),
                                                  Text(cubit.isFavorite
                                                      ? 'true'
                                                      : 'false'),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('OK'),
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
