import 'package:dialymath/db/BoxManager.dart';
import 'package:dialymath/screens/groups_screen/cubit/group_cubit.dart';
import 'package:dialymath/models/group_model.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/screens/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/simple_bloc_observer.dart';
import 'package:dialymath/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(GroupModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  await BoxManager.instance.initialize();
  runApp(const Dialymath());
}

class Dialymath extends StatelessWidget {
  const Dialymath({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GroupCubit(),
          ),
          BlocProvider(create: (context) => StudentCubit())
        ],
        child: MaterialApp(
          home: const Splashscreen(),
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('en'), // English first
            Locale('ar'), // Arabic
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routes: {
            'SplashScreen': (context) => const Splashscreen(),
          },
          initialRoute: 'SplashScreen',
        ),
      ),
    );
  }
}
