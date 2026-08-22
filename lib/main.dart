import '/screens/students_screen/cubit/student_cubit.dart';
import '/db/box_manager.dart';
import '/screens/groups_screen/cubit/group_cubit.dart';
import '/models/group_model.dart';
import '/models/student_model.dart';
import '/simple_bloc_observer.dart';
import 'features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(GroupModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  await BoxManager.instance.initialize();
  runApp(const Nahj());
}

class Nahj extends StatelessWidget {
  const Nahj({super.key});
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
          debugShowCheckedModeBanner: false,
          routes: {
            'SplashScreen': (context) => const Splashscreen(),
          },
          initialRoute: 'SplashScreen',
        ),
      ),
    );
  }
}
