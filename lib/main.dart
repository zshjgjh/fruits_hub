import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/shared_prefrences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utilis/app_routers.dart';
import 'core/utilis/constants.dart';
import 'core/utilis/services/supabase/supabase_storage_service.dart';
import 'core/utilis/styles.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingelton.init();//create instance from shared pref
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SupaBaseStorageService.initSupabase(); // initialize supa
//  await SupaBaseDataBase.initSupabase();
  // await SupaBaseStorageService.createBucket(kImagesStorage);// create bucket
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
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
