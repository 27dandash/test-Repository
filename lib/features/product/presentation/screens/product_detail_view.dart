import 'package:fawry_app/features/product/presentation/controlles/cubit.dart';
import 'package:fawry_app/features/product/presentation/controlles/states.dart';
import 'package:fawry_app/features/tapbar/presentation/screens/tapbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

@override
@override
class _ProductDetailViewState extends State<ProductDetailView> {
  void initState() {
    // super.initState();
    ProductCubit.get(context).pageController.addListener(() {
      setState(() {
        ProductCubit.get(context).currentPage =
            ProductCubit.get(context).pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                style: TextStyle(fontWeight: FontWeight.w900),
              )),
            ),
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
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
                          top: 30,
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
                              const SizedBox(
                                width: 230,
                              ),
                              Container(
                                  height: 40,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[700],
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                        // left: Radius.circular(15),
                                        right: Radius.circular(15),
                                      )),
                                  child: const Center(child: Text('50% off'))),
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
                      itemCount: cubit.image.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 50,
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'سرير تركي',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'سعر المنتج :',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' 8000 ر.س',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
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
                                ' 22/02/2023',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
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
                              color: Colors.grey[200],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,

                                      borderRadius: BorderRadius.circular(100),
                                      // border: Border.all(width: 2, color: Colors.white)
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (cubit.number > 0) {
                                            cubit.number--;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    cubit.number.toString(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        cubit.number++;
                                        if (cubit.number >= 10) {
                                          // Show Snackbar notification
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Number is 10 or more!')),
                                          );
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: const Text(
                        'هذا النص هو مثال لنص يمكن ان يستبدل بنص اخر نفس المساحة لقد تم توليد النص من مولد النص هذا النص هو مثال لنص يمكن ان يستبدل بنص اخر نفس المساحة لقد تم توليد النص من مولد النص'),
                  ),
                  const Text(
                    'السمات',
                    style: TextStyle(fontSize: 17),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Row(
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
                            Container(
                              height: 160,
                              width: 111,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: cubit.ColorsList.length,
                                itemBuilder: (context, index) {
                                  return
                                    ListTile(
                                      visualDensity: VisualDensity(
                                          horizontal: -4, vertical: 0),
                                      // Center(
                                      //   child: IconButton(
                                      //     icon: Icon(
                                      //       _isPressed ? Icons.favorite : Icons.favorite_border,
                                      //       color: _isPressed ? Colors.red : null,
                                      //     ),
                                      //     onPressed: _toggleIcon,
                                      //   ),
                                      // ),
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

                                      // Icon(Icons.check_circle_outline,
                                      //     color: index == cubit.colorItemIndex
                                      //         ? Colors.blue
                                      //         : Colors.white),
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
                              width: 80,
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
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    leading: Icon(Icons.check_circle_outline,
                                        color: index == cubit.sizeItemIndex
                                            ? Colors.blue
                                            : Colors.grey),
                                    onTap: () {
                                      setState(() {
                                        cubit.sizeItemIndex = index;
                                      });
                                    },
                                  );
                                },
                              ),
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
                                title: const Text("Your Result"),
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
          );
        },
      ),
    );
  }
}
