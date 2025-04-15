import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver{
  void onChanged(BlocBase bloc,Change change){
    super.onChange(bloc, change);

      if(kDebugMode){
        log('${bloc.runtimeType}$change');
      }

  }
}