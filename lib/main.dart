import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:fruits_hub/core/utilis/shared_prefrences.dart';
import 'package:fruits_hub/core/widgets/build_bottom_bar.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/home_view/data/models/search_item_model.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/search_cubit/search_cubit.dart';
import 'package:fruits_hub/features/profile_view/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:fruits_hub/features/shipping_view/data/repos_impl/order_repo_impl.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utilis/app_routers.dart';
import 'core/utilis/constants.dart';

import 'core/utilis/services/fire_base/fire_auth_service.dart';
import 'core/utilis/services/fire_base/fire_store_service.dart';
import 'core/utilis/services/supabase/subabase_data_base_service.dart';
import 'core/utilis/services/supabase/supabase_storage_service.dart';
import 'core/utilis/styles.dart';
import 'features/home_view/data/repo_impl/product_repo-impl.dart';
import 'features/home_view/presentation/manager/products_cubit/products_cubit.dart';

import 'features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'features/login_view/presentation/manager/singin_cubit/signin_cubit.dart';
import 'features/profile_view/data/models/card_model.dart';

import 'features/profile_view/presentation/manager/card_cubit/card_cubit.dart';
import 'features/profile_view/presentation/views/widgets/language_notifier.dart';
import 'features/profile_view/presentation/views/widgets/theme_notifier.dart';
import 'features/shipping_view/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'features/shipping_view/presentation/manager/set_orderes_cubit/set_orders_cubit.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingelton.init(); //create instance from shared pref
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  await SupaBaseDataBaseService.initSupabase(); // initialize supa
  // await SupaBaseStorageService.createBucket(kImagesStorage);// create bucket
  await Hive.initFlutter();
  Hive.registerAdapter(SearchItemModelAdapter());
  await Hive.openBox<SearchItemModel>(kSearchHistory);
  Hive.registerAdapter(CardModelAdapter());
  await Hive.openBox<CardModel>(kCards);


  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabControllerProvider()),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<ProductsCubit>(
          create: (BuildContext context) {
            return ProductsCubit(
                productRepo: ProductRepoImpl(
                    supabaseDataBaseService: SupaBaseDataBaseService()));
          },
        ),
        BlocProvider<CartCubit>(
          create: (BuildContext context) {
            return CartCubit();
          },
        ),
        BlocProvider<SetOrdersCubit>(
          create: (BuildContext context) {
            return SetOrdersCubit(
                orderRepo: OrderRepoImp(
                    supabaseDataBaseService: SupaBaseDataBaseService()));
          },
        ),
        BlocProvider<GetOrdersCubit>(
          create: (BuildContext context) {
            return GetOrdersCubit(
                orderRepo: OrderRepoImp(
                    supabaseDataBaseService: SupaBaseDataBaseService()));
          },
        ),
      BlocProvider<SigninCubit>(
          create: (context) {
           return SigninCubit(authRepo: AuthRepoImpl(
                fireBaseAuthService: FireAuthService(),
                fireStoreService: FireStoreService(),
                supaBaseDataBaseService: SupaBaseDataBaseService()));
          }),

        BlocProvider<SearchCubit>(
            create: (context) {
              return SearchCubit();
            }),

        BlocProvider<CardCubit>(
            create: (context) {
              return CardCubit();
            }),

        BlocProvider<FavoriteCubit>(
            create: (context) {
              return FavoriteCubit();
            }),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),

        ChangeNotifierProvider(create: (_) => LanguageProvider()),


      ], child: const MyApp()),
    ),
  ) // Wrap your app
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        return MaterialApp.router(
          routerConfig: AppRouters.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(),
          darkTheme: ThemeData.dark().copyWith(),
          themeMode: themeProvider.themeMode,
          locale: languageProvider.locale, // هنا نربط اللغة المختارة
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}

