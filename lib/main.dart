import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashhub_app/core/dependency_injection/di.dart' as di;
import 'package:slashhub_app/core/dependency_injection/di.dart';
import 'package:slashhub_app/core/networking/api_services.dart';
import 'package:slashhub_app/features/search/data/data_sources/search_movie_data_source.dart';
import 'package:slashhub_app/features/search/presentation/cubit/search_cubit.dart';

import 'core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init().then(
    (value) {
      ApiServices.init();
    },
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 994),
      builder: (context, child) {
        return MyApp();
      },
    ),
  );
}
