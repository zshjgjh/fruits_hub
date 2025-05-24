import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/services/data_base_service.dart';
import 'package:fruits_hub/core/utilis/services/fire_base/fire_auth_service.dart';
import 'package:fruits_hub/core/utilis/services/fire_base/fire_store_service.dart';
import 'package:fruits_hub/core/utilis/services/supabase/subabase_data_base_service.dart';
import 'package:fruits_hub/features/home_view/presentation/views/main_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/notification_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/best_seller_view.dart';
import 'package:fruits_hub/features/login_view/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/login_view/presentation/views/check_code_view.dart';
import 'package:fruits_hub/features/login_view/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/login_view/presentation/views/forget_password_view.dart';

import 'package:fruits_hub/features/login_view/presentation/views/new_password_view.dart';
import 'package:fruits_hub/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash_view/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/home_view/presentation/views/search_view.dart';
import '../../features/login_view/data/repos_impl/auth_repo_impl.dart';
import '../../features/login_view/presentation/views/signin_view.dart';


abstract class AppRouters {
  static const kSplashView = '/';
  static const kBoardingView = '/onBoarding';
  static const kLoginView = '/loginview';
  static const kCreateAccount = '/createaccountview';
  static const kForgetPassword = '/forgetpassword';
  static const kCheckCode = '/checkcodeview';
  static const kNewPassword = '/newpassword';
  static const kHomeView = '/homeview';
  static const kBestSeller = '/bestseller';
  static const kProducts = '/products';
  static const kSearch = '/search';
  static const kNotification = '/notification';



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
        builder: (context, state) =>const SigninView(),
      ),
      GoRoute(
        path: kCreateAccount,
        builder: (context, state) =>
            BlocProvider<SignUpCubit>(
              create: (context) => SignUpCubit(authRepo: AuthRepoImpl(fireBaseAuthService: FireAuthService(), fireStoreService: FireStoreService(), supaBaseDataBaseService: SupaBaseDataBaseService())),
              child: SignupView(),
            ),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kCheckCode,
        builder: (context, state) => const CheckCodeView(),
      ),
      GoRoute(
        path: kNewPassword,
        builder: (context, state) => const NewPasswordView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: kBestSeller,
        builder: (context, state) => const BestSellerView(),
      ),
      GoRoute(
        path: kProducts,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kNotification,
        builder: (context, state) => const NotificationView(),
      ),


    ],);

}