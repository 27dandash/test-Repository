
import 'package:fawry_app/core/cubit/state.dart';
import 'package:fawry_app/features/tapbar/Data/model/model.dart';
import 'package:fawry_app/features/tapbar/domain/entities/model.dart';
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

   void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
   }

  final List<aqar> aqarData = [
    aqar(
      aqarname: 'النور',
      date: '25/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكه الربيه السعوديه',
      city: 'الرياض',
    ),aqar(
      aqarname: 'النور',
      date: '25/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكه الربيه السعوديه',
      city: 'الرياض',
    ),
    aqar(
      aqarname: 'النور',
      date: '25/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكه الربيه السعوديه',
      city: 'الرياض',
    ),
    aqar(
      aqarname: 'النور',
      date: '25/5/2023',
      aqarnumber: '#12345',
      contry: 'المملكه الربيه السعوديه',
      city: 'الرياض',
    ),
  ];
  final List<aqaod> aqodData = [
    aqaod(
    aqarname: 'النور',
    date: '25/5/2023',
    unit: '#12345',
    renter: 'المملكه الربيه السعوديه',
    time: 'الرياض',
    ),  aqaod(
    aqarname: 'النور',
    date: '25/5/2023',
    unit: '#12345',
    renter: 'المملكه الربيه السعوديه',
    time: 'الرياض',
    ),
    aqaod(
      aqarname: 'النور',
      date: '25/5/2023',
      unit: '#12345',
      renter: 'المملكه الربيه السعوديه',
      time: 'الرياض',
    ), aqaod(
      aqarname: 'النور',
      date: '25/5/2023',
      unit: '#12345',
      renter: 'المملكه الربيه السعوديه',
      time: 'الرياض',
    ),
  ];

  // onUpdateAppCubit(bool authorized){
  //   emit(AuthUpdated(authorized));
  // }
}