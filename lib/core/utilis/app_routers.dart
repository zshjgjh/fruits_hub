


import 'package:fruits_hub/features/login_view/presentation/create_account_view.dart';
import 'package:fruits_hub/features/login_view/presentation/loginn_view.dart';
import 'package:fruits_hub/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash_view/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/dash_board/presentation/views/home_view.dart';





abstract class AppRouters {
  static const kSplashView = '/';
  static const kBoardingView = '/onBoarding';
  static const kLoginView = '/loginview';
  static const kCreateAccount = '/createaccountview';





  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kCreateAccount,
        builder: (context, state) => const CreateAccountView(),
      ),

    ],);
}