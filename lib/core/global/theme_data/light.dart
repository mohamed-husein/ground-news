import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/global/theme_color/theme_color_light.dart';
import 'package:news_app/core/utils/app_fonts.dart';
import 'package:news_app/core/utils/app_sizes.dart';

ThemeData get getThemeDataLight => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ThemeColorLight.primaryColor,
      brightness: Brightness.light,
      primaryIconTheme: const IconThemeData(
        color: ThemeColorLight.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeColorLight.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: ThemeColorLight.white),
        iconTheme: const IconThemeData(color: ThemeColorLight.black),
      ),
      fontFamily: AppFonts.fontFamily,
      textTheme: getTextTheme(),
    );

getTextTheme() => TextTheme(
      displaySmall: TextStyle(
        color: ThemeColorLight.grey,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      displayMedium: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs26,
        fontWeight: AppFonts.medium,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
          color: ThemeColorLight.black,
          fontSize: AppSizes.fs45,
          fontWeight: AppFonts.extraBold,
          fontFamily: AppFonts.fontFamily,
          height: AppSizes.pH1),
      headlineLarge: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs48,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineSmall: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs14,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      bodySmall: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.bold,
        overflow: TextOverflow.ellipsis,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      titleSmall: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      titleMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.extraBold,
        fontFamily: AppFonts.fontFamily,
      ),
      titleLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.extraBold,
        fontFamily: AppFonts.fontFamily,
      ),
      labelSmall: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs15,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      labelMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs15,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
      labelLarge: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs14,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamily,
      ),
    );
