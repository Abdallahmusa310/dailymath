import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nahj/features/auth/choose_account/choose_account_screen.dart';
import 'package:nahj/features/auth/parent/presentation/screens/parent_login_screen.dart';
import 'package:nahj/features/auth/parent/presentation/screens/parent_signup_screen.dart';
import 'package:nahj/features/auth/teacher/presentation/screens/teacher_login_screen.dart';
import 'package:nahj/features/auth/teacher/presentation/screens/teacher_signup_screen.dart';
import 'package:nahj/features/home/parent/presentation/screens/parent_home_screen.dart';
import 'package:nahj/features/home/teacher/presentation/screens/teacher_home_screen.dart';
import 'package:nahj/features/splash/splash_screen.dart';

final GoRouter router = GoRouter(initialLocation: '/Splashscreen', routes: [
  GoRoute(
    path: '/Splashscreen',
    builder: (BuildContext context, GoRouterState state) {
      return const Splashscreen();
    },
  ),
  GoRoute(
    path: '/TeacherHomeScreenn',
    builder: (BuildContext context, GoRouterState state) {
      return const TeacherHomeScreen();
    },
  ),
  GoRoute(
    path: '/ParentHomeScreen',
    builder: (BuildContext context, GoRouterState state) {
      return const ParentHomeScreen();
    },
  ),
  GoRoute(
    path: '/ParentSignupScreen',
    builder: (BuildContext context, GoRouterState state) {
      return const ParentSignupScreen();
    },
  ),
  GoRoute(
    path: '/ParentLoginScreen',
    builder: (BuildContext context, GoRouterState state) {
      return const ParentLoginScreen();
    },
  ),
  GoRoute(
    path: '/TeacherSignUpScreen',
    builder: (BuildContext context, GoRouterState state) {
      return const TeacherSignUpScreen();
    },
  ),
  GoRoute(
    path: '/TeacherLoginScreen',
    builder: (BuildContext context, GoRouterState state) {
      return const TeacherLoginScreen();
    },
  ),
  GoRoute(
    path: '/ChooseAccountScreen',
    builder: (BuildContext context, GoRouterState state) {
      return const ChooseAccountScreen();
    },
  )
]);
