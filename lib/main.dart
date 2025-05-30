import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/shared_prefrences.dart';
import 'package:fruits_hub/core/widgets/build_bottom_bar.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/home_view/data/models/search_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utilis/app_routers.dart';
import 'core/utilis/constants.dart';

import 'core/utilis/services/fire_base/fire_auth_service.dart';
import 'core/utilis/services/supabase/subabase_data_base_service.dart';
import 'core/utilis/services/supabase/supabase_storage_service.dart';
import 'core/utilis/styles.dart';
import 'features/home_view/data/repo_impl/product_repo-impl.dart';
import 'features/home_view/presentation/manager/products_cubit/products_cubit.dart';
import 'features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'features/login_view/presentation/manager/signup_cubit/signup_cubit.dart';
import 'firebase_options.dart';

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
      BlocProvider<CartCubit>(create: (BuildContext context) {
        return CartCubit();
      },)
      ],
          child: const MyApp()
      ),
    ),
  ) // Wrap your app
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
    );
  }
}
