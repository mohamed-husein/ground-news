import 'package:flutter/material.dart';
import 'package:news_app/core/global/theme_data/light.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/core/utils/import_files.dart';
import 'package:news_app/news/presentation/screens/home_screen.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: false,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appTitle,
          theme: getThemeDataLight,
          home:const HomeScreen(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
        );
      },
    );
  }
}
