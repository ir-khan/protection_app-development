import 'package:hive_flutter/hive_flutter.dart';
import 'package:protection_app/app/data/models/local/local_media_model.dart';
import 'package:protection_app/app/data/models/local/media_model.dart';

late Box<LocalMediaModel> mediaBox;
late Box<bool> vaultOnboarding;
late Box<String> vaultPassword;
late Box<bool> securelyOnboarding;
late Box<bool> appOnboarding;
late Box<String> userBox;
late Box<bool> dataBreachOnBoarding;
late Box<bool> isPremium;
late Box<bool> isTrue;

Future<void> hiveInit() async {
  await Hive.initFlutter();
  hiveRegisterAdapter();
  await hiveBox();
}

Future<void> hiveBox() async {
  mediaBox = await Hive.openBox<LocalMediaModel>('photos');
  vaultOnboarding = await Hive.openBox<bool>('vaultOnboarding');
  vaultPassword = await Hive.openBox<String>('vaultPassword');
  securelyOnboarding = await Hive.openBox<bool>('securelyOnboarding');
  appOnboarding = await Hive.openBox<bool>('appOnboarding');
  userBox = await Hive.openBox<String>('user');
  dataBreachOnBoarding = await Hive.openBox<bool>('dataBreachOnBoarding');
  isPremium = await Hive.openBox<bool>('isPremium');
  isTrue = await Hive.openBox<bool>('isTrue');
}

void hiveRegisterAdapter() {
  Hive.registerAdapter<LocalMediaModel>(LocalMediaModelAdapter());
  Hive.registerAdapter<MediaModel>(MediaModelAdapter());
}
