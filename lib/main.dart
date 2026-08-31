import 'package:easy_localization/easy_localization.dart';
import 'package:nahj/core/app/nahj_app.dart';
import '/db/box_manager.dart';
import '/models/group_model.dart';
import '/models/student_model.dart';
import '/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(GroupModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  await BoxManager.instance.initialize();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('ar'), Locale('en')],
    path: 'assets/translation',
    fallbackLocale: const Locale('ar'),
    startLocale: const Locale('ar'),
    saveLocale: true,
    useOnlyLangCode: true,
    child: const Nahj(),
  ));
}
