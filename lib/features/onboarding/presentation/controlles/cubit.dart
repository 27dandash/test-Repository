import 'package:fawry_app/core/cubit/state.dart';
import 'package:fawry_app/features/onboarding/domain/attributes/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<AppStates> {
  OnBoardingCubit() : super(AppInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  bool lastscreen = false;
  int index = 0;

  List<Boarding> boarding = [
    Boarding(
      image: 'https://jooinn.com/images/lonely-tree-reflection-3.jpg',
      title: 'هذا النص هوا بديل يمكن ان يستبدل',
      body:
          'XD Developer Mode هي ميزة في Adobe XD ، وهي أداة تصميم ونماذج أولية ، تسمح للمطورين بفحص عناصر التصميم التي أنشأها المصممون والتفاعل معها. إنه يمكن المطورين من رؤية هيكل التصميم ، بما في ذلك الطبقات والمكونات والتفاعلات ،',
    ),
    Boarding(
      image: 'https://www.kindacode.com/wp-content/uploads/2021/01/blue.jpg',
      title: 'هذا النص هوا بديل يمكن ان يستبدل',
      body:
          'هذا النص هوا بديل يمكن ان يستبدلهذا النص هوا بديل يمكن ان يستبدلهذا النص هوا بديل يمكن ان يستبدلهذا النص هوا بديل يمكن ان يستبدل',
    ),
    Boarding(
      image:
          'https://th.bing.com/th/id/R.3d88a927f8529dcba03364b09d98adbe?rik=JYmQaMVSULpYQg&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2fnature-images.jpg&ehk=BNPsuSOUR7ATZ3EpRwxx1xFl7LUbO3tYlu1wFLCBrCE%3d&risl=&pid=ImgRaw&r=0',
      title: 'هذا النص هوا بديل يمكن ان يستبدل',
      body:
          ' مما يساعدهم على فهم كيفية تصرف المنتج النهائي ومظهره. يوفر وضع المطور عادة أدوات لفحص عناصر التصميم وتصدير الأصول وأحيانا إنشاء مقتطفات التعليمات البرمجية لتسهيل التطوير',
    ),
  ];
// onUpdateAppCubit(bool authorized){
//   emit(AuthUpdated(authorized));
// }
}
