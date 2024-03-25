import 'package:fawry_app/core/cubit/cubit.dart';
import 'package:fawry_app/core/network/local/SharedPreferences.dart';
import 'package:fawry_app/translation.dart';
import 'package:flutter/material.dart';

import 'components.dart';

String? token;

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      showToast(
          message: 'Sign out Successfully', toastStates: ToastStates.SUCCESS);
    //  navigateFinish(context, LoginScreen());
    }
  });
}


void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

// ------------------- Translation
bool isRtl = false;

TranslationModel appTranslation(context) =>AppCubit.get(context).translationModel;

String displayTranslatedText({
  required BuildContext context,
  required String ar,
  required String en,
}) => isRtl ? ar : en;

