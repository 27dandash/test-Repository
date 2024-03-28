import 'package:fawry_app/core/cubit/state.dart';
import 'package:fawry_app/features/product/presentation/controlles/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductAppInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  //Icon In The Photo
  bool isFavorite = false;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    emit(AppToggleFavoriteState());
  }

  Color getIconColor() {
    return isFavorite
        ? Colors.red
        : Colors.grey; // Change color based on favorite status
  }

//image indecator
  final PageController pageController = PageController();
  final List<String> image = [
    'https://cdn.photographylife.com/wp-content/uploads/2014/09/Nikon-D750-Image-Samples-2.jpg',
    'https://wallpapercave.com/wp/wp2858553.jpg',
    'https://wallpaperset.com/w/full/0/d/5/183330.jpg',
  ];
  int currentPage = 0;

  @override
  // Icon Under The Photo

  int number = 0;

  //
  void increaseNumber() {
    number++;
    if (number >= 10) {
      // Show Snackbar notification
    }
    emit(AppIncreaseNumberState());
  }

  //
  void decreaseNumber() {
    if (number > 0) {
      number--;
    }
    emit(AppDecreaseNumberState());
  }

//Select icon
  int colorItemIndex = 0;
  int sizeItemIndex = 0;
  final List<String> ColorsList = ["احمر", "ابيض", "اصفر"];
  final List<String> SizesList = ["كبير", "متوسط", "صغير"];
  // void initState() {
  //   // super.initState();
  //   ProductCubit.get(context).pageController.addListener(() {
  //
  //     ProductCubit.get(context).currentPage =
  //         ProductCubit.get(context).pageController.page!.round();
  //   });
  //   emit(AppSelectColorState());
  // }
  final List<ProductModel> ProductData = [
    ProductModel(
        image: [
          'https://cdn.photographylife.com/wp-content/uploads/2014/09/Nikon-D750-Image-Samples-2.jpg',
          'https://wallpapercave.com/wp/wp2858553.jpg',
          'https://wallpaperset.com/w/full/0/d/5/183330.jpg',
        ],
        name: 'سرير تركي',
        price: '8000',
        rating: 5,
        discount: '50',
        date: '25/5/2000',
        bio:
            'هذا النص هو مثال لنص يمكن ان يستبدل بنص اخر نفس المساحة لقد تم توليد النص من مولد النص هذا النص هو مثال لنص يمكن ان يستبدل بنص اخر نفس المساحة لقد تم توليد النص من مولد النص'),
  ];
}
