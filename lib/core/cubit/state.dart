
abstract class AppStates  {}

class AppInitialState extends AppStates {}



class FawryGetDataState extends AppStates {}
class FawryGetSuccessDataState extends AppStates {}
class FawryGetErrorDataState extends AppStates {
  final String error;
  FawryGetErrorDataState(this.error);
}

// -------------------- PasswordVisibility
class SocialPasswordVisibilityState extends AppStates {}


// -------------------- Translation

class ChangeLanguageState extends AppStates {}

class LanguageLoaded extends AppStates {}

// -------------------- no internet

class InternetState extends AppStates {}


// ------------------------------------------language

class ChangeThemeloadState extends AppStates {}

class ChangeThemeSuccessState extends AppStates {}
class ChangeThemeErrorState extends AppStates {}

