import 'package:fawry_app/core/cubit/state.dart';
import 'package:fawry_app/features/tapbar/domain/entities/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TapbarCubit extends Cubit<AppStates> {
  TapbarCubit() : super(AppInitialState());

  static TapbarCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    Text('Page 1'),
    Text('Page 2'),
    Text('Page 3'),
  ];
  final List<PropertyModel> PropertyData = [
    PropertyModel(
      aqarname: 'النور',
      date: '20/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكة العربية السعودية',
      city: 'الرياض',
    ),
    PropertyModel(
      aqarname: 'النور',
      date: '20/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكة العربية السعودية',
      city: 'الرياض',
    ),
    PropertyModel(
      aqarname: 'النور',
      date: '20/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكة العربية السعودية',
      city: 'الرياض',
    ),
    PropertyModel(
      aqarname: 'النور',
      date: '20/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكة العربية السعودية',
      city: 'الرياض',
    ),
    PropertyModel(
      aqarname: 'النور',
      date: '20/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكة العربية السعودية',
      city: 'الرياض',
    ),
  ];
  final List<ContractsModel> ContractsData = [
    ContractsModel(
      aqarname: 'النور',
      date: '20/5/2023',
      unit: '#12345',
      renter: 'المملكة العربية السعودية',
      time: 'الرياض',
    ),
    ContractsModel(
      aqarname: 'النور',
      date: '20/5/2023',
      unit: '#12345',
      renter: 'المملكة العربية السعودية',
      time: 'الرياض',
    ),
    ContractsModel(
      aqarname: 'النور',
      date: '20/5/2023',
      unit: '#12345',
      renter: 'المملكة العربية السعودية',
      time: 'الرياض',
    ),
    ContractsModel(
      aqarname: 'النور',
      date: '20/5/2023',
      unit: '#12345',
      renter: 'المملكة العربية السعودية',
      time: 'الرياض',
    ),
  ];
}
