// Cores
import 'package:flutter/material.dart';

class AppLanguageHelper {
  ///Default Language
  static Locale defaultLanguage = Locale('en');

  ///List Language support in Application
  static List<Locale> supportLanguage = [
    Locale('en'),
    Locale('ja'),
  ];

  ///Singleton factory
  static final AppLanguageHelper _instance = AppLanguageHelper._internal();

  factory AppLanguageHelper() {
    return _instance;
  }

  AppLanguageHelper._internal();
}
